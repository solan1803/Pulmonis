//
//  ListedViewController.swift
//  Pulmonis
//
//  Created by Karow Maruf on 03/11/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit

class ListedViewController: UIViewController {

    var controllers = [ListedViewController]()
    static var patientData: NSMutableDictionary!   //[String: Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func saveField() {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        saveField()
    }
    
    override func willMove(toParentViewController parent: UIViewController?) {
        super.willMove(toParentViewController: parent)
        
        saveField()
        
    }
    
    func saveInputToPList() {
        preconditionFailure("This method must be overridden")
    }

    func saveList() {
        for view in controllers {
            view.saveInputToPList()
        }
    }
    
}
