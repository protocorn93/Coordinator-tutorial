//
//  ApplicationCoordinator.swift
//  Simple Coordinator With Router
//
//  Created by 이동건 on 29/04/2019.
//  Copyright © 2019 이동건. All rights reserved.
//

import UIKit

class ApplicationCoordinator: Coordinator {
    var childCoodinators: [Coordinator] = []
    var router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func present(animated: Bool, onDismissed: (() -> Void)?) {
        let homeViewController = HomeViewController.instantiate()
        homeViewController.delegate = self
        router.present(homeViewController, animated: animated, onDismissed: onDismissed)
    }
}

extension ApplicationCoordinator: HomeViewFlowDelegate {
    func showFirstFlowButtonDidTapped(_ viewController: HomeViewController) {
        let modalNavigationRouter = ModalNavigationRouter(parentViewController: viewController)
        let firstFlowCoordinator = FirstFlowCoordinator(router: modalNavigationRouter)
        presentChild(firstFlowCoordinator, animated: true) {
            print("😇 First Flow Did Ended")
        }
    }
    
    func showSecondFlowButtonDidTapped(_ viewController: HomeViewController) {
        let modalNavigationRouter = ModalNavigationRouter(parentViewController: viewController)
        let secondFlowCoordinator = SecondFlowCoordinator(router: modalNavigationRouter)
        presentChild(secondFlowCoordinator, animated: true) {
            print("😇 Second Flow Did Ended")
        }
    }
}
