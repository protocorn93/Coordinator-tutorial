//
//  CreateCoordinator.swift
//  Simple Coordinators
//
//  Created by 이동건 on 28/04/2019.
//  Copyright © 2019 이동건. All rights reserved.
//

import UIKit

class CreateCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    weak var parentCoordinator: MainCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let createViewController = CreateViewController.instantiate()
        createViewController.coordinator = self
        navigationController.pushViewController(createViewController, animated: true)
    }
    
    func finishCoordinatorFlow() {
        parentCoordinator?.finishChildCoordinatorFlow(self)
    }
}
