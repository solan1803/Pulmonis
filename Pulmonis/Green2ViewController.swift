//
//  Green2ViewController.swift
//  Pulmonis
//
//  Created by Karow Maruf on 02/11/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit

class Green2ViewController: UIViewController {

    @IBOutlet weak var gRelieverInhalerColour: UITextField!
    @IBOutlet weak var gPuffsReliever: UITextField!
    
    var green1: Green1ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destViewController3: Green3ViewController = segue.destination as! Green3ViewController
        
        destViewController3.green1 = green1
        destViewController3.green2 = self
    }

    
    @IBAction func next2(_ sender: Any) {
        if allFieldsFilled() {
            performSegue(withIdentifier: "segueGreen2", sender: nil)
        }
    }
    
    func allFieldsFilled() -> Bool {
        return !((gRelieverInhalerColour.text?.isEmpty)! ||
            (gPuffsReliever.text?.isEmpty)!)
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
