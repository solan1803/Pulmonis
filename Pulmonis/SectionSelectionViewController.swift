//
//  SectionSelectionViewController.swift
//  Pulmonis
//
//  Created by Karow Maruf on 05/11/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit

class SectionSelectionViewController: UIViewController {

    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var orangeButton: UIButton!
    @IBOutlet weak var redButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        greenButton.layer.cornerRadius = 10
        greenButton.clipsToBounds = true
        greenButton.titleLabel?.textAlignment = NSTextAlignment.center
        
        orangeButton.layer.cornerRadius = 10
        orangeButton.clipsToBounds = true
        orangeButton.titleLabel?.textAlignment = NSTextAlignment.center
        
        redButton.layer.cornerRadius = 10
        redButton.clipsToBounds = true
        redButton.titleLabel?.textAlignment = NSTextAlignment.center

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
