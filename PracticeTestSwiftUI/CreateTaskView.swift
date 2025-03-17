//
//  CreateTaskView.swift
//  PracticeTestSwiftUI
//
//  Created by Vidisha on 13/03/25.
//

import SwiftUI

struct CreateTaskView: View {
    var name = String()
    @State private var showAlert = false
    @State private var title = String()
    @ObservedObject var taskModel : TaskModel
    @State private var taskDate = Date.now
    @ViewBuilder var welcomeView : some View {
        Text("Welcome! \(name)")
    }
    
    @ViewBuilder var saveTaskButton : some View {
        Button {
            showAlert = true
        } label: {
            Label("Save Task", systemImage: "pencil.and.list.clipboard")
        }
        
        .frame(width: 200, height: 50)
        .foregroundColor(.white)
        .background(Color.blue)
        .clipShape(Capsule())
        .alert("Do you want to save this task for today?", isPresented: $showAlert) {
            Button("Yes") {
                self.updateMyTask()
            }
            Button("No", role: .cancel){}
        }
    }
    
    var body: some View {
        VStack {
            welcomeView
                .titleStyle()
            HStack {
                Text("Select the date")
                    .font(.headline)
                Spacer()
                DatePicker("", selection: $taskDate,in:Date.now..., displayedComponents: .date)
                    .labelsHidden()
            }
            HStack {
                Text("Write your Task for \(taskDate.formatted(date: .numeric, time: .omitted))")
                    .font(.headline)
                .padding(.top, 10)
                Spacer()
            }
            
                
            TextEditor(text: $title)
                .font(.title3)
                .frame(maxWidth: .infinity, maxHeight: 300)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding(.top, 5)
            if !title.isEmpty {
                saveTaskButton
            }
            Spacer()
                
        }
        .padding([.leading, .trailing], 20)
        .watermarked(with: "Practice Test by Vidisha")
    }
    
    // MARK: Save Task
       func updateMyTask() {
           let newTask = MyTask(title: title, date: taskDate)
           taskModel.tasks.append(newTask)
           title = "" // Clear text field after adding
           taskModel.tasks.sort { task1, task2 in
               task1.date < task2.date
           }
           print(taskModel.tasks)
       }
}

#Preview {
    CreateTaskView(taskModel: TaskModel())
}
