//
//  AppCoordinator.swift
//  TaskApp
//
//  Created by Алсу Хайруллина on 04.07.2023.
//

import UIKit

final class AppCoordinator: CoordinatorProtocol {

    enum AppFlow {
        case openMainScreen
    }
    
    private lazy var mainCoordinator = TaskListCoordinator(parentCoordinator: self)

    private let window: UIWindow
        
    init(window: UIWindow) {
        self.window = window
    }
    
    func navigate(with route: AppFlow) {
        switch route {
        case .openMainScreen:
            setRootViewController(mainCoordinator.configureMainController(), duration: 1.0)
        }
    }
    
    func start() {
        navigate(with: .openMainScreen)
    }
    
    func setRootViewController(_ vc: UIViewController, duration: TimeInterval) {
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(
            with: window,
            duration: duration,
            options: .transitionCrossDissolve,
            animations: nil,
            completion: nil
        )
    }
}
