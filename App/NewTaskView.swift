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
                TextField("Title", text: viewStore.binding(get: \.text, send: Root.Action.updateText))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                ColorPicker("color", selection: viewStore.binding(get: \.color, send: Root.Action.updateColor))
                
                Button("Add Task") {
                    viewStore.send(.addTask)
                }
            }
            .padding()
        }
    }
}

struct NewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskView(store: Root.defaultStore)
    }
}
