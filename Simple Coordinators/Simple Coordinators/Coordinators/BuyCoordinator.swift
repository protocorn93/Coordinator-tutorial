//
//  BuyCoordinator.swift
//  Simple Coordinators
//
//  Created by 이동건 on 28/04/2019.
//  Copyright © 2019 이동건. All rights reserved.
//

import UIKit

class BuyCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    weak var parentCoordinator: MainCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let buyViewController = BuyViewController.instantiate()
        buyViewController.coordinate = self
        buyViewController.finishFlow = {[weak self] text in
            self?.sendBackToParent(text)
        }
        navigationController.pushViewController(buyViewController, animated: true)
    }
    
    private func sendBackToParent(_ data: String) {
        
    }
}
