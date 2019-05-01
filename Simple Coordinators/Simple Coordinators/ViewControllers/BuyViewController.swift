//
//  BuyViewController.swift
//  Simple Coordinators
//
//  Created by 이동건 on 28/04/2019.
//  Copyright © 2019 이동건. All rights reserved.
//

import UIKit

class BuyViewController: UIViewController {
    weak var coordinate: BuyCoordinator?
    
    var finishFlow: ((String) -> Void)?
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        guard let text = textField.text else { return }
        finishFlow?(text)
    }
}

extension BuyViewController: Storyboared { }
