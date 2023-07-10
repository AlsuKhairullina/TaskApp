//
//  TaskListPresenter.swift
//  TaskApp
//
//  Created by Алсу Хайруллина on 04.07.2023.
//

import UIKit

class TaskListPresenter: TaskListPresenterInput {

    weak var view: TaskListPresenterOutput?
    private var jsonManager: JSONManager
    private var coordinator: TaskListCoordinator
    private var calendar = Calendar.current
    
    init (coordinator: TaskListCoordinator, jsonManager: JSONManager) {
        self.coordinator = coordinator
        self.jsonManager = jsonManager
    }
    
    func viewDidLoad() {
        view?.setState(.start)
    }
    
    func timestampToStringDate(timestamp: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        let taskDate = dateFormatter.string(from: date)
        return taskDate
    }
    
    func timestampToDate(timestamp: Int) -> Date {
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
        return date
    }
    
    func dateToString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        let stringDate = dateFormatter.string(from: date)
        return stringDate
    }
    
    func getHourFromDate(date: Date) -> Int {
        let hour = Calendar.current.component(.hour, from: date)
        return hour
    }
    
    func getTasksByDay(selectedDay: Date, hour: Int) -> [Task] {
        let tasks = jsonManager.loadJson(filename: "tasks")
        var tasksByDay = [Task]()
        for task in tasks {
            let taskDate = timestampToStringDate(timestamp: task.dateStart ?? 0)
            let calendarDate = dateToString(date: selectedDay)
            if taskDate == calendarDate {
                let taskHour = getHourFromDate(date: timestampToDate(timestamp: task.dateStart ?? 0))
                if taskHour == hour {
                    tasksByDay.append(task)
                }
            }
        }
        return tasksByDay
    }
    
    func setTasks(_ cell: TaskTableViewCell, _ tasks: [Task]) {
        switch tasks.count {
        case 0:
            cell.hideTask(cell: cell)
        case 1:
            cell.taskName.text = tasks[0].name
            let date =  timestampToDate(timestamp: tasks[0].dateStart ?? 0)
            let hour = getHourFromDate(date: date)
            cell.taskTime.text = String(hour) + ":00"
        default:
            break
        }
    }

}
