//
//  SymptomsViewController.swift
//  Pulmonis
//
//  Created by Karow Maruf on 17/10/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit

class SymptomsViewController: UIViewController {

    @IBOutlet weak var symptomsButton: UIButton!
    @IBOutlet weak var breathlessButton: UIButton!
    @IBOutlet weak var inhalerButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        symptomsButton.layer.cornerRadius = 10
        symptomsButton.clipsToBounds = true
        
        breathlessButton.layer.cornerRadius = 10
        breathlessButton.clipsToBounds = true
        
        inhalerButton.layer.cornerRadius = 10
        inhalerButton.clipsToBounds = true
        
        nextButton.layer.cornerRadius = 10
        nextButton.clipsToBounds = true
        
        inhalerButton.titleLabel?.textAlignment = NSTextAlignment.center
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()
//        self.navigationController?.navigationBar.isTranslucent = true
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
