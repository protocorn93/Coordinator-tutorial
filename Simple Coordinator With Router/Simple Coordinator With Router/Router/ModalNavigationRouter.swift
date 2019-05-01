//
//  ModalNavigationRouter.swift
//  Simple Coordinator With Router
//
//  Created by 이동건 on 30/04/2019.
//  Copyright © 2019 이동건. All rights reserved.
//

import UIKit

class ModalNavigationRouter: NSObject {
    private var onDismissForViewController: [UIViewController: (() -> Void)] = [:]
    private let navigationController = UINavigationController()
    
    weak var parentViewController: UIViewController?
    
    init(parentViewController: UIViewController) {
        self.parentViewController = parentViewController
        super.init()
        navigationController.delegate = self
    }
}

extension ModalNavigationRouter: Router {
    func present(_ viewController: UIViewController, animated: Bool, onDismissed: (() -> Void)?) {
        onDismissForViewController[viewController] = onDismissed // 핸들러 저장
        if navigationController.viewControllers.isEmpty {
            modal(viewController, animated: animated)
        }else {
            push(viewController, animated: animated)
        }
    }
    
    func dismiss(animated: Bool) {
        guard let rootViewController = navigationController.viewControllers.first else { return }
        performOnDismissed(for: rootViewController)
        parentViewController?.dismiss(animated: animated, completion: nil)
    }
    
    private func modal(_ viewController: UIViewController, animated: Bool) {
        addCancelButton(to: viewController)
        navigationController.setViewControllers([viewController], animated: animated)
        parentViewController?.present(navigationController, animated: true, completion: nil)
    }
    
    private func addCancelButton(to viewController: UIViewController) {
        viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(handleCancel))
    }
    
    private func push(_ viewController: UIViewController, animated: Bool) {
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    @objc func handleCancel() {
        guard let rootViewController = navigationController.viewControllers.first else { return }
        performOnDismissed(for: rootViewController)
        dismiss(animated: true)
    }
    
    private func performOnDismissed(for viewController: UIViewController) {
        guard let onDismiss = onDismissForViewController[viewController] else { return }
        onDismiss()
        onDismissForViewController[viewController] = nil
    }
}

extension ModalNavigationRouter: UINavigationControllerDelegate {
    public func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
        guard let dismissedViewController = navigationController.transitionCoordinator?.viewController(forKey: .from), !navigationController.viewControllers .contains(dismissedViewController) else {
                    return
        }
        performOnDismissed(for: dismissedViewController)
    }
}
