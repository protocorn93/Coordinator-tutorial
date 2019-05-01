//
//  Router.swift
//  Simple Coordinator With Router
//
//  Created by 이동건 on 29/04/2019.
//  Copyright © 2019 이동건. All rights reserved.
//

import UIKit

protocol Router: class {
    func present(_ viewController: UIViewController, animated: Bool)
    func present(_ viewController: UIViewController, animated: Bool, onDismissed: (() -> Void)?)
    func dismiss(animated: Bool)
}

extension Router {
    func present(_ viewController: UIViewController, animated: Bool) {
        present(viewController, animated: animated, onDismissed: nil)
    }
}
