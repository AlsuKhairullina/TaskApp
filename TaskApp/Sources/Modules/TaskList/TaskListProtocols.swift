//
//  TaskListProtocols.swift
//  TaskApp
//
//  Created by Алсу Хайруллина on 04.07.2023.
//

import UIKit

protocol TaskListPresenterInput: AnyObject {
    func viewDidLoad()
    func getTasksByDay(selectedDay: Date, hour: Int) -> [Task]
    func setTasks(_ cell: TaskTableViewCell, _ tasks: [Task])
}

protocol TaskListPresenterOutput: AnyObject {
    func setState(_:TaskListState)
    func initTime()
    func formatHour(hour: Int) -> String
}

