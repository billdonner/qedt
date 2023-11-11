//
//  Sight.swift
//  iTour
//
//  Created by Paul Hudson on 30/09/2023.
//

import Foundation
import SwiftData

@Model
public class QChallenge :ObservableObject {
  public init(question: String, topic: String, hint: String, answer0: String="", answer1: String="", answer2: String="", answer3: String="", answer4: String="", correct: String, explanation: String="", article: String? = nil, image: String? = nil, id: String, date: Date, aisource: String) {
    self.question = question
    self.topic = topic
    self.hint = hint
    self.answer0 = answer0
    self.answer1 = answer1
    self.answer2 = answer2
    self.answer3 = answer3
    self.answer4 = answer4
    self.correct = correct
    self.explanation = explanation
    self.article = article
    self.image = image
    self.id = id
    self.date = date
    self.aisource = aisource
  }
  
  
  
  public var  question: String
  public var  topic: String
  public var  hint:String // a hint to show if the user needs help
  public var  answer0: String  // if not answers then correct==answer0
  public var  answer1: String
  public var  answer2: String
  public var  answer3: String
  public var  answer4: String
  public var  correct: String // which answer is correct
  public var  explanation: String // reasoning behind the correctAnswer
  public var  article: String?// URL of article about the correct Answer
  public var  image:String? // URL of image of correct Answer
  // these fields are hidden from the ai and filled in by pumper
  public var  id:String // can be real uuid
  public var  date:Date // hmmm
  public var  aisource:String
  
  static var mock = {
    QChallenge(question: "abcdef??", topic: "YYYY", hint: "", correct: "correct", id:UUID().uuidString, date:Date(), aisource: "ChatGPT-turbo-blah")
  }()
  
  
}
