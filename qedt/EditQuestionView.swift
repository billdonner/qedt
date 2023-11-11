//
//  EditQuestionView.swift
//  qedito
//
//  Created by bill donner on 11/7/23.
//

import SwiftUI

struct EditQuestionView : View {
  @Bindable var cha : QChallenge
//  @State var qfield:String = ""
//  @State var tfield:String = ""
//  @State var hfield:String = ""
//  @State var cfield:String = ""
//  @State var efield:String = ""
//  
//  @State var afield1:String = ""
//  @State var afield2:String = ""
//  @State var afield3:String = ""
//  @State var afield4:String = ""
//  @State var afield5:String = ""
  
  var body: some View {
    NavigationStack {
        Text ("Edit Question \(cha.question)").font(.largeTitle)
      Text ("id: \(cha.id)")
      Text ("date: \(cha.date)")
      Spacer()
      Form  {
        TextField("question", text: $cha.question)
        TextField("topic", text: $cha.topic)
        TextField("hint", text: $cha.hint)
        TextField("answer1", text: $cha.answer0)
          TextField("answer2", text:  $cha.answer1)
          TextField("answer3", text:  $cha.answer2)
          TextField("answer4", text:  $cha.answer3)
          TextField("answer5", text:  $cha.answer4)
        TextField("correct", text: $cha.correct)
        TextField("explanation", text:  $cha.explanation)
      }.padding()
//        .onChange(of:qfield){ cha.question = qfield }
//        .onChange(of:tfield){ cha.topic = tfield }
//        .onChange(of:hfield){ cha.hint = hfield }
//        .onChange(of:afield1){ cha.answer0 = afield1 }
//        .onChange(of:afield2){ cha.answer1 = afield2 }
//        .onChange(of:afield3){ cha.answer2 = afield3 }
//        .onChange(of:afield4){ cha.answer3 = afield4 }
//        .onChange(of:afield5){ cha.answer4 = afield5 }
//        .onChange(of:cfield){ cha.correct = cfield }
//        .onChange(of:efield){ cha.explanation = efield }
//      
      Spacer()
    }
  }
}

#Preview {

  let x = QChallenge(question: "Y??", topic: "topic", hint: "hint",  correct: "A2", id:" id1234", date: Date(), aisource: "billgpt")
  return EditQuestionView(cha: x)
}
