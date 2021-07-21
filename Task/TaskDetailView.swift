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
            VStack {
                TextField("", text: viewStore.binding(
                    get: \.name,
                    send: Task.Action.updateName
                ))
                .foregroundColor(viewStore.color)
            }
            .padding()
        }
    }
}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView(store: Task.defaultStore)
    }
}
