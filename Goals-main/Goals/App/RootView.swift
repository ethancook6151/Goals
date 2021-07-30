//
//  AppView.swift
//  Goals
//
//  Created by Kody Deda \ Ethan Cook on 7/20/21.
//

import SwiftUI
import ComposableArchitecture

struct RootView: View {
    let store: Store<Root.State, Root.Action>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {

                ScrollView {
                    Divider()
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2)) {
                        ForEachStore(
                            store.scope(
                                state: \.tasks,
                                action: Root.Action.tasks(id:action:)
                            ), content: TaskView.init(store:)
                        )
                    }
                    
                }
                .toolbar {
                    NavigationLink(destination: NewTaskView(store: store)) {
                        Text("Add Goal")
                    }
                }
                .padding([.horizontal])
                .navigationTitle("Goals: \t\(viewStore.date.formattedDescription)")
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(store: Root.defaultStore)
    }
}



