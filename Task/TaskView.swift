//
//  TaskView.swift
//  Goals
//
//  Created by Kody Deda \ Ethan Cook on 7/20/21.
//

import SwiftUI
import ComposableArchitecture

struct TaskView: View {
    let store: Store<Task.State, Task.Action>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationLink(destination: TaskDetailView(store: store)) {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 250)
                        .foregroundColor(viewStore.color)
                    
                    VStack {
                        Text(viewStore.name)
                            .bold()
                            .font(.title)
                        
                        Text(viewStore.streak.description)
                            .font(.title)
                            .padding(.top, 4)
                    }
                    .foregroundColor(.white)
                }
            }
        }
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView(store: Task.defaultStore)
    }
}




