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
                        .background(viewStore.color)
                    HStack {
                        Text("Change Task:")
                            .font(.title2)
                            .foregroundColor(.black)
                        
                        TextField("", text: viewStore.binding(
                            get: \.name,
                            send: Task.Action.updateName
                        ))
                        .padding(5)
                        .foregroundColor(viewStore.color)
                        .font(.title2)
                        .overlay(
                                RoundedRectangle(cornerRadius: 5.0)
                                    .stroke(lineWidth: 2.0)
                                    .foregroundColor(.black)
                            )
                    }
                    
                    ColorPicker("Change Color", selection: viewStore.binding(get: \.color, send: Task.Action.updateColor))
                        .font(.title2)
                        .foregroundColor(viewStore.color)
                    
                    
                    
                    
                    HStack {
                        Button("Mon") {
                            viewStore.send(Task.Action.updateMonColor)
                        }
                        .padding(5)
                        .overlay(
                                Rectangle()
                                    .stroke(lineWidth: 2.0)
                            )
                        .foregroundColor(.black)
                        .background(viewStore.monColor)
                        
                        Button("Tues") {
                            viewStore.send(Task.Action.updateTuesColor)
                        }
                        .padding(5)
                        .overlay(
                                Rectangle()
                                    .stroke(lineWidth: 2.0)
                            )
                        .foregroundColor(.black)
                        .background(viewStore.tuesColor)
                        
                        Button("Wed") {
                            viewStore.send(Task.Action.updateWedColor)
                        }
                        .padding(5)
                        .overlay(
                                Rectangle()
                                    .stroke(lineWidth: 2.0)
                            )
                        .foregroundColor(.black)
                        .background(viewStore.wedColor)
                        
                        Button("Thur") {
                            viewStore.send(Task.Action.updateThurColor)
                        }
                        .padding(5)
                        .overlay(
                                Rectangle()
                                    .stroke(lineWidth: 2.0)
                            )
                        .foregroundColor(.black)
                        .background(viewStore.thurColor)
                        
                        Button("Fri") {
                            viewStore.send(Task.Action.updateFriColor)
                        }
                        .padding(5)
                        .overlay(
                                Rectangle()
                                    .stroke(lineWidth: 2.0)
                            )
                        .foregroundColor(.black)
                        .background(viewStore.friColor)
                        
                        Button("Sat") {
                            viewStore.send(Task.Action.updateSatColor)
                        }
                        .padding(5)
                        .overlay(
                                Rectangle()
                                    .stroke(lineWidth: 2.0)
                            )
                        .foregroundColor(.black)
                        .background(viewStore.satColor)
                        
                        Button("Sun") {
                            viewStore.send(Task.Action.updateSunColor)
                        }
                        .padding(5)
                        .overlay(
                                Rectangle()
                                    .stroke(lineWidth: 2.0)
                            )
                        .foregroundColor(.black)
                        .background(viewStore.sunColor)
                        
                        
                        
                            
                            
                    }
                    .padding(2)
                    
                    
                    
                    
                    
                    
                    Text("Streak: \(viewStore.streak)")
                        .foregroundColor(.black)  // 2. Set the foreground/font color to white
                        .font(.title)             // 3. Change the font type
                        .padding(.top, 200)
                    
                    
                    Button("Add to Streak") {
                        viewStore.send(Task.Action.updateStreak)
                    }
                    .padding(5)
                    .overlay(
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(lineWidth: 2.0)
                        )
                    .foregroundColor(viewStore.color)
                    
                    Spacer()
                    HStack {
                    Text("Longest streak for \(viewStore.name) is \(viewStore.longestStreak)!")
                        .font(.title3)
                        .bold()
                        .foregroundColor(viewStore.color)
                    }
                    
                    Button(action: {
                        print("Delete tapped!")
                    }) {
                        HStack {
                            Image(systemName: "trash")
                                .font(.title)
                        }
                        .padding(9)
                        .foregroundColor(.white)
                        .background(viewStore.color)
                        .cornerRadius(40)
                    }
                }
                .padding(.horizontal, 15)
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
