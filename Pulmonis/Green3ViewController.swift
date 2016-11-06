//
//  Green3ViewController.swift
//  Pulmonis
//
//  Created by Karow Maruf on 02/11/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit

class Green3ViewController: ListedViewController {
    
    @IBOutlet weak var gOtherMedicine: UITextView!
    @IBOutlet weak var saveButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        saveButton.layer.cornerRadius = 10
        saveButton.clipsToBounds = true
        
        gOtherMedicine.isAccessibilityElement = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func saveInputToPList() {
        if let plist = Plist(name: "PatientData") {
            
            let dict = plist.getMutablePlistFile()!
            
            dict["gOtherMedicine"] = self.gOtherMedicine.text
            
            do {
                try plist.addValuesToPlistFile(dictionary: dict)
            } catch {
                print(error)
            }
            
            
        } else {
            print("Unable to get Plist")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        controllers.append(self)
        saveList();
    }
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
