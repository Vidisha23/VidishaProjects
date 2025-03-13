//
//  ContentView.swift
//  PracticeTestSwiftUI
//
//  Created by Vidisha on 13/03/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var taskModel = TaskModel()
    
    var body: some View {
        TabView {
            CreateTaskView(taskModel: taskModel)
            .tabItem {
                Label("Create Task", systemImage: "pencil")
            }
           TasksListView(taskModel: taskModel)
            .tabItem {
                Label("Tasks List", systemImage: "list.bullet.rectangle")
            }
        }
        .padding()
        .ignoresSafeArea()
    }
    
    
    
}

#Preview {
    ContentView()
}
