//
//  SecondFlowLastViewController.swift
//  Simple Coordinator With Router
//
//  Created by 이동건 on 29/04/2019.
//  Copyright © 2019 이동건. All rights reserved.
//

import UIKit

class SecondFlowLastViewController: UIViewController, Storyboarded {
    weak var navigationDelegate: SecondFlowDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func handleDoneButton(_ sender: UIButton) {
        navigationDelegate?.handleNavigationLastViewController()
    }
}
