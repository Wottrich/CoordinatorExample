//
//  MainViewController.swift
//  CoordinatorExample
//
//  Created by Wottrich on 06/08/19.
//  Copyright © 2019 Wottrich Enterprise Technology. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, Storyboarded {
    
    var coordinator: LoginCoordinator?
    @IBOutlet weak var txtName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginTapped(_ sender: Any) {
        if let name = txtName.text, !name.isEmpty {
            coordinator?.startNotes(name: name)
        } else {
            let alertController = UIAlertController(
                title: "Warning!",
                message: "Name is empty",
                preferredStyle: .alert
            )
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertController, animated: true)
        }
    }
    
}
