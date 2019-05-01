//
//  SecondFlowCoordinator.swift
//  Simple Coordinator With Router
//
//  Created by 이동건 on 01/05/2019.
//  Copyright © 2019 이동건. All rights reserved.
//

import UIKit

protocol SecondFlowDelegate: class {
    func handleNavigateToSecondFlowSecondViewController()
    func handleNavigationToSecondFlowLastViewController()
    func handleNavigationLastViewController()
}

class SecondFlowCoordinator {
    var childCoodinators: [Coordinator] = []
    var router: Router
    
    init(router: Router) {
        self.router = router
    }
}

extension SecondFlowCoordinator: Coordinator {
    func present(animated: Bool, onDismissed: (() -> Void)?) {
        let secondFlowFirstViewController = SecondFlowFirstViewController.instantiate()
        secondFlowFirstViewController.navigationDelegate = self
        router.present(secondFlowFirstViewController, animated: animated, onDismissed: onDismissed)
    }
}

extension SecondFlowCoordinator: SecondFlowDelegate {
    func handleNavigateToSecondFlowSecondViewController() {
        let secondFlowSecondViewController = SecondFlowSecondViewController.instantiate()
        secondFlowSecondViewController.navigationDelegate = self
        router.present(secondFlowSecondViewController, animated: true)
    }
    
    func handleNavigationToSecondFlowLastViewController() {
        let secondFlowLastViewController = SecondFlowLastViewController.instantiate()
        secondFlowLastViewController.navigationDelegate = self
        router.present(secondFlowLastViewController, animated: true)
    }
    
    func handleNavigationLastViewController() {
        router.dismiss(animated: true)
    }
}
