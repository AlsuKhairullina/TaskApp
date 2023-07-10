//
//  TaskTableViewCell.swift
//  TaskApp
//
//  Created by Алсу Хайруллина on 04.07.2023.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    var task: Task? {
        didSet {
        }
    }
    
    var timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let taskView: UIView = {
        let view = UIView()
        return view
    }()
    
    let taskName: UILabel = {
        let label = UILabel()
        label.textColor = .blue
        label.adjustsFontSizeToFitWidth = false
        label.lineBreakMode = .byTruncatingTail
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let taskTime: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(style:UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
         
        self.contentView.addSubview(timeLabel)
        timeLabel.textColor = .gray
        timeLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(20)
        }
        
        self.contentView.addSubview(taskView)
        taskView.backgroundColor = .clear
        taskView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(timeLabel.snp.trailing).offset(20)
            make.height.equalTo(50)
            make.width.equalToSuperview().multipliedBy(0.35)
        }
        
        taskView.addSubview(taskName)
        taskView.layer.cornerRadius = 10
        taskView.layer.borderWidth = 1
        taskView.layer.borderColor = UIColor(red: 0, green: 0.3647, blue: 1, alpha: 1.0).cgColor
        taskName.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(10)
            make.centerY.equalToSuperview()
            make.width.equalTo(80)
        }
        
        taskView.addSubview(taskTime)
        taskTime.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(10)
            make.centerY.equalToSuperview()
        }
    }
    
    func hideTask(cell: TaskTableViewCell) {
        taskView.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
