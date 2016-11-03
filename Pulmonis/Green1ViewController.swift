//
//  Green1ViewController.swift
//  Pulmonis
//
//  Created by Karow Maruf on 02/11/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit

class Green1ViewController: UIViewController {

    @IBOutlet weak var gPreventerInhalerColour: UITextField!
    @IBOutlet weak var gPuffsMorning: UITextField!
    @IBOutlet weak var gPuffsNight: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destViewController2: Green2ViewController = segue.destination as! Green2ViewController
    
        destViewController2.green1 = self
        /*
        destViewController2.gPreventerInhalerColour = gPreventerInhalerColour.text!
        destViewController2.gPuffsMorning = Int(gPuffsMorning.text!)!
        destViewController2.gPuffsNight = Int(gPuffsNight.text!)!
        */
    }
    
    @IBAction func next1(_ sender: Any) {
        if allFieldsFilled() {
            performSegue(withIdentifier: "segueGreen1", sender: nil)
        }
    }
    
    func allFieldsFilled() -> Bool {
        return !((gPreventerInhalerColour.text?.isEmpty)! ||
               (gPuffsMorning.text?.isEmpty)! ||
               (gPuffsNight.text?.isEmpty)!)
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
