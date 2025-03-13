//
//  TaskModel.swift
//  PracticeTestSwiftUI
//
//  Created by Vidisha on 13/03/25.
//

import Foundation

class TaskModel: ObservableObject {
    @Published var tasks: [MyTask] = []
}
