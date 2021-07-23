//
//  AppState.swift
//  Goals
//
//  Created by Kody Deda \ Ethan Cook on 7/20/21.
//

import SwiftUI
import ComposableArchitecture

struct Root {
    struct State: Equatable {
        let date = Date()
        var text = ""
        var streak: Int = 0
        var color: Color = .red
        
        var tasks: IdentifiedArrayOf<Task.State> = [
            .init(name: "Gym", streak: 8, color: .blue),
            .init(name: "Guitar", streak: 6, color: .green),
            .init(name: "Keto", streak: 4, color: .red),
            .init(name: "Reading", streak: 0, color: .yellow),
        ]
    }

    enum Action: Equatable {
        case tasks(id: Task.State.ID, action: Task.Action)
        case addTask
        case updateText(String)
        case updateColor(Color)
    }
}

extension Root {
    static let reducer = Reducer<State, Action, Void>.combine(
        Task.reducer.forEach(
            state: \.tasks,
            action: /Action.tasks(id:action:),
            environment: { _ in () }
        ),
        Reducer { state, action, _ in
            switch action {

            case let .tasks(id, action):
                return .none
                
            case .addTask:
                state.tasks.append(.init(name: state.text, streak: 0, color: state.color))
                return .none
            
//            case let .removeTask(name):
//                if let index = state.tasks.firstIndex(of: ViewStore.) {
//                    state.tasks.remove(index)
//                }
//                return .none
                 
            case let .updateText(string):
                state.text = string
                return .none
                
            case let .updateColor(color):
                state.color = color
                return .none
                
                
            }
        }
    )
}

extension Root {
    static let defaultStore = Store(
        initialState: .init(),
        reducer: reducer,
        environment: ()
    )
}
