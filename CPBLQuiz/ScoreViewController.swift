//
//  ScoreViewController.swift
//  CPBLQuiz
//
//  Created by Nick Lu on 2023/12/18.
//

import UIKit

class ScoreViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var backMainPageButton: UIButton!
    
    var score: Int = 0
    var utils = Utils()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        utils.setButtonStyle(button: playAgainButton)
        utils.setButtonStyle(button: backMainPageButton)
        addBackground()
        scoreLabel.text = "\(score)"
    }
    
    @IBAction func backToQuizButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func backToMainPageTapper(_ sender: UIButton) {
        self.view.window!.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    func addBackground() {
        let imageViewBackground = utils.addBackground(backgroundName: "background")
        self.view.addSubview(imageViewBackground)
        self.view.sendSubviewToBack(imageViewBackground)
    }
}
