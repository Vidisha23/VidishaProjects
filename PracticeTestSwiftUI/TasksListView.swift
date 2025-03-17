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
        NavigationStack {
            VStack {
                if taskModel.tasks.isEmpty {
                    Text("Your tasks list is Empty")
                } else {
                    let arr = self.filterArray()
                    List {
                        ForEach(taskModel.tasks) { task in
                            Section(task.date.formatted(date: .numeric, time: .omitted)) {
                              //  Text(task.date.formatted(date: .numeric, time: .omitted))
                                Text(task.title)
                                    .onTapGesture {
                                        print(task.title)
                                    }
                            }
                            
                        }
                        .onDelete(perform: { indexSet in
                            self.taskModel.tasks.remove(atOffsets: indexSet)
                        })
                    }
                }
            }
            .navigationTitle("Tasks List")
        }
    }
    
    func filterArray() -> [[MyTask]] {
        let groupedTask = Dictionary(grouping: self.taskModel.tasks) { task in
            Calendar.current.startOfDay(for: task.date)
        }
        let subarrays = groupedTask.values.map { Array($0) }
        return subarrays
    }
}

#Preview {
    TasksListView(taskModel: TaskModel())
}
