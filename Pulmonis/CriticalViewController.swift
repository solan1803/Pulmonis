//
//  CriticalViewController.swift
//  Pulmonis
//
//  Created by Manivannan Solan on 28/12/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit

class CriticalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backToMainPage(_ sender: UIButton) {
        navigationController!.popToViewController(navigationController!.viewControllers[0], animated: true)
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
