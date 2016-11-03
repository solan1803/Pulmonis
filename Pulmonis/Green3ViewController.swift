//
//  Green3ViewController.swift
//  Pulmonis
//
//  Created by Karow Maruf on 02/11/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit

class Green3ViewController: UIViewController {
    
    @IBOutlet weak var gOtherMedicine: UITextView!

    var green1: Green1ViewController?
    var green2: Green2ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(green1?.gPreventerInhalerColour.text ?? "")
        print(green1?.gPuffsMorning.text ?? "")
        print(green1?.gPuffsNight.text ?? "")
        
        print(green2?.gRelieverInhalerColour.text ?? "")
        print(green2?.gPuffsReliever.text ?? "")
        
        print(gOtherMedicine.text)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func save(_ sender: Any) {
 
        if let plist = Plist(name: "Data") {
            
            let dict = plist.getMutablePlistFile()!
            
            print(plist.getValuesInPlistFile() ?? "")
            print("-----------------------------")
            
            dict["gPreventerInhalerColour"] = green1?.gPreventerInhalerColour.text ?? ""
            dict["gPuffsMorning"] = green1?.gPuffsMorning.text ?? ""
            dict["gPuffsNight"] = green1?.gPuffsNight.text ?? ""
            dict["gRelieverInhalerColour"] = green2?.gRelieverInhalerColour.text ?? ""
            dict["gPuffsReliever"] = green2?.gPuffsReliever.text ?? ""
            dict["gOtherMedicine"] = gOtherMedicine.text ?? ""
            
            
            do {
                try plist.addValuesToPlistFile(dictionary: dict)
            } catch {
                print(error)
            }
            
        } else {
            print("Unable to get Plist")
        }
        

        performSegue(withIdentifier: "segueSave", sender: nil)
        
        
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
