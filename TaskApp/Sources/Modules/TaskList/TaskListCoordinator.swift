//
//  TaskListCoordinator.swift
//  TaskApp
//
//  Created by Алсу Хайруллина on 04.07.2023.
//

import UIKit

final class TaskListCoordinator: CoordinatorProtocol {
    
    private var parentCoordinator: AppCoordinator
    private let navigationController = UINavigationController()
    
    init(parentCoordinator: AppCoordinator) {
        self.parentCoordinator = parentCoordinator
    }
    
    enum TaskListFlow {
        case main
    }
    
    func navigate(with route: TaskListFlow) {
        switch route {
        case .main:
            let presenter = TaskListPresenter(coordinator: self, jsonManager: JSONManager())
            let vc = TaskListViewController()
            presenter.view = vc
            vc.presenter = presenter
            navigationController.pushViewController(vc, animated: true)
        }
    }
    
    func start() {
        navigate(with: .main)
    }
    
    func configureMainController() -> UIViewController {
        navigate(with: .main)
        return navigationController
    }
}
