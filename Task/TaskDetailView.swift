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
//                    .padding(.bottom, 600)
                    .foregroundColor(viewStore.color)
                    Text("Streak: \(viewStore.streak)")
                        .foregroundColor(.black)  // 2. Set the foreground/font color to white
                        .font(.title)             // 3. Change the font type
                        .padding([.top, .bottom], 200)
                    
                    
                    //                    Button("Add to Streak") {
                    //                        viewStore.send(Task.)
                    //                    }
                    Button(action: {
                        print("Delete tapped!")
                    }) {
                        HStack {
                            Image(systemName: "trash")
                                .font(.title)
                            Text("Delete")
                                .fontWeight(.semibold)
                                .font(.title)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(40)
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
