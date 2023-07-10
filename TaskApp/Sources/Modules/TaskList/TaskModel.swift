//
//  TaskModel.swift
//  TaskApp
//
//  Created by Алсу Хайруллина on 04.07.2023.
//

import UIKit

struct TaskData: Codable {
    let task: [Task]
}

// MARK: - Task
struct Task: Codable {
    let id, dateStart, dateFinish: Int?
    let name, description: String?

    enum CodingKeys: String, CodingKey {
        case id
        case dateStart = "date_start"
        case dateFinish = "date_finish"
        case name, description
    }
}
