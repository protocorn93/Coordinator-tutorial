//
//  Storyboarded.swift
//  Simple Coordinator With Router
//
//  Created by 이동건 on 29/04/2019.
//  Copyright © 2019 이동건. All rights reserved.
//

import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: Self.identifier, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: Self.identifier)
        return viewController as! Self
    }
}
