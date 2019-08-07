//
//  NotesCoordinator.swift
//  CoordinatorExample
//
//  Created by Wottrich on 06/08/19.
//  Copyright © 2019 Wottrich Enterprise Technology. All rights reserved.
//

import UIKit

class NotesCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    weak var parentCoordinator: LoginCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start () {}
    
    func start(_ name: String) {
        let vc = NotesViewController.instantiate()
        vc.coordinator = self
        vc.name = name
        navigationController.pushViewController(vc, animated: true)
    }
    
    func didFinishNotes () {
        parentCoordinator?.childDidFinish(self)
    }

}
