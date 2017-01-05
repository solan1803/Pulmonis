//
//  MedicineViewController.swift
//  Pulmonis
//
//  Created by Karow Maruf on 17/10/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit
import CoreData
import UserNotifications

class MedicineViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    // MARK: Model
    var managedObjectContext: NSManagedObjectContext? =
        (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var takenButton: UIButton!
    @IBOutlet weak var notHaveButton: UIButton!
    
    @IBOutlet weak var dosageLabel: UILabel!
    
    @IBOutlet weak var medicineAlertLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("[DEBUG] viewDidLoad of medicine view controller")
        performSegue(withIdentifier: "notePopover", sender: self)
        notHaveButton.layer.cornerRadius = 10
        notHaveButton.clipsToBounds = true
        
        
        takenButton.layer.cornerRadius = 10
        takenButton.clipsToBounds = true
        addContactGPTask()
        var dosageNumber = ""
        var days = ""
        if let plist = Plist(name: "PatientData") {
            let dict = plist.getMutablePlistFile()!
            
            if let dosage = (dict[yTabletDosageStr]! as? String) {
                if dosage != "" {
                    dosageNumber = String(Int(dosage)!/5)
                }
            }
            if let d = (dict[yTabletDurationStr]! as? String) {
                if d != "" {
                    days = d
                }
            }
        } else {
            //Error with opening the PList
        }
        dosageLabel.text = "\(dosageNumber) tablets"
        medicineAlertLabel.text =  "Please take \(dosageNumber) x 5mg of prednisolone tablets immediately and again every morning for \(days) days or until you are fully better."
        
    }
    
    @IBAction func showNotePopover(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "notePopover", sender: self)
    }
    
    func scheduleNotification(date: Date, title: String, body: String, identifier: String, image: String) {
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents(in: .current, from: date)
        let newComponents = DateComponents(calendar: calendar, timeZone: .current, month: components.month, day: components.day, hour: components.hour, minute: components.minute)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: newComponents, repeats: false)
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default()
        if let path = Bundle.main.path(forResource: image, ofType: "png") {
            let url = URL(fileURLWithPath: path)
            do {
                let attachment = try UNNotificationAttachment(identifier: image, url: url, options: nil)
                content.attachments = [attachment]
            } catch {
                print("The attachment was not loaded.")
            }
        }
        
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) {(error) in
            if let error = error {
                print("Uh oh! We had an error: \(error)")
            }
        }
    }

    func addContactGPTask() {
        if let task = NSEntityDescription.insertNewObject(forEntityName: "PendingTask", into: managedObjectContext!) as? PendingTask {
            task.date_created = NSDate()
            task.message = "Your treatment may need to be reviewed."
            task.type = "contactGP"
            task.reminder_time = NSDate().addingTimeInterval(60.0)
            scheduleNotification(date: task.reminder_time as! Date, title: "Contact GP", body: task.message!, identifier: task.type!, image: "call_button")
        }
        do {
            try managedObjectContext?.save()
        } catch let error {
            print(error)
        }
    }
    
    @IBAction func addMedicineNotification(_ sender: UIButton) {
        print("INSIDE ADD_MEDICINE_NOTIFICATION METHOD")
        if let task = NSEntityDescription.insertNewObject(forEntityName: "PendingTask", into: managedObjectContext!) as? PendingTask {
            task.date_created = NSDate()
            task.message = "Please remember to take your prednisolone tablets."
            task.type = "medicine"
            task.reminder_time = NSDate().addingTimeInterval(60.0)
            scheduleNotification(date: task.reminder_time as! Date, title: "Medication Reminder", body: task.message!, identifier: task.type!, image: "Pill")
        }
        do {
            try managedObjectContext?.save()
        } catch let error {
            print(error)
        }
        let request: NSFetchRequest<PendingTask> = PendingTask.fetchRequest()
        let result = try? managedObjectContext!.fetch(request)
        print("Printing all pending tasks")
        for r in result! {
            print("DATE CREATED: ")
            print(r.date_created!)
            print("MESSAGE: ")
            print(r.message!)
            print("REMINDER TIME: ")
            print(r.reminder_time!)
            print("TYPE: ")
            print(r.type!)
        }
        
        backToMainPage()
    }
    
    @IBAction func takenMedicine(_ sender: UIButton) {
        backToMainPage()
    }
    
    func backToMainPage() {
        navigationController!.popToViewController(navigationController!.viewControllers[0], animated: true)
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
