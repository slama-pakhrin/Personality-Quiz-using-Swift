//
//  Question.swift
//  PersonalityQuiz
//
//  Created by Arii on 2024-03-29.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType{
    case single, multiple, ranged
}

struct Answer{
    var text: String
    var type: AnswerType
}

enum AnswerType: Character{
    case dog="🐶", cat="😼", butterfly="🦋", snake="🐍"
    
    var definition: String{
        switch self{
        case .dog:
            return "You are incredibly outgoing."
        
        case .cat:
            return "You enjoy doing things on your own terms."
        
        case .butterfly:
            return "You love peace."
            
        case .snake:
            return "You are very sneaky."
        }
    }
}
