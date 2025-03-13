//
//  TasksListView.swift
//  PracticeTestSwiftUI
//
//  Created by Vidisha on 13/03/25.
//

import SwiftUI

struct TasksListView: View {
    @ObservedObject var taskModel : TaskModel
    var body: some View {
        VStack {
            if taskModel.tasks.isEmpty {
                Text("Your tasks list is Empty")
            } else {
                List{
                    ForEach(taskModel.tasks) { task in
                        Text(task.title)
                            .onTapGesture {
                                print(task.title)
                            }
                    }
                    .onDelete(perform: { indexSet in
                        self.taskModel.tasks.remove(atOffsets: indexSet)
                    })
                }
            }
           
        }
    }
}

#Preview {
    TasksListView(taskModel: TaskModel())
}
