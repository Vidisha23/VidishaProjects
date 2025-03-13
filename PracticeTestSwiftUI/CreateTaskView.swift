//
//  CreateTaskView.swift
//  PracticeTestSwiftUI
//
//  Created by Vidisha on 13/03/25.
//

import SwiftUI

struct CreateTaskView: View {
    @State private var showAlert = false
    @State private var title = String()
    @ObservedObject var taskModel : TaskModel
    
    var body: some View {
        VStack {
            HStack {
                Text("Write your Task for today")
                    .font(.headline)
                .padding(.top, 20)
                Spacer()
            }
            .padding([.leading, .trailing], 20)
                
            TextEditor(text: $title)
                .font(.title3)
                .frame(maxWidth: .infinity, maxHeight: 300)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding([.leading, .trailing, .bottom], 20)
            Button {
                showAlert = true
            } label: {
                Label("Save Task", systemImage: "pencil.and.list.clipboard")
            }
            .frame(width: 200, height: 50)
            .foregroundColor(.white)
            .background(Color.blue)
            .clipShape(Capsule())
            Spacer()
                .alert("Do you want to save this task for today?", isPresented: $showAlert) {
                    Button("Yes") {
                        self.updateMyTask()
                    }
                 //   Button("No", role: .cancel){}
                }
        }
    }
    
    // MARK: Save Task
       func updateMyTask() {
           let newTask = MyTask(title: title)
           taskModel.tasks.append(newTask)
           title = "" // Clear text field after adding
           print(taskModel.tasks)
       }
}

#Preview {
    CreateTaskView(taskModel: TaskModel())
}
