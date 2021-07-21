//
//  TaskDetailView.swift
//  Goals
//
//  Created by Kody Deda on 7/20/21.
//

import SwiftUI
import ComposableArchitecture

struct TaskDetailView: View {
    let store: Store<Task.State, Task.Action>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                VStack {
                    Divider()
                    HStack {
                        Text("Change Task:")
                            .font(.title2)
                            .foregroundColor(.black)
                        
                        Spacer()
                        TextField("", text: viewStore.binding(
                            get: \.name,
                            send: Task.Action.updateName
                        ))
                        .font(.title2)
                    }
                    .padding(.bottom, 600)
                    .foregroundColor(viewStore.color)
                    Text("\(viewStore.streak)")
                        .bold()
                        .font(.title2)
                        .foregroundColor(.blue)
                    
                    
                    Button("Add to Streak") {
                        
                    }
                }
                .padding()
                .navigationTitle("\(viewStore.name)")
            }
        }
    }
}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView(store: Task.defaultStore)
    }
}
