//
//  ViewController.swift
//  Simple Coordinators
//
//  Created by 이동건 on 28/04/2019.
//  Copyright © 2019 이동건. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func handleCreateButton(_ sender: Any) {
        coordinator?.showCreateViewController()
    }
    
    @IBAction func handleBuyButton(_ sender: Any) {
        coordinator?.showBuyViewController()
    }
}

extension ViewController: Storyboared {
    
}
