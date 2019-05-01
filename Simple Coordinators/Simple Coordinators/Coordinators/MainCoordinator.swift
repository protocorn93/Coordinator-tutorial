//
//  MainCoordinator.swift
//  Simple Coordinators
//
//  Created by 이동건 on 28/04/2019.
//  Copyright © 2019 이동건. All rights reserved.
//

import UIKit

class MainCoordinator: NSObject, Coordinator {
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.delegate = self
        let viewController = ViewController.instantiate()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showBuyViewController() {
        let buyCoordinator = BuyCoordinator(navigationController: navigationController)
        childCoordinators.append(buyCoordinator)
        buyCoordinator.parentCoordinator = self
        buyCoordinator.start()
    }
    
    func showCreateViewController() {
        let createCoordinator = CreateCoordinator(navigationController: navigationController)
        childCoordinators.append(createCoordinator)
        createCoordinator.parentCoordinator = self
        createCoordinator.start()
    }
    
    func finishChildCoordinatorFlow(_ coordinator: Coordinator?) {
        childCoordinators.removeAll { return $0 === coordinator }
    }
}

// MARK:- UINavigationControllerDelegate
extension MainCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else { return }
        
        // It means that from viewController push Some View Controller
        if navigationController.viewControllers.contains(fromViewController) { return }
        
        // If not, fromViewController is popped
        if let buyViewController = fromViewController as? BuyViewController {
            finishChildCoordinatorFlow(buyViewController.coordinate)
        }
    }
}
