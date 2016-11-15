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
    static var patientData = [String: Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        let recognizerLeft: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: Selector(("swipeLeft:")))
        recognizerLeft.direction = .left
        self.view .addGestureRecognizer(recognizerLeft)
        
        let recognizerRight: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: Selector(("swipeRight:")))
        recognizerRight.direction = .right
        self.view .addGestureRecognizer(recognizerRight)
        */
        // Do any additional setup after loading the view.
    }
    
    func swipeLeft(recognizer : UISwipeGestureRecognizer) {
        // To be implemented by subclasses
    }
    
    func swipeRight(recognizer : UISwipeGestureRecognizer) {
        // To be implemented by subclasses
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destViewController: ListedViewController = segue.destination as! ListedViewController
        controllers.append(self)
        destViewController.controllers = self.controllers
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
