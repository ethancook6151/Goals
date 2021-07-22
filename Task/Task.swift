//
//  TaskState.swift
//  Goals
//
//  Created by Kody Deda on 7/20/21.
//

import SwiftUI
import ComposableArchitecture

struct Task {
    struct State: Equatable, Identifiable {
        var id = UUID()
        var name = "Untitled"
        var streak = 0
        var color: Color
        var longestStreak: Int = 0
    }
    
    enum Action: Equatable {
        case updateName(String)
        case updateStreak
        case updateColor(Color)
//        case removeTask
    }
}

extension Task {
    static let reducer = Reducer<State, Action, Void> { state, action, _ in
        switch action {
        case let .updateName(string):
            state.name = string
            return .none
            
        case .updateStreak:
            state.streak += 1
            if state.streak > state.longestStreak {
                state.longestStreak = state.streak
            }
            return .none
            
        case let .updateColor(Color):
            state.color = Color
            return .none
            
//        case .removeTask:
//            return .none
        
        }
    }
}

extension Task {
    static let defaultStore = Store(
        initialState: .init(color: .red),
        reducer: reducer,
        environment: ()
    )
}
