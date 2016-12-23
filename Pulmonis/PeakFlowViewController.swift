//
//  PeakFlowViewController.swift
//  Pulmonis
//
//  Created by Manivannan Solan on 01/11/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit
import CoreData

class PeakFlowViewController: UIViewController, BLEDelegate {

    // MARK: Model
    
    // if this is nil, then we simply don't update the database
    // having this default to the AppDelegate's context is a little bit of "demo cheat"
    // probably it would be better to subclass TweetTableViewController
    // and set this var in that subclass and then use that subclass in our storyboard
    // (the only purpose of that subclass would be to pick what database we're using)
    var managedObjectContext: NSManagedObjectContext? =
        (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var ble = BLE()
    
    
    @IBOutlet weak var maxBluetoothValueLabel: UILabel!
    @IBOutlet weak var bluetoothValueLabel: UILabel!
    
    var bluetoothText : String = "" {
        didSet(newValue) {
            print("SETTING BLUETOOTH VALUE")
            bluetoothValueLabel.text! = newValue
        }
    }
    
    @IBOutlet weak var connectButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ble.delegate = self
        self.hideKeyboardWhenTappedAround()
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        // Do any additional setup after loading the view.
    }
    
   

//    @IBAction func savePeakFlow(_ sender: UIButton) {
//        print("INSIDE SAVEPEAKFLOW METHOD")
//        if let peak_record = NSEntityDescription.insertNewObject(forEntityName: "PeakFlowTable", into: managedObjectContext!) as? PeakFlowTable {
//            peak_record.date = NSDate()
//            let text = (peakFlowTextField.text! as NSString).integerValue
//            let val = Int16(text)
//            peak_record.value = val
//        }
//        do {
//            try managedObjectContext?.save()
//        } catch let error {
//            print(error)
//        }
//        let request: NSFetchRequest<PeakFlowTable> = PeakFlowTable.fetchRequest()
//        let result = try? managedObjectContext!.fetch(request)
//        
//        for r in result! {
//            print("DATE: ")
//            print(r.date!)
//            print("VALUE: ")
//            print(r.value)
//        }
//        
//    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func connectBluetooth(_ sender: UIButton) {
        print("connectBluetooth")
        connectButton.setTitle("Connecting...", for: .normal)
        // find BLE peripherals
        _ = ble.startScanning(timeout: 2)
    }
    
    // BLE DELEGATE METHODS
    func bleDidUpdateState(){
        
        
    }
    
    func bleDidConnectToPeripheral(){
        connectButton.setTitle("Connected!", for: .normal)
        performSegue(withIdentifier: "plot", sender: <#T##Any?#>)
        print("->Connected")
        
        // send reset
        let buf = [0x04, 0x00, 0x00]
        let data = NSData(bytes: buf, length: 3)
        ble.write(data: data)
        
        // Schedule to read RSSI every 1 sec.
        //        rssiTimer = [NSTimer scheduledTimerWithTimeInterval:(float)1.0 target:self selector:@selector(readRSSITimer:) userInfo:nil repeats:YES];
        //        var rssiTimer = Timer.scheduledTimer(timeInterval: (1.0), target: self, selector: #selector(readRSSITimer), userInfo: nil, repeats: true)
    }
    func bleDidDisconenctFromPeripheral() {
        print("->DISCONNECTED")
    }
    
    var maxPeakFlowValue : Float = 0.0
    
    func bleDidReceiveData(data: NSData?) {
        let length = data?.length
        print("LENGTH: \(length)")
        let count = length!/MemoryLayout<UInt8>.size
        var array = [UInt8](repeating: 0, count: count)
        data!.getBytes(&array, length:count * MemoryLayout<UInt8>.size)
        for i in stride(from: 0, through: count-1, by: 4) {//= 0; i < count; i+=4 {
            let arr = Array(array[i...(i+3)])
            let u32 = UnsafePointer(arr).withMemoryRebound(to: Float.self, capacity: 1) {
                $0.pointee
            }
            print(u32)
            let f = String(format:"%02f", u32)
            bluetoothValueLabel.text! = "Running Value: " + f
            maxPeakFlowValue = max(maxPeakFlowValue, u32)
            let m = String(format: "%02f", max(maxPeakFlowValue, u32))
            maxBluetoothValueLabel.text! = "Max Value: " + m
        }
//        bluetoothText = "h"
//        let flo = String(format:"%02f", u32)
//        print(flo)
//        for i in 0 ..< count {
//            let hex = String(format:"0x%02X", array[i])
//            let dec = String(format:"%02d", array[i])
//            print(dec)
//            let value = UInt8(hex, radix: 16)
//            bluetoothText = dec
//        }
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

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
        
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += keyboardSize.height
            }
        }
    }
}
