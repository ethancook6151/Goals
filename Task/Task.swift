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
        var mon: Bool = false
        var monColor: Color = .clear
        var tues: Bool = false
        var tuesColor: Color = .clear
        var wed: Bool = false
        var wedColor: Color = .clear
        var thur: Bool = false
        var thurColor: Color = .clear
        var fri: Bool = false
        var friColor: Color = .clear
        var sat: Bool = false
        var satColor: Color = .clear
        var sun: Bool = false
        var sunColor: Color = .clear
        
    }
    
    enum Action: Equatable {
        case updateName(String)
        case updateStreak
        case updateColor(Color)
        case updateMonColor
        case updateTuesColor
        case updateWedColor
        case updateThurColor
        case updateFriColor
        case updateSatColor
        case updateSunColor
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
            if state.mon == true {
                state.monColor = state.color
            }
            if state.tues == true {
                state.tuesColor = state.color
            }
            if state.wed == true {
                state.wedColor = state.color
            }
            if state.thur == true {
                state.thurColor = state.color
            }
            if state.fri == true {
                state.friColor = state.color
            }
            if state.sat == true {
                state.satColor = state.color
            }
            if state.sun == true {
                state.sunColor = state.color
            }
            return .none
        
        case .updateMonColor:
            if state.mon == false {
                state.mon = true
                state.monColor = state.color
            }
            else {
                state.mon = false
                state.monColor = .clear
            }
            return .none
            
        case .updateTuesColor:
            if state.tues == false {
                state.tues = true
                state.tuesColor = state.color
            }
            else {
                state.tues = false
                state.tuesColor = .clear
            }
            return .none
            
        case .updateWedColor:
            if state.wed == false {
                state.wed = true
                state.wedColor = state.color
            }
            else {
                state.wed = false
                state.wedColor = .clear
            }
            return .none
            
        case .updateThurColor:
            if state.thur == false {
                state.thur = true
                state.thurColor = state.color
            }
            else {
                state.thur = false
                state.thurColor = .clear
            }
            return .none
            
        case .updateFriColor:
            if state.fri == false {
                state.fri = true
                state.friColor = state.color
            }
            else {
                state.fri = false
                state.friColor = .clear
            }
            return .none
            
        case .updateSatColor:
            if state.sat == false {
                state.sat = true
                state.satColor = state.color
            }
            else {
                state.sat = false
                state.satColor = .clear
            }
            return .none
            
        case .updateSunColor:
            if state.sun == false {
                state.sun = true
                state.sunColor = state.color
            }
            else {
                state.sun = false
                state.sunColor = .clear
            }
            return .none
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
