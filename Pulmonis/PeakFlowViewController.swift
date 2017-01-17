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
    
    @IBOutlet weak var connectButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ble.delegate = self
        self.hideKeyboardWhenTappedAround()
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        #if (arch(i386) || arch(x86_64)) && os(iOS)
            let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
            button.setTitle("Test Button", for: .normal)
            button.backgroundColor = UIColor.blue
            button.addTarget(self, action: #selector(segueToGraphForDebugging), for: .touchUpInside)
            
            self.view.addSubview(button)
        #endif
        
    }
    
    func segueToGraphForDebugging() {
        self.performSegue(withIdentifier: "plotBreath", sender: self)
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
        self.performSegue(withIdentifier: "plotBreath", sender: self)
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
    var breathCount = 0
    var readings: [Double] = []

    func bleDidReceiveData(data: NSData?) {
        if breathCount < 3 {
            let length = data?.length
            print("LENGTH: \(length)")
            let count = length!/MemoryLayout<UInt8>.size
            
            if (count == 1) {
                print("COUNT WAS 1")
                if let topController = UIApplication.topViewController() {
                    let graphController = topController as? PlotBreathGraphViewController
                    var times : [Double] = []
                    
                    var inc: Double = 0
                    while (inc <= Double(readings.count)*0.02) {
                        times.append(inc)
                        inc += 0.02
                    }
                    graphController?.addSensorReadings(dataPoints: readings, values: times )
                }
                breathCount += 1
                readings = []
            } else if count % 4 == 0 {
            
                var array = [UInt8](repeating: 0, count: count)
                data!.getBytes(&array, length:count * MemoryLayout<UInt8>.size)
            
                for i in stride(from: 0, through: count-1, by: 4) {
                    let arr = Array(array[i...(i+3)])
                    let u32 = UnsafePointer(arr).withMemoryRebound(to: Float.self, capacity: 1) {
                        $0.pointee
                    }
                    readings.append(Double(u32)*60)
                    print(u32)
                }
            }
        }
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

