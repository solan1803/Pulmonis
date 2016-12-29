//
//  ViewController.swift
//  Pulmonis
//
//  Created by Manivannan Solan on 14/10/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit
import CoreData

extension UILabel{
    func addTextSpacing(spacing: CGFloat){
        let attributedString = NSMutableAttributedString(string: self.text!)
        attributedString.addAttribute(NSKernAttributeName, value: spacing, range: NSRange(location: 0, length: self.text!.characters.count))
        self.attributedText = attributedString
    }
}

class ViewController: UIViewController {
    
    var managedObjectContext: NSManagedObjectContext? =
        (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var learnImage: UIImageView!
    @IBOutlet weak var pulmonisTitle: UILabel!
    @IBOutlet weak var settingsBarItem: UIBarButtonItem!
    
    @IBOutlet weak var notificationImage1: UIImageView!
    @IBOutlet weak var notificationImage2: UIImageView!
    @IBOutlet weak var notificationMessage1: UIButton!
    @IBOutlet weak var notificationMessage2: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsBarItem.title = NSString(string: "\u{2699}") as String//NSString("\u26ED");
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        pulmonisTitle.text = "PULMONIS"
        pulmonisTitle.addTextSpacing(spacing: 3)
        
        self.hideKeyboardWhenTappedAround()
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        var tasksList : [PendingTask] = []
        let request: NSFetchRequest<PendingTask> = PendingTask.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "date_created", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        request.fetchLimit = 2
        tasksList = try! managedObjectContext!.fetch(request)
        notificationMessage1.setTitle("No current pending tasks", for: .normal)
        notificationMessage2.setTitle("", for: .normal)
        notificationImage1.image = nil
        notificationImage2.image = nil
        if tasksList.count >= 1 {
            setNotificationMessage(typeOfNotification: tasksList[0].type!, notificationNumber: 1);
        }
        if tasksList.count >= 2 {
            setNotificationMessage(typeOfNotification: tasksList[1].type!, notificationNumber: 2)
        }
    }
    
    func setNotificationMessage(typeOfNotification: String, notificationNumber: Int) {
        var notificationMessageButton : UIButton
        var notificationImage : UIImageView
        if notificationNumber == 1 {
            notificationMessageButton = notificationMessage1
            notificationImage = notificationImage1
        } else {
            notificationMessageButton = notificationMessage2
            notificationImage = notificationImage2
        }
        
        switch typeOfNotification {
        case "medicine" :
            notificationMessageButton.setTitle("Medication reminder", for: .normal)
            notificationImage.image = UIImage(named: "pill")
        case "contactGP" :
            notificationMessageButton.setTitle("Talk to your GP", for: .normal)
            notificationImage.image = UIImage(named: "call_button")
        default:
            break;
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
    }

    */
    

}

