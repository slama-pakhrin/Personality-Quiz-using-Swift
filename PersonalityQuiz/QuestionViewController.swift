//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by Arii on 2024-03-27.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var singleButton4: UIButton!
    @IBOutlet weak var singleButton3: UIButton!
    @IBOutlet weak var singleButton2: UIButton!
    @IBOutlet weak var singleButton1: UIButton!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var multipleButton4: UILabel!
    @IBOutlet weak var multipleButton3: UILabel!
    @IBOutlet weak var multipleButton2: UILabel!
    @IBOutlet weak var multipleButton1: UILabel!
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var rangedButton2: UILabel!
    @IBOutlet weak var rangedButton1: UILabel!
    
    @IBOutlet var questionProgressView: UIProgressView!
    
    var questions: [Question] = [
        Question(
            text: "Which food do you like the most?",
            type: .single,
            answers: [
                Answer(text: "Steak", type: .dog),
                Answer(text: "Fish", type: .cat),
                Answer(text: "Honey", type: .butterfly),
                Answer(text: "Non-spicy", type: .snake)
            ]),
        Question(
            text: "What's your preferred way to spend a lazy afternoon?",
            type: .single,
            answers: [
                Answer(text: "Playing at the park", type: .dog),
                Answer(text: "Napping in a sunbeam", type: .cat),
                Answer(text: "Exploring gardens and flowers", type: .butterfly),
                Answer(text: "Basking in the warmth of a sunny spot", type: .snake)
            ]),
        Question(
            text: "What's your favorite type of weather?",
            type: .single,
            answers: [
                Answer(text: "Warm and sunny", type: .dog),
                Answer(text: "Cool and breezy", type: .cat),
                Answer(text: "Mild and pleasant", type: .butterfly),
                Answer(text: "Varied, but not too extreme", type: .snake)
            ]),
        Question(
            text: "How do you handle conflicts or disagreements?",
            type: .single,
            answers: [
                Answer(text: "Confront them head-on", type: .dog),
                Answer(text: "Avoid confrontation and seek peace", type: .cat),
                Answer(text: "Communicate openly and diplomatically", type: .butterfly),
                Answer(text: "Keep your distance and observe", type: .snake)
            ]),
        Question(
            text: "Which environment do you feel most comfortable in?",
            type: .single,
            answers: [
                Answer(text: "Urban cityscape", type: .dog),
                Answer(text: "Cozy home environment", type: .cat),
                Answer(text: "Wide-open spaces", type: .butterfly),
                Answer(text: "Dense forests or jungles", type: .snake)
            ]),
        
        Question(
            text: "What's your ideal vacation destination?",
            type: .single,
            answers: [
                Answer(text: "Mountains and forests", type: .dog),
                Answer(text: "A cozy cabin by the lake", type: .cat),
                Answer(text: "Tropical paradise", type: .butterfly),
                Answer(text: "Desert oasis", type: .snake)
            ]),
        Question(
            text: "How do you approach new experiences?",
            type: .single,
            answers: [
                Answer(text: "Excitedly and enthusiastically", type: .dog),
                Answer(text: "Cautiously and observantly", type: .cat),
                Answer(text: "Curiously and with an open mind", type: .butterfly),
                Answer(text: "With skepticism and caution", type: .snake)
            ]),
        Question(
            text: "What's your favorite time of day?",
            type: .single,
            answers: [
                Answer(text: "Morning,fresh and full of possibilities", type: .dog),
                Answer(text: "Nighttime, world is quiet and peaceful", type: .cat),
                Answer(text: "Daytime, sun is shining and is vibrant", type: .butterfly),
                Answer(text: "Dusk or dawn, world is transitioning", type: .snake)
            ]),
        Question(
            text: "What role do you typically play in social situations?",
            type: .single,
            answers: [
                Answer(text: "Life of the party, center of attention", type: .dog),
                Answer(text: "Observer, watching from the sidelines", type: .cat),
                Answer(text: "Social butterfly, mingling with everyone", type: .butterfly),
                Answer(text: "Mysterious and elusive, preferring solitude", type: .snake)
            ]),
        Question(
            text: "Which activities do you enjoy the most?",
            type: .multiple,
            answers: [
                Answer(text: "Dancing", type: .snake),
                Answer(text: "Sleeping", type: .cat),
                Answer(text: "Cuddling", type: .dog),
                Answer(text: "Jumping", type: .butterfly)
            ]),
        Question(
            text: "How muc do u enjoy car rides?",
            type: .ranged,
            answers: [
                Answer(text: "I dislike them", type: .cat),
                Answer(text: "I get little nervous", type: .snake),
                Answer(text: "I barely notice them", type: .butterfly),
                Answer(text: "I love them", type: .dog)
            ])
    ]

    var questionIndex = 0
    var answersChoosen: [Answer] = []
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        switch sender{
        case singleButton1:
             answersChoosen.append(currentAnswers[0])
        case singleButton2:
             answersChoosen.append(currentAnswers[1])
        case singleButton3:
             answersChoosen.append(currentAnswers[2])
        case singleButton4:
             answersChoosen.append(currentAnswers[3])
        default:
            break
        }
        nextQuestion()
    }
    
    @IBOutlet weak var multiSwitch2: UISwitch!
    @IBOutlet weak var multiSwitch4: UISwitch!
    @IBOutlet weak var multiSwitch3: UISwitch!
    @IBOutlet weak var multiSwitch1: UISwitch!
    
    @IBAction func multipleAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        
        if(multiSwitch1.isOn){ answersChoosen.append(currentAnswers[0])
        }
        if(multiSwitch2.isOn){ answersChoosen.append(currentAnswers[1])
        }
        if(multiSwitch3.isOn){ answersChoosen.append(currentAnswers[2])
        }
        if(multiSwitch4.isOn){ answersChoosen.append(currentAnswers[3])
        }
        
        nextQuestion()
    }
    
    @IBOutlet weak var rangedSlider: UISlider!
    @IBAction func rangedAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        answersChoosen.append(currentAnswers[index])
         nextQuestion()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI(){
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        navigationItem.title = "Question #\(questionIndex + 1)"
        
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex)/Float(questions.count)
        
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type{
        case .single:
            updateSingleStack(using: currentAnswers)
        case .multiple:
            updateMultipleStack(using: currentAnswers)
        case .ranged:
            updateRangedStackView(using: currentAnswers)
        }
        
        func updateSingleStack(using answers: [Answer]){
            singleStackView.isHidden = false
            singleButton1.setTitle(answers[0].text, for: .normal)
            singleButton2.setTitle(answers[1].text, for: .normal)
            singleButton3.setTitle(answers[2].text, for: .normal)
            singleButton4.setTitle(answers[3].text, for: .normal)
        }
        
        func updateMultipleStack(using answers: [Answer]){
            multipleStackView.isHidden = false
            multipleButton1.text = answers[0].text
            multipleButton2.text = answers[1].text
            multipleButton3.text = answers[1].text
            multipleButton4.text = answers[3].text
            multiSwitch1.isOn = false
            multiSwitch2.isOn = false
            multiSwitch3.isOn = false
            multiSwitch4.isOn = false
        }
        
        func updateRangedStackView(using answers: [Answer]){
            rangedStackView.isHidden = false
            rangedButton1.text = answers.first?.text
            rangedButton2.text = answers.last?.text
            rangedSlider.setValue(0.5, animated: false)
        }
       
    }
    
    func nextQuestion(){
        questionIndex += 1
        
        if questionIndex < questions.count{
            updateUI()
        }
        else {
            performSegue(withIdentifier: "Results", sender: nil)
        }
    }
        
    @IBSegueAction func showResults(_ coder: NSCoder) -> ResultsViewController? {
        return ResultsViewController(coder: coder, responses: answersChoosen)
    }
}
