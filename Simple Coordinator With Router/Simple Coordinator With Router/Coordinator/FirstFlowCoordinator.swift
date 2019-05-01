//
//  FirstFlowCoordinator.swift
//  Simple Coordinator With Router
//
//  Created by 이동건 on 30/04/2019.
//  Copyright © 2019 이동건. All rights reserved.
//

import Foundation

protocol FirstFlowDelegate: class {
    func handleNavigateToFirstFlowSecondViewController()
    func handleNavigationToFirstFlowLastViewController()
    func handleNavigationLastViewController()
}

class FirstFlowCoordinator {
    var childCoodinators: [Coordinator] = []
    var router: Router
    
    init(router: Router) {
        self.router = router
    }
}


extension FirstFlowCoordinator: Coordinator {
    func present(animated: Bool, onDismissed: (() -> Void)?) {
        let firstFlowFirstViewController = FirstFlowFirstViewController.instantiate()
        firstFlowFirstViewController.navigationDelegate = self
        router.present(firstFlowFirstViewController, animated: animated, onDismissed: onDismissed)
    }
}

extension FirstFlowCoordinator: FirstFlowDelegate {
    func handleNavigateToFirstFlowSecondViewController() {
        let firstFlowSecondViewController = FirstFlowSecondViewController.instantiate()
        firstFlowSecondViewController.navigationDelegate = self
        router.present(firstFlowSecondViewController, animated: true)
    }
    
    func handleNavigationToFirstFlowLastViewController() {
        let firstFlowLastViewController = FirstFlowLastViewController.instantiate()
        firstFlowLastViewController.navigationDelegate = self
        router.present(firstFlowLastViewController, animated: true)
    }
    
    func handleNavigationLastViewController() {
        router.dismiss(animated: true)
    }
}
