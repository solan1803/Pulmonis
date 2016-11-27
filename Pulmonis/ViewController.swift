//
//  ViewController.swift
//  Pulmonis
//
//  Created by Manivannan Solan on 14/10/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit

extension UILabel{
    func addTextSpacing(spacing: CGFloat){
        let attributedString = NSMutableAttributedString(string: self.text!)
        attributedString.addAttribute(NSKernAttributeName, value: spacing, range: NSRange(location: 0, length: self.text!.characters.count))
        self.attributedText = attributedString
    }
}

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    @IBOutlet weak var learnImage: UIImageView!
    @IBOutlet weak var pulmonisTitle: UILabel!

    
    @IBOutlet weak var logRelieverInhaler: UIButton!
    @IBOutlet weak var logPreventerInhaler: UIButton!
    @IBOutlet weak var settingsBarItem: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsBarItem.title = NSString(string: "\u{2699}") as String//NSString("\u26ED");
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        pulmonisTitle.text = "PULMONIS"
        pulmonisTitle.addTextSpacing(spacing: 3)
        // Do any additional setup after loading the view, typically from a nib.
//        logPreventerInhaler.titleLabel?.textAlignment = NSTextAlignment.center;
//        logRelieverInhaler.titleLabel?.textAlignment = NSTextAlignment.center;
        
        self.hideKeyboardWhenTappedAround()
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    @IBAction func showLogPreventerInhalerPopover(_ sender: UIButton) {
        self.performSegue(withIdentifier: "logPreventerInhalerPopover", sender: self)
    }
   
    @IBAction func showLogRelieverInhalerPopover(_ sender: UIButton) {
        self.performSegue(withIdentifier: "logRelieverInhalerPopover", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "logPreventerInhalerPopover" || segue.identifier == "logRelieverInhalerPopover") {
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

