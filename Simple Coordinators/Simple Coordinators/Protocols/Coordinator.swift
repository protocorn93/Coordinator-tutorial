//
//  Coordinator.swift
//  Simple Coordinators
//
//  Created by 이동건 on 28/04/2019.
//  Copyright © 2019 이동건. All rights reserved.
//

import UIKit

protocol Coordinator: class {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    func start()
}

protocol CoordinatorOutput {
    associatedtype Item
    var finishFlow: ((Item) -> Void)? { get set }
}
