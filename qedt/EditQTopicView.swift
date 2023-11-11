//
//  AddTopicView.swift
//  qedito
//
//  Created by bill donner on 11/5/23.
//

import SwiftUI
import SwiftData

struct EditQTopicView: View {
  @Bindable var topic: QTopic
  @Binding  var selectedQuestion:QChallenge
  @State private var newQChallengeName = ""

    var body: some View {
      NavigationStack { 
        VStack{
        Text(topic.topicName == "" ? "New Topic":"Edit Topic \(topic.topicName)").font(.title)
          Form  {
            Text("id: \($topic.id)")
            TextField("Topic Name", text: $topic.topicName)
            TextField("Details", text: $topic.details, axis: .vertical)
            DatePicker("Date", selection: $topic.date)
            Section("Categories") {
              Picker("Category", selection: $topic.category) {
                Text("Kids").tag(1)
                Text("General").tag(2)
                Text("Adult").tag(3)
              }
              .pickerStyle(.segmented)
            }
            
            
            HStack {
              TextField("Add question", text: $newQChallengeName)
              
              Button("Add", action: addQChallenge)
            }
          }.padding()
        }.frame(maxHeight:300)
        
        VStack(alignment: .leading)  {
        Text ("Questions:").font(.title)
          ScrollView {
            
            ForEach(topic.challenges) { challenge in
              
              HStack{ Text(challenge.question); Spacer(); Text(challenge.id).font(.caption) }.monospaced()
                .onTapGesture {
//                  print("present questions view \(challenge.id)")
//                  topic.selectedID = challenge.id
          
                  selectedQuestion = challenge
            
                }
            }
          }
        }.padding()
      }
          .navigationTitle("Edit Topic")
       // .navigationBarTitleDisplayMode(.inline)
    }

    func addQChallenge() {
        guard newQChallengeName.isEmpty == false else { return }

        withAnimation {
          let sight = QChallenge(question: newQChallengeName, topic: "YYYY", hint: "", correct: "", id:UUID().uuidString, date:Date(), aisource: "ChatGPT-turbo-blah")
          
          topic.challenges.append(sight)
            newQChallengeName = ""
        }
    }
}

#Preview {
    do {
      let topicname = "Colors"
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: QTopic.self, configurations: config)
      let example = QTopic(name: topicname, details: "Example details go here and will automatically expand vertically as they are edited.")
      let question = QChallenge(question: "Why is the sky blue?", topic: topicname, hint: "Not red",  correct: "fatz", id: UUID().uuidString, date: Date(), aisource: "BillGPT7")
//      ,
//                           challenges:[Question(question: "Why is the sky blue?", topic: topicname, hint: "Not red", answers: [], correct: "fatz", id: UUID().uuidString, date: Date(), aisource: "BillGPT7")])
      return EditQTopicView(  topic: example, selectedQuestion: .constant(question))
            .modelContainer(container)
    } catch {        fatalError("Failed to create model container.")
    }
}
