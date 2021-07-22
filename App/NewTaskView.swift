//
//  NewTaskView.swift
//  Goals
//
//  Created by Kody Deda on 7/20/21.
//

import SwiftUI
import ComposableArchitecture

struct NewTaskView: View {
    let store: Store<Root.State, Root.Action>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                TextField("Task", text: viewStore.binding(get: \.text, send: Root.Action.updateText))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .font(.title2)
                
                ColorPicker("color", selection: viewStore.binding(get: \.color, send: Root.Action.updateColor))
                    .font(.title2)
                    .padding()
                Button("Add Task") {
                    viewStore.send(.addTask)
                }
                Spacer()
            }
            .padding()
            .padding(.top, 75)
        }
    }
}

struct NewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskView(store: Root.defaultStore)
    }
}
