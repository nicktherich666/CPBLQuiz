//
//  QuizViewController.swift
//  CPBLQuiz
//
//  Created by Nick Lu on 2023/12/14.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionNumberLabel: UILabel!
    @IBOutlet var optionButtons: [UIButton]!
    
    var questions: [Question] = []
    var currentQuestionIndex = 0 {
        didSet {
            loadQuestion()
        }
    }
    var score = 0
    var questionType = ""
    var utils = Utils()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBackground()
        if self.questionType == "players" {
            questions = utils.setupPlayersQuestions()
        } else if self.questionType == "girls" {
            questions = utils.setupGirlsQuestions()
        } else {
            self.dismiss(animated: true, completion: nil)
        }
        questions.shuffle()
        loadQuestion()
        
        for optionButton in optionButtons {
            utils.setButtonStyle(button: optionButton)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        score = 0
        questions.shuffle()
        currentQuestionIndex = 0
    }

    @IBAction func optionButtonTapped(_ sender: UIButton) {
        guard let selectedIndex = optionButtons.firstIndex(of: sender) else { return }
        print("select : \(selectedIndex)")
        
        let question = questions[currentQuestionIndex]
        let alertController: UIAlertController
        print("question.correctAnswer : \(question.correctAnswer)")
        
        if question.correctAnswer == question.options[selectedIndex] {
            score += 10
            alertController = UIAlertController(title: "答對了！", message: "你答對了這題，繼續加油！", preferredStyle: .alert)
        } else {
            var message = ""
            if question.description != "" {
                message = "正確答案是：\(question.correctAnswer)。\r\n\(question.description)"
            } else {
                message = "正確答案是：\(question.correctAnswer)。"
            }
            alertController = UIAlertController(title: "答錯了！", message: message, preferredStyle: .alert)
        }
        
        alertController.addAction(UIAlertAction(title: "繼續", style: .default, handler: { _ in
            self.currentQuestionIndex += 1
        }))
        
        present(alertController, animated: true, completion: nil)
    }
    
    @IBSegueAction func showResultSegueAction(_ coder: NSCoder) -> ScoreViewController? {
        let scoreViewController = ScoreViewController(coder: coder)
        scoreViewController?.score = self.score
        return scoreViewController
    }
    
    func loadQuestion() {
        if currentQuestionIndex < 10 {
            let question = questions[currentQuestionIndex]
            questionLabel.text = question.question
            questionNumberLabel.text = "題目 \(currentQuestionIndex + 1) / 10"
            
            for (index, optionButton) in optionButtons.enumerated() {
                optionButton.setTitle(question.options[index], for: .normal)
            }
        } else {
            showFinishedAlert()
        }
    }
    
    func showFinishedAlert() {
        let alertController = UIAlertController(title: "完成", message: "您已完成所有題目！", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "確定", style: .default) { _ in
            self.performSegue(withIdentifier: "showResultSegue", sender: self)
        }
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
    
    func addBackground() {
        let imageViewBackground = utils.addBackground(backgroundName: "background3")
        self.view.addSubview(imageViewBackground)
        self.view.sendSubviewToBack(imageViewBackground)
    }
}

