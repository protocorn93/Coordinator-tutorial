//
//  ViewController.swift
//  Simple Coordinator With Router
//
//  Created by 이동건 on 29/04/2019.
//  Copyright © 2019 이동건. All rights reserved.
//

import UIKit

protocol HomeViewFlowDelegate: class {
    func showFirstFlowButtonDidTapped(_ viewController: HomeViewController)
    func showSecondFlowButtonDidTapped(_ viewController: HomeViewController)
}

class HomeViewController: UIViewController, Storyboarded {
    weak var delegate: HomeViewFlowDelegate?
    
    @IBAction func showFirstFlowButton(_ sender: UIButton) { delegate?.showFirstFlowButtonDidTapped(self) }
    @IBAction func showSecondFlowButton(_ sender: UIButton) { delegate?.showSecondFlowButtonDidTapped(self) }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

