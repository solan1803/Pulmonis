//
//  AsthmaJournalTableViewController.swift
//  Pulmonis
//
//  Created by Manivannan Solan on 29/12/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit
import CoreData

class AsthmaJournalTableViewController: UITableViewController {

    var managedObjectContext: NSManagedObjectContext? =
        (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var inhalerRecords : [SupportRecord] = []
    var meterRecords : [PeakFlowTable] = []
    var allRecords : [Any] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = false
        tableView.backgroundView = UIImageView(image: UIImage(named: "Background.png"))
        tableView.backgroundColor = UIColor.clear
        
        let request: NSFetchRequest<SupportRecord> = SupportRecord.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: false)
        request.sortDescriptors = [sortDescriptor]
        inhalerRecords = try! managedObjectContext!.fetch(request)
        
        let request2: NSFetchRequest<PeakFlowTable> = PeakFlowTable.fetchRequest()
        request2.sortDescriptors = [sortDescriptor]
        meterRecords = try! managedObjectContext!.fetch(request2)
        
        sortRecords()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func sortRecords() {
        var i = 0
        var j = 0
        while i < inhalerRecords.count && j < meterRecords.count {
            let currInhalerRecord = inhalerRecords[i]
            let currMeterRecord = meterRecords[j]
            if (currInhalerRecord.date?.isGreaterThanDate(dateToCompare: currMeterRecord.date!))! {
                allRecords.append(currInhalerRecord)
                i += 1
            } else {
                allRecords.append(currMeterRecord)
                j += 1
            }
        }
        while i < inhalerRecords.count {
            allRecords.append(inhalerRecords[i])
            i += 1
        }
        while j < meterRecords.count {
            allRecords.append(meterRecords[j])
            j += 1
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return allRecords.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : BreathRecordTableViewCell = tableView.dequeueReusableCell(withIdentifier: "breathRecord", for: indexPath) as! BreathRecordTableViewCell

        if let r = allRecords[indexPath.row] as? SupportRecord {
            cell.setDate(setDate: r.date as! Date)
            cell.setImage(inhaler: true)
            cell.setValue(value: Int(r.value), inhaler: true)
        } else if let r = allRecords[indexPath.row] as? PeakFlowTable {
            cell.setDate(setDate: r.date as! Date)
            cell.setImage(inhaler: false)
            cell.setValue(value: Int(r.value), inhaler: false)
        }
        cell.backgroundColor = UIColor.clear
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
