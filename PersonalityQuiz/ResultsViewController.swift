//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Arii on 2024-03-27.
//

import UIKit

class ResultsViewController: UIViewController {

    var responses: [Answer]
    init?(coder: NSCoder, responses: [Answer]) {
        self.responses = responses
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @IBOutlet var animalLabel: [UILabel]!
    
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    @IBOutlet weak var resultAnswerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        calculatePersonalityResult()
        navigationItem.hidesBackButton = true
    }
    
    func calculatePersonalityResult(){
        let frequencyOfAnswers = responses.reduce(into: [:]){
            (counts, answer) in
            counts[answer.type, default: 0] += 1
        }
        let mostCommonAnswer = frequencyOfAnswers.sorted{ $0.1 > $1.1 }.first!.key
        
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition
    }
}

//loop over resonses to calucalte the responses in every resp.
/*
 let pair = [String:Int]()
 for answer in responses{
     let type = answer.type
     if let type == pair[type]{
        pair[type] =+ 1
     } else {
        pair[type] = 1
     }
 }
 */
