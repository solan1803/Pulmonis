//
//  PollenChartViewController.swift
//  Pulmonis
//
//  Created by Sophie Seng on 31/12/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import UIKit
import CoreLocation
import Charts

class PollenChartViewController: UIViewController, CLLocationManagerDelegate, IValueFormatter {
    
    @IBOutlet weak var forecastBarLineChartView: CombinedChartView!
    @IBOutlet weak var airQualityBarChartView: BarChartView!
    @IBOutlet weak var day1: UILabel!
    @IBOutlet weak var day2: UILabel!
    @IBOutlet weak var day3: UILabel!
    @IBOutlet weak var day4: UILabel!
    @IBOutlet weak var day5: UILabel!
    
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var infoLabel: UILabel!
    
    let FORECAST_LENGTH = 5
    
    var locationFound = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        // Do any additional setup after loading the view.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        let long = locValue.longitude;
        let lat = locValue.latitude;
        if (!locationFound) {
            locationFound = true
            print(String(lat) + "," + String(long))
            getLocationKey(latitude: lat, longitude: long)
        }
    }
    
    public func getLocationKey(latitude : Double, longitude : Double) {
        let request = NSMutableURLRequest(url: generateLocationURL(latitude: latitude, longitude: longitude) as URL)
        let session = URLSession.shared
        
        request.httpMethod = "GET"
        let _: NSError?
        
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, err -> Void in
            
            var keyCheck : String = ""
            if let httpResponse = response as? HTTPURLResponse {
                if let locationKey = httpResponse.allHeaderFields["X-Location-Key"] as? String {
                    keyCheck = locationKey
                }
            }
            
            if err != nil || keyCheck == "-1"{
                print("Error in JSON response")
            } else {
                
                do {
                    let parsedData = try JSONSerialization.jsonObject(with: data!, options: [.allowFragments]) as! [String:Any]
                    
                    let key = parsedData["Key"] as! String
                    let localisedName = parsedData["LocalizedName"] as! String
                    
                    let administrativeArea = parsedData["AdministrativeArea"] as! [String:Any]
                    
                    let localisedAdministrativeName = administrativeArea["LocalizedName"] as! String
                    
                    
                    print(key, localisedName, localisedAdministrativeName)
                    
                    self.getWeatherForecast(locationKey: key, name: localisedName, area: localisedAdministrativeName)
                } catch {
                    print("error serializing JSON: \(error)")
                }
            }
        })
        
        task.resume()
        
    }
    
    public func getWeatherForecast(locationKey : String, name : String, area : String) {
        let request = NSMutableURLRequest(url: generateForecastURL(key: locationKey) as URL)
        let session = URLSession.shared
        
        request.httpMethod = "GET"
        let _: NSError?
        
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, err -> Void in
            
            var epochsOfForecasts = [NSNumber]()
            var pollenForecasts = [(NSNumber,NSNumber,NSNumber,NSNumber,NSNumber)]()
            
            if err != nil {
                print(err!)
            } else {
                
                do {
                    let parsedData = try JSONSerialization.jsonObject(with: data!, options: []) as! [String:Any]
                    
                    if  let dailyForecasts = parsedData["DailyForecasts"] as? [[String: Any]] {
                        for forecast in dailyForecasts {
                            if let epochDate = forecast["EpochDate"] as? NSNumber {
                                epochsOfForecasts.append(epochDate)
                            }
                            
                            if let airAndPollen = forecast["AirAndPollen"] as? [[String: Any]] {
                                var airQuality : NSNumber = -1
                                var grass : NSNumber = -1
                                var mold : NSNumber = -1
                                var ragweed : NSNumber = -1
                                var tree : NSNumber = -1
                                
                                for pollen in airAndPollen {
                                    if let name = pollen["Name"] as? String {
                                        switch name {
                                        case "AirQuality":
                                            airQuality = (pollen["CategoryValue"] as? NSNumber)!
                                        case "Grass":
                                            grass = (pollen["CategoryValue"] as? NSNumber)!
                                        case "Mold":
                                            mold = (pollen["CategoryValue"] as? NSNumber)!
                                        case "Ragweed":
                                            ragweed = (pollen["CategoryValue"] as? NSNumber)!
                                        case "Tree":
                                            tree = (pollen["CategoryValue"] as? NSNumber)!
                                        default: break
                                        }
                                    }
                                }
                                pollenForecasts.append((airQuality,grass,mold,ragweed,tree))
                            }
                        }
                    }
                    
                    DispatchQueue.main.async {
                        self.infoLabel.text = "The pollen forecast for " + name + ", " + area
                        self.showForecasts(epochDates: epochsOfForecasts, forecasts: pollenForecasts)
                    }
                } catch {
                    print("error serializing JSON: \(error)")
                }
            }
        })
        
        task.resume()
        
    }
    
    // Forecast format (Air quality, Grass, Mold, Ragweed, Tree)
    func showForecasts(epochDates : [NSNumber], forecasts : [(NSNumber, NSNumber,NSNumber,NSNumber,NSNumber)]) {
        var dates :[DateComponents] = []
        
        for epochDate in epochDates {
            let date = NSDate(timeIntervalSince1970: Double(epochDate))
            let components = NSCalendar.current.dateComponents([.weekday, .day, .month], from: date as Date)
            dates.append(components) // append data we want instead?
        }
        
        var airQualityData : [ChartDataEntry] = []
        var grassData : [ChartDataEntry] = []
        var moldData : [ChartDataEntry] = []
        var ragweedData : [ChartDataEntry] = []
        var treeData : [ChartDataEntry] = []
        

        
        for i in 0..<FORECAST_LENGTH {
            airQualityData.append(BarChartDataEntry(x: Double(i) + 0.5, y: Double(forecasts[i].0)))
            grassData.append(BarChartDataEntry(x: Double(i), y: Double(forecasts[i].1)))
            moldData.append(BarChartDataEntry(x: Double(i), y: Double(forecasts[i].2)))
            ragweedData.append(BarChartDataEntry(x: Double(i), y: Double(forecasts[i].3)))
            treeData.append(BarChartDataEntry(x: Double(i), y: Double(forecasts[i].4)))
        }
        
        let airQualityDataSet = BarChartDataSet(values: airQualityData, label: "Air Quality")
        let grassDataSet = BarChartDataSet(values: grassData, label: "Grass")
        let moldDataSet = BarChartDataSet(values: moldData, label: "Mold")
        let ragweedDataSet = BarChartDataSet(values: ragweedData, label: "Ragweed")
        let treeDataSet = BarChartDataSet(values: treeData, label: "Tree")
        
        grassDataSet.setColor(NSUIColor(red:0.80, green:0.80, blue:0.60, alpha:1.0))
        moldDataSet.setColor(NSUIColor(red:0.60, green:1.00, blue:0.80, alpha:1.0))
        ragweedDataSet.setColor(NSUIColor(red:1.00, green:0.80, blue:0.60, alpha:1.0))
        treeDataSet.setColor(NSUIColor(red:1.00, green:1.00, blue:0.60, alpha:1.0))
        
        let combinedChartData : CombinedChartData = CombinedChartData()
        
        let barData : BarChartData = BarChartData(dataSet: grassDataSet)
        barData.addDataSet(moldDataSet)
        barData.addDataSet(ragweedDataSet)
        barData.addDataSet(treeDataSet)
        
        barData.barWidth = 0.225
        barData.setDrawValues(false)
        barData.groupBars(fromX: 0, groupSpace: 0.04, barSpace: 0.015)
        combinedChartData.barData = barData
        
        let airQualityBarChartData : BarChartData = BarChartData(dataSet: airQualityDataSet)
        airQualityBarChartData.setValueFormatter(self)
        
        //var lineData = LineChartData(dataSet: airQualityDataSet)
        //lineData.setDrawValues(false)
        //lineData.setValueFormatter(self)
        //combinedChartData.lineData = lineData
        
        DispatchQueue.main.async() {
            let calendar = NSCalendar(identifier: NSCalendar.Identifier.gregorian)!
            let dayFormatter = DateFormatter()
            dayFormatter.dateFormat = "EEEE"
            self.day1.text = "Today"
            self.day2.text = "Tomorrow"
            self.day3.text = dayFormatter.string(from: calendar.date(byAdding: .day, value: 2, to: NSDate() as Date, options: NSCalendar.Options())!)
            self.day4.text = dayFormatter.string(from: calendar.date(byAdding: .day, value: 3, to: NSDate() as Date, options: NSCalendar.Options())!)
            self.day5.text = dayFormatter.string(from: calendar.date(byAdding: .day, value: 4, to: NSDate() as Date, options: NSCalendar.Options())!)
            
            self.airQualityBarChartView.data = airQualityBarChartData
            self.airQualityBarChartView.notifyDataSetChanged()
            self.airQualityBarChartView.setNeedsLayout()
            self.airQualityBarChartView.setNeedsUpdateConstraints()
            //forecastBarChartView.moveViewToX(0)
            self.airQualityBarChartView.fitScreen()
            self.airQualityBarChartView.chartDescription?.text = ""
            self.airQualityBarChartView.xAxis.axisMinimum = 0
            self.airQualityBarChartView.xAxis.axisMaximum = 5
            self.airQualityBarChartView.leftAxis.axisMinimum = 0
            self.airQualityBarChartView.leftAxis.axisMaximum = 6.5
            self.airQualityBarChartView.rightAxis.axisMinimum = 0
            self.airQualityBarChartView.rightAxis.axisMaximum = 6.5
            self.airQualityBarChartView.xAxis.drawGridLinesEnabled = false
            self.airQualityBarChartView.rightAxis.drawGridLinesEnabled = false
            self.airQualityBarChartView.leftAxis.drawGridLinesEnabled = false
            self.airQualityBarChartView.rightAxis.drawLabelsEnabled = false
            self.airQualityBarChartView.leftAxis.drawLabelsEnabled = false
            self.airQualityBarChartView.xAxis.drawLabelsEnabled = false
            self.airQualityBarChartView.xAxis.labelPosition = .bothSided
            self.airQualityBarChartView.backgroundColor = UIColor(white: 1, alpha: 0.7)
            
            
            self.forecastBarLineChartView.chartDescription?.text = ""
            self.forecastBarLineChartView.xAxis.axisMinimum = 0
            self.forecastBarLineChartView.xAxis.axisMaximum = 5
            self.forecastBarLineChartView.leftAxis.axisMinimum = 0
            self.forecastBarLineChartView.leftAxis.axisMaximum = 4.5
            self.forecastBarLineChartView.rightAxis.axisMinimum = 0
            self.forecastBarLineChartView.rightAxis.axisMaximum = 4.5
            self.forecastBarLineChartView.xAxis.drawGridLinesEnabled = false
            self.forecastBarLineChartView.rightAxis.drawGridLinesEnabled = false
            self.forecastBarLineChartView.leftAxis.drawGridLinesEnabled = false
            self.forecastBarLineChartView.rightAxis.drawLabelsEnabled = false
            self.forecastBarLineChartView.leftAxis.drawLabelsEnabled = false
            self.forecastBarLineChartView.xAxis.drawLabelsEnabled = false
            self.forecastBarLineChartView.xAxis.labelPosition = .bothSided
            self.forecastBarLineChartView.backgroundColor = UIColor(white: 1, alpha: 0.7)
            self.forecastBarLineChartView.isOpaque = false
            
            
            for i in 1..<5 {
                let line : ChartLimitLine = ChartLimitLine(limit: Double(i))
                line.lineColor = NSUIColor.gray
                line.lineWidth = 0.3
                self.forecastBarLineChartView.xAxis.addLimitLine(line)
                self.airQualityBarChartView.xAxis.addLimitLine(line)
            }
            
            let explanations : [String] = [ "Low", "Moderate", "High", "Extremely Heavy"]
            for i in 1..<explanations.count+1 {
                self.forecastBarLineChartView.leftAxis.addLimitLine(ChartLimitLine(limit: Double(i), label : explanations[i-1]))
            }
            self.forecastBarLineChartView.data = combinedChartData
            //self.forecastBarLineChartView.groupBars(fromX: 0, groupSpace: 0.06, barSpace: 0.02)
            self.forecastBarLineChartView.notifyDataSetChanged()
            self.forecastBarLineChartView.setNeedsLayout()
            self.forecastBarLineChartView.setNeedsUpdateConstraints()
            //forecastBarChartView.moveViewToX(0)
            self.forecastBarLineChartView.fitScreen()
        }
        
    }
    
    func stringForValue(_ value: Double, entry: ChartDataEntry, dataSetIndex: Int, viewPortHandler: ViewPortHandler?) -> String {
        switch Int(value) {
        case 1: return "Good"
        case 2: return "Moderate"
        case 3: return "Unhealthy for Sensitive Groups"
        case 4: return "Unhealthy"
        case 5: return "Very unhealthy"
        case 6: return "Hazardous"
        default: return "Unknown"
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
