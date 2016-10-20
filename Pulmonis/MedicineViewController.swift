//
//  MedicineViewController.swift
//  Pulmonis
//
//  Created by Karow Maruf on 17/10/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit

class MedicineViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    @IBOutlet weak var takenButton: UIButton!
    @IBOutlet weak var notHaveButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notHaveButton.layer.cornerRadius = 10
        notHaveButton.clipsToBounds = true
        
        
        takenButton.layer.cornerRadius = 10
        takenButton.clipsToBounds = true
        
        /*
        let fixedWidth = textView.frame.size.width
        textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        let newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        var newFrame = textView.frame
        newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
        textView.frame = newFrame;
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showNotePopover(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "notePopover", sender: self)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "notePopover") {
            let vc = segue.destination
            let controller = vc.popoverPresentationController
            controller?.delegate = self
            controller?.sourceView = self.view;
            controller?.permittedArrowDirections = UIPopoverArrowDirection(rawValue:0)
            controller?.sourceRect = CGRect(x: (self.view.bounds).midX, y: (self.view.bounds).midY, width: 0, height: 0)
            //(x: (self.view.bounds), y: (self.view.bounds),0,0)
            
            
        }
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
 

}
