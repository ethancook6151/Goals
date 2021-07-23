//
//  TaskState.swift
//  Goals
//
//  Created by Kody Deda \ Ethan Cook on 7/20/21.
//

import Foundation
import SwiftUI
import ComposableArchitecture

struct Task {
    struct State: Equatable, Identifiable {
        var id = UUID()
        var name = "Untitled"
        var streak = 0
        var color: Color
        var longestStreak: Int = 0
        let date = Date()
        var lastDate: String = ""
        let dateFormatter = DateFormatter()
        
        
        
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
            // Check day of the week and see if it is a selected day
            // Only allow the 
            if state.date.formattedDescriptionWeekday.contains("Monday")  && ((state.mon == true) && (state.date.formattedDescription != state.lastDate) ) {
                state.streak += 1
                state.lastDate = state.date.formattedDescription
            }
            if state.date.formattedDescriptionWeekday.contains("Tuesday")  && ((state.tues == true) && (state.date.formattedDescription != state.lastDate)) {
                state.streak += 1
                state.lastDate = state.date.formattedDescription
            }
            if state.date.formattedDescriptionWeekday.contains("Wednesday")  && ((state.wed == true) && (state.date.formattedDescription != state.lastDate)) {
                state.streak += 1
                state.lastDate = state.date.formattedDescription
            }
            if state.date.formattedDescriptionWeekday.contains("Thursday")  && ((state.thur == true) && (state.date.formattedDescription != state.lastDate)) {
                state.streak += 1
                state.lastDate = state.date.formattedDescription
            }
            if state.date.formattedDescriptionWeekday.contains("Friday")  && ((state.fri == true) && (state.date.formattedDescription != state.lastDate)){
                state.streak += 1
                state.lastDate = state.date.formattedDescription
            }
            if state.date.formattedDescriptionWeekday.contains("Saturday")  && ((state.sat == true) && (state.date.formattedDescription != state.lastDate)) {
                state.streak += 1
                state.lastDate = state.date.formattedDescription
            }
            if state.date.formattedDescriptionWeekday.contains("Sunday")  && ((state.sun == true) && (state.date.formattedDescription != state.lastDate)) {
                state.streak += 1
                state.lastDate = state.date.formattedDescription
            }
            
            // See if the current streak is more the the longest streak so far
            if state.streak > state.longestStreak {
                state.longestStreak = state.streak
            }
            return .none
            
        case let .updateColor(Color):
            // Change color
            state.color = Color
            
            // If a day of the weeek is selected then set the color to the main color selected
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
            // Switches the days of the week on and off for goal schedule
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
            // Switches the days of the week on and off for goal schedule
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
            // Switches the days of the week on and off for goal schedule
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
            // Switches the days of the week on and off for goal schedule
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
            // Switches the days of the week on and off for goal schedule
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
            // Switches the days of the week on and off for goal schedule
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
            // Switches the days of the week on and off for goal schedule
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
