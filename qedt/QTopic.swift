//
//  QTopic.swift
//  qedito
//
//  Created by bill donner on 11/5/23.
//

import SwiftUI
import SwiftData

@Model
public class QTopic {
  public  var id:String
  public  var topicName: String
  public  var details: String
  public  var date: Date
  public var author: String
  public  var purpose: String
  public   var version: String
  public   var category: Int
  @Relationship(deleteRule: .cascade) public var challenges = [QChallenge]()
  public var selectedID:String
  
  public init(name: String = "", details: String = "", date: Date = .now, category: Int = 2, author:String="",purpose:String="",version:String="",challenges:[QChallenge] = [],selectedID:String = ""){
    self.id = UUID().uuidString
    self.topicName = name
    self.details = details
    self.date = date
    self.category = category
    self.author = author
    self.purpose = purpose
    self.version = version
    self.challenges = challenges 
    self.selectedID = selectedID// which challenge
    
  }
}
