//
//  PlotBreathGraphViewController.swift
//  Pulmonis
//
//  Created by Manivannan Solan on 23/12/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit
import Charts

class PlotBreathGraphViewController: UIViewController {
    
    @IBOutlet weak var breathLineView: LineChartView!

    var minXPoint : Double = 0
    var maxXPoint : Double = 0
    
    var minYPoint : Double = 0
    var maxYPoint : Double = 0
    var i = 0
    var colourCounter = 0
    var dataSetColours : [NSUIColor] = [NSUIColor.blue, NSUIColor.cyan, NSUIColor.green]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        breathLineView.dragEnabled = false
        breathLineView.pinchZoomEnabled = false
        
        breathLineView.noDataText = "No breaths recorded, please breathe into the spirometer"
        breathLineView.chartDescription?.text = ""
        breathLineView.legend.enabled = false
        breathLineView.xAxis.labelPosition = .bottom
        
        //var dataEntries: [ChartDataEntry] = []
        //
        //dataEntries.append(ChartDataEntry(x: 0, y: 0))
        //let chartDataSet = LineChartDataSet(values: dataEntries, label: "Pressure")
        //let chartData = LineChartData(dataSet: chartDataSet)
        //breathLineView.data = chartData
        
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        button.setTitle("Test Button", for: .normal)
        button.backgroundColor = UIColor.blue
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        self.view.addSubview(button)
        
        // Do any additional setup after loading the view.
    }
    
    
    //For test purposes
    func buttonAction(sender: UIButton!) {
        let dataPoints: [Double] = [1,2,3,4,5,6,7,8,9,10]
        let values: [Double] = [1,4,9,16,25,36,49,64,81,100]
        let values2: [Double] = [3,8,12,19,35,39,41,59,69,58]
        let values3: [Double] = [9,15,23,39,47,58,59,78,67,69]
        print("button pressed, i is ", i)
        //addSensorReading(dataPoint: dataPoints[i], value: values[i])
        if (i == 0) {
            addSensorReadings(dataPoints: values, values: dataPoints)
        } else if (i == 1){
            addSensorReadings(dataPoints: values2, values: dataPoints)
        } else {
            addSensorReadings(dataPoints: values3, values: dataPoints)
        }
        i += 1
    }
    
    func addSensorReading(dataPoint: Double, value: Double) {
        let dataEntry = ChartDataEntry(x: dataPoint, y: value)
        breathLineView.data?.addEntry(dataEntry, dataSetIndex: 0)
        
        if (dataPoint > maxXPoint) {
            breathLineView.setVisibleXRangeMaximum(dataPoint)
            maxXPoint = dataPoint
            
        } else if (dataPoint < minXPoint) {
            breathLineView.setVisibleXRangeMinimum(dataPoint)
            minXPoint = dataPoint
        }
        
        if (value > maxYPoint) {
            breathLineView.setVisibleYRangeMaximum(value, axis: breathLineView.leftAxis.axisDependency)
            breathLineView.setVisibleYRangeMaximum(value, axis: breathLineView.rightAxis.axisDependency)
            maxXPoint = value
            
        } else if (value < minYPoint) {
            breathLineView.setVisibleYRangeMinimum(value, axis: breathLineView.leftAxis.axisDependency)
            breathLineView.setVisibleYRangeMinimum(value, axis: breathLineView.leftAxis.axisDependency)
            minXPoint = value
        }
        print("added ", dataPoint, ", ", value)
        // print(breathLineView.data)
        breathLineView.notifyDataSetChanged()
        breathLineView.setNeedsLayout()
        breathLineView.setNeedsDisplay()
        breathLineView.setNeedsUpdateConstraints()
        breathLineView.moveViewToX(0)
        breathLineView.fitScreen()
        
    }
    
    func addSensorReadings(dataPoints: [Double], values: [Double]) {
        
        var dataEntries: [ChartDataEntry] = []
        
        var colours : [NSUIColor] = []
        var max : Double = 0
        var maxIndex = 0
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(x: values[i], y: dataPoints[i])
            if (max < dataPoints[i]) {
                max = dataPoints[i]
                maxIndex = i
            }
            dataEntries.append(dataEntry)
            colours.append(dataSetColours[colourCounter])
        }
        colours[maxIndex] = NSUIColor.red
        
        let chartDataSet = LineChartDataSet(values: dataEntries, label: "Reading\(colourCounter)")
        //chartDataSet.setColors(colours, alpha: 1)
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
