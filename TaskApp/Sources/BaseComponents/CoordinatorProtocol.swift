//
//  CoordinatorProtocol.swift
//  TaskApp
//
//  Created by Алсу Хайруллина on 04.07.2023.
//

import UIKit

protocol CoordinatorProtocol {
    associatedtype Route
    func navigate(with route: Route)
    func configureMainController() -> UIViewController
}

extension CoordinatorProtocol {
    func configureMainController() -> UIViewController {
        assertionFailure("Дефолтная реализация не должна использоваться")
        return UIViewController()
    }
}
