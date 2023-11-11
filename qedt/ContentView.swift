//
//  ContentView.swift
//  qedito
//
//  Created by bill donner on 11/5/23.
//

import SwiftUI
import SwiftData
 
struct ContentView: View {
  //@State private var selectedQuestionID = ""
  @State private var selectedQuestion:QChallenge = QChallenge.mock
  @Environment(\.modelContext) var modelContext
  @State private var path = [QTopic]()
  @State private var sortOrder = SortDescriptor(\QTopic.topicName)
  @State private var searchText = ""
  var body: some View {
    
    NavigationSplitView {
      QTopicListingView(sort: sortOrder, searchString: searchText)
        .navigationDestination(for: QTopic.self){ EditQTopicView(topic: $0,selectedQuestion:$selectedQuestion)
        }
        .searchable(text: $searchText)
        .toolbar {
          Button("Add Topic", systemImage: "plus", action: addQTopic)
          
          Menu("Sort", systemImage: "arrow.up.arrow.down") {
            Picker("Sort", selection: $sortOrder) {
              Text("Name")
                .tag(SortDescriptor(\QTopic.topicName))
              
              Text("Category")
                .tag(SortDescriptor(\QTopic.category, order: .reverse))
              
              Text("Date")
                .tag(SortDescriptor(\QTopic.date))
            }
            .pickerStyle(.inline)
          }
        }
    } content: {
      Text("Primary View")
    } detail: {
      withAnimation {
        EditQuestionView(cha: selectedQuestion)
      }
    }
  }
  func addQTopic() {
      let destination = QTopic()
      modelContext.insert(destination)
      path = [destination]
  }
}


#Preview {
    ContentView()
}
