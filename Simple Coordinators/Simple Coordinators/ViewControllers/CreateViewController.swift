//
//  CreateViewController.swift
//  Simple Coordinators
//
//  Created by 이동건 on 28/04/2019.
//  Copyright © 2019 이동건. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {
    weak var coordinator: CreateCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        coordinator?.finishCoordinatorFlow()
    }
}

extension CreateViewController: Storyboared { }
