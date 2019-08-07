//
//  NotesViewController.swift
//  CoordinatorExample
//
//  Created by Wottrich on 06/08/19.
//  Copyright © 2019 Wottrich Enterprise Technology. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController, Storyboarded {

    weak var coordinator: NotesCoordinator?
    var name: String?
    
    @IBOutlet weak var lblName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblName.text = name
    }

}
