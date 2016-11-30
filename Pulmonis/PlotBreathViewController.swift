//
//  PlotBreathViewController.swift
//  Pulmonis
//
//  Created by Seng, Sophie on 30/11/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit
import Charts

class PlotBreathViewController: UIViewController {

    @IBOutlet weak var breathLineView: LineChartView!
    var minXPoint : Double = 0
    var maxXPoint : Double = 0
    
    var minYPoint : Double = 0
    var maxYPoint : Double = 0
    var i = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        breathLineView.dragEnabled = false
        breathLineView.pinchZoomEnabled = false
        
        breathLineView.noDataText = "No breaths recorded, please breathe into the spirometer"
        breathLineView.chartDescription?.text = ""
        
        var dataEntries: [ChartDataEntry] = []
        
        dataEntries.append(ChartDataEntry(x: 0, y: 0))
        let chartDataSet = LineChartDataSet(values: dataEntries, label: "Pressure")
        let chartData = LineChartData(dataSet: chartDataSet)
        breathLineView.data = chartData

        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        button.setTitle("Test Button", for: .normal)
        button.backgroundColor = UIColor.blue
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        self.view.addSubview(button)

        // Do any additional setup after loading the view.
    }
    
    
    //For test purposes
    func buttonAction(sender: UIButton!) {
        var dataPoints: [Double] = [1,2,3,4,5,6,7,8,9,10]
        var values: [Double] = [1,4,9,16,25,36,49,64,81,100]
        print("button pressed, i is ", i)
        addSensorReading(dataPoint: dataPoints[i], value: values[i])
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
        print(breathLineView.data)
        breathLineView.notifyDataSetChanged()
        breathLineView.setNeedsLayout()
        breathLineView.setNeedsDisplay()
        breathLineView.setNeedsUpdateConstraints()
        breathLineView.moveViewToX(0)
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
