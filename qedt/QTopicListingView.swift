//
//  DestinationListingView.swift
//  iTour
//
//  Created by Paul Hudson on 30/09/2023.
//

import SwiftData
import SwiftUI

struct QTopicListingView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: [SortDescriptor(\QTopic.category, order: .reverse), SortDescriptor(\QTopic.topicName)]) var destinations: [QTopic]

    var body: some View {
      Text("Topics").font(.largeTitle)
        List {
            ForEach(destinations) { destination in
                NavigationLink(value: destination) {
                    VStack(alignment: .leading) {
                        Text(destination.topicName)
                            .font(.headline)
                        Text(destination.date.formatted(date: .long, time: .shortened))
                    }
                }
            }
            .onDelete(perform: deleteDestinations)
        }
    }

    init(sort: SortDescriptor<QTopic>, searchString: String) {
        _destinations = Query(filter: #Predicate {
            if searchString.isEmpty {
                return true
            } else {
                return $0.topicName.localizedStandardContains(searchString)
            }
        }, sort: [sort])
    }

    func deleteDestinations(_ indexSet: IndexSet) {
      withAnimation {
        for index in indexSet {
          let destination = destinations[index]
          modelContext.delete(destination)
        }
      }
    }
}

#Preview {
  QTopicListingView(sort: SortDescriptor(\QTopic.topicName), searchString: "")
}
