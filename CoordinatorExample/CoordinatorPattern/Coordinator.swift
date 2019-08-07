//
//  Cordinator.swift
//  CoordinatorExample
//
//  Created by Wottrich on 06/08/19.
//  Copyright © 2019 Wottrich Enterprise Technology. All rights reserved.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start ()
}
