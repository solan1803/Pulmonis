//
//  PlotBreathGraphViewController.swift
//  Pulmonis
//
//  Created by Manivannan Solan on 23/12/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit
import Charts
import CoreData

class PlotBreathGraphViewController: UIViewController {
    
    @IBOutlet weak var breathLineView: LineChartView!

    var managedObjectContext: NSManagedObjectContext? =
        (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    
    var minXPoint : Double = 0
    var maxXPoint : Double = 0
    
    var minYPoint : Double = 0
    var maxYPoint : Double = 0
    var i = 0
    var colourCounter = 0
    var dataSetColours : [NSUIColor] = [NSUIColor.blue, NSUIColor.cyan, NSUIColor.green]
    var peakFlowReading : Double = 0.0
    var breathCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        breathLineView.dragEnabled = true
        breathLineView.pinchZoomEnabled = true
        
        breathLineView.noDataText = "No breaths recorded, please breathe into the spirometer"
        breathLineView.chartDescription?.text = ""
        breathLineView.legend.enabled = false
        breathLineView.xAxis.labelPosition = .bottom
        breathLineView.backgroundColor = UIColor.clear
        
        #if (arch(i386) || arch(x86_64)) && os(iOS)
        let button100 = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 20))
        button100.setTitle("Test 100", for: .normal)
        button100.backgroundColor = UIColor.blue
        button100.addTarget(self, action: #selector(buttonAction100), for: .touchUpInside)
        self.view.addSubview(button100)
            
        let button300 = UIButton(frame: CGRect(x: 100, y: 125, width: 100, height: 20))
        button300.setTitle("Test 300", for: .normal)
        button300.backgroundColor = UIColor.blue
        button300.addTarget(self, action: #selector(buttonAction300), for: .touchUpInside)
        self.view.addSubview(button300)
        
        let button600 = UIButton(frame: CGRect(x: 100, y: 150, width: 100, height: 20))
        button600.setTitle("Test 600", for: .normal)
        button600.backgroundColor = UIColor.blue
        button600.addTarget(self, action: #selector(buttonAction600), for: .touchUpInside)
        self.view.addSubview(button600)
        #endif
    }
    
    
    //For test purposes
    func buttonAction100() {
        let dataPoints: [Double] = [1,2,3,4,5,6,7,8,9,10]
        let values: [Double] = [1,4,9,16,25,36,49,64,81,100]
        addSensorReadings(dataPoints: values, values: dataPoints)
    }
    
    func buttonAction300() {
        let dataPoints: [Double] = [1,2,3,4,5,6,7,8,9,10]
        let values: [Double] = [1,4,9,16,25,36,49,64,81,300]
        addSensorReadings(dataPoints: values, values: dataPoints)
    }
    
    func buttonAction600() {
        let dataPoints: [Double] = [1,2,3,4,5,6,7,8,9,10]
        let values: [Double] = [1,4,9,16,25,36,49,64,81,600]
        addSensorReadings(dataPoints: values, values: dataPoints)
    }
    
    func addSensorReadings(dataPoints: [Double], values: [Double]) {
        
        var dataEntries: [ChartDataEntry] = []
        
        var colours : [NSUIColor] = []
        var maxVal : Double = 0
        var maxIndex = 0
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(x: values[i], y: dataPoints[i])
            if (maxVal < dataPoints[i]) {
                maxVal = dataPoints[i]
                maxIndex = i
            }
            dataEntries.append(dataEntry)
            colours.append(dataSetColours[colourCounter])
        }
        peakFlowReading = max(peakFlowReading, maxVal)
        colours[maxIndex] = NSUIColor.red
        
        let chartDataSet = LineChartDataSet(values: dataEntries, label: "Reading\(colourCounter)")
        //chartDataSet.setColors(colours, alpha: 1)
        chartDataSet.mode = .cubicBezier
        chartDataSet.setColor(dataSetColours[colourCounter])
        chartDataSet.drawValuesEnabled = true
        chartDataSet.circleColors = colours
        
        if (colourCounter == 0) {
            let chartData = LineChartData(dataSet: chartDataSet)
            breathLineView.data = chartData
        } else {
            breathLineView.data?.addDataSet(chartDataSet)
        }
        colourCounter += 1
        
        breathLineView.notifyDataSetChanged()
        breathLineView.setNeedsLayout()
        breathLineView.setNeedsDisplay()
        breathLineView.setNeedsUpdateConstraints()
        //breathLineView.moveViewToX(0)
        breathLineView.fitScreen()
        breathLineView.animate(xAxisDuration: 1.0, yAxisDuration: 1.0, easingOption: .easeInCubic)
        breathCount += 1
        if (breathCount == 3) {
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Continue", style: .plain, target: self, action: #selector(segueToCheckAsthmaStatus))
//            let button = UIButton(frame: CGRect(x: 250, y: 600, width: 100, height: 50))
//            button.setTitle("Continue", for: .normal)
//            button.backgroundColor = UIColor.blue
//            button.addTarget(self, action: #selector(segueToCheckAsthmaStatus), for: .touchUpInside)
//            self.view.addSubview(button)
        }
    }
    
    func segueToCheckAsthmaStatus() {
        if let record = NSEntityDescription.insertNewObject(forEntityName: "PeakFlowTable", into: managedObjectContext!) as? PeakFlowTable {
            record.date = NSDate()
            record.value = Int16(peakFlowReading)
        }
        do {
            try managedObjectContext?.save()
        } catch let error {
            print(error)
        }
        self.performSegue(withIdentifier: "showAsthmaStatus", sender: self)
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
