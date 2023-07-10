//
//  TaskListViewController.swift
//  TaskApp
//
//  Created by Алсу Хайруллина on 04.07.2023.
//

import UIKit
import SnapKit

class TaskListViewController: UIViewController {
    
    var presenter: TaskListPresenterInput?
    let cellId = "taskCell"
    var hours = [Int]()
    private lazy var label = UILabel()
    private lazy var calendarView = UICalendarView()
    private lazy var tableView = UITableView()
    private lazy var datePicker = UIDatePicker()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(TaskTableViewCell.self, forCellReuseIdentifier: "taskCell")
        tableView.dataSource = self
        tableView.delegate = self
        initTime()
        presenter?.viewDidLoad()
        configureView()
    }
    
    func configureView() {
        
        view.backgroundColor = .white
        
        label.text = "Ежедневник"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.textAlignment = .center
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(30)
            make.top.lessThanOrEqualToSuperview().inset(80)
        }
        datePicker.preferredDatePickerStyle = .inline
        datePicker.addTarget(self, action: #selector(onDateValueChanged(_:)), for: .valueChanged)
        datePicker.datePickerMode = .date
        view.addSubview(datePicker)
        datePicker.snp.makeConstraints { make in
            make.top.equalTo(label).inset(50)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalToSuperview().multipliedBy(0.5)
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(datePicker.snp.bottom).offset(20)
            make.trailing.leading.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
     @objc private func onDateValueChanged(_ datePicker: UIDatePicker) {
         tableView.reloadData()
    }
}

extension TaskListViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hours.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskTableViewCell
        let hour = hours[indexPath.row]
        let selectedDate = datePicker.date
        cell.timeLabel.text = formatHour(hour: hour)
        let dayTasks = presenter?.getTasksByDay(selectedDay: selectedDate, hour: hour)
        presenter?.setTasks(cell, dayTasks!)

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

extension TaskListViewController: TaskListPresenterOutput {
    
    func setState(_ state: TaskListState) {
        switch state {
        case .done:
            self.view.backgroundColor = .green
        case .start:
            self.view.backgroundColor = .systemTeal
        case .failure:
            self.view.backgroundColor = .red
        }
    }
    
    func initTime() {
        for hour in 0...23 {
            hours.append(hour)
        }
    }
    
    func formatHour(hour: Int) -> String {
        return String(format: "%02d:%02d", hour, 0)
    }
}

