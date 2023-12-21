//
//  MainPageViewController.swift
//  CPBLQuiz
//
//  Created by Nick Lu on 2023/12/20.
//

import UIKit

class MainPageViewController: UIViewController {
    
    @IBOutlet weak var playersButton: UIButton!
    @IBOutlet weak var girlsButton: UIButton!
    
    var questionType = ""
    var utils = Utils()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBackground()
        utils.setButtonStyle(button: playersButton)
        utils.setButtonStyle(button: girlsButton)
    }
    
    @IBAction func startPlayersGameAction(_ sender: UIButton) {
        questionType = "players"
        self.performSegue(withIdentifier: "startGameSegue", sender: self)
    }
    
    @IBAction func startGirlsGameAction(_ sender: UIButton) {
        questionType = "girls"
        self.performSegue(withIdentifier: "startGameSegue", sender: self)
    }
    
    
    @IBSegueAction func startGameSegueAction(_ coder: NSCoder) -> QuizViewController? {
        let quizViewController = QuizViewController(coder: coder)
        quizViewController?.questionType = self.questionType
        return quizViewController
    }
    
    func addBackground() {
        let imageViewBackground = utils.addBackground(backgroundName: "background3")
        self.view.addSubview(imageViewBackground)
        self.view.sendSubviewToBack(imageViewBackground)
    }
    
}
