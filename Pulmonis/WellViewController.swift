//
//  WellViewController.swift
//  Pulmonis
//
//  Created by Manivannan Solan on 28/12/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit

class WellViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func backToMainPage(_ sender: Any) {
        navigationController!.popToViewController(navigationController!.viewControllers[0], animated: true)
    }
    
}
