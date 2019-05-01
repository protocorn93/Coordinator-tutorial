//
//  Coordinator.swift
//  Simple Coordinator With Router
//
//  Created by 이동건 on 29/04/2019.
//  Copyright © 2019 이동건. All rights reserved.
//

import Foundation

protocol Coordinator: class {
    var childCoodinators: [Coordinator] { get set }
    var router: Router { get }
    
    func present(animated: Bool, onDismissed: (() -> Void)?)
    func dimiss(animated: Bool)
    func presentChild(_ coordinator: Coordinator, animated: Bool, onDismissed: (() -> Void)?)
}

extension Coordinator {
    func dimiss(animated: Bool) {
        router.dismiss(animated: animated)
    }
    
    func presentChild(_ coordinator: Coordinator, animated: Bool, onDismissed: (() -> Void)?) {
        childCoodinators.append(coordinator)
        coordinator.present(animated: animated) { [weak self] in
            guard let self = self else { return }
            self.removeChild(coordinator)
            onDismissed?()
        }
    }
    
    private func removeChild(_ coordinator: Coordinator) {
        guard let index = childCoodinators.firstIndex(where: { $0 === coordinator}) else { return }
        childCoodinators.remove(at: index)
    }
}
