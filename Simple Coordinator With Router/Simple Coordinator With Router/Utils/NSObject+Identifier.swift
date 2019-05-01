//
//  NSObject+Identifier.swift
//  Simple Coordinator With Router
//
//  Created by 이동건 on 29/04/2019.
//  Copyright © 2019 이동건. All rights reserved.
//

import Foundation

extension NSObject {
    static var identifier: String {
        return String(describing: self)
    }
}
