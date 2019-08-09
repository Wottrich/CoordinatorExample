//
//  MainCoordinator.swift
//  CoordinatorExample
//
//  Created by Wottrich on 06/08/19.
//  Copyright © 2019 Wottrich Enterprise Technology. All rights reserved.
//

import UIKit

class LoginCoordinator:NSObject, Coordinator, UINavigationControllerDelegate {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        self.navigationController.delegate = self
        let vc = LoginViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func startNotes (name: String) {
        let child = NotesCoordinator(navigationController: navigationController)
        childCoordinators.append(child)
        child.parentCoordinator = self
        child.start(name)
    }
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
        
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        
        if let notesViewController = fromViewController as? NotesViewController {
            childDidFinish(notesViewController.coordinator)
        }
    }

}
