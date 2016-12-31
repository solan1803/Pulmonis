//
//  PollenGETRequests.swift
//  Pulmonis
//
//  Created by Sophie Seng on 31/12/2016.
//  Copyright © 2016 Manivannan Solan. All rights reserved.
//

import Foundation

let APIkey : String = "DpHEIb9EeVYowvdiDobAZuyoNoSGc9mT"
let baseURL : String = "http://dataservice.accuweather.com"
let locationURL : String = "/locations/v1/cities/geoposition/search"
let forecastURL : String = "/forecasts/v1/daily/5day/"

public func getLocationKey(latitude : Double, longitude : Double) {
    let request = NSMutableURLRequest(url: generateLocationURL(latitude: latitude, longitude: longitude) as URL)
    let session = URLSession.shared
    
    request.httpMethod = "GET"
    let _: NSError?

    
    let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, err -> Void in
        
        if err != nil {
            print(err!)
        } else {
            
            do {
                let parsedData = try JSONSerialization.jsonObject(with: data!, options: [.allowFragments]) as! [String:Any]
            
                let locationKey = parsedData["Key"] as! String
                let localisedName = parsedData["LocalizedName"] as! String
                
                let administrativeArea = parsedData["AdministrativeArea"] as! [String:Any]
                
                let localisedAdministrativeName = administrativeArea["LocalizedName"] as! String
                
                
                print(locationKey, localisedName, localisedAdministrativeName)
                //getWeatherForecast(locationKey: locationKey, name: localisedName, area: localisedAdministrativeName)
            } catch {
                print("error serializing JSON: \(error)")
            }
        }
    })
    
    task.resume()
    
}

public func generateLocationURL(latitude : Double, longitude : Double) -> NSURL {
    var url = baseURL + locationURL
    url += "?apikey=" + APIkey
    url += "&q=" + String(latitude) + "%2C" + String(longitude)
    return NSURL(string: url)!
}

public func generateForecastURL(key : String) -> NSURL {
    var url = baseURL + forecastURL + key
    url += "?apikey=" + APIkey
    url += "&details=true&metric=true"
    return NSURL(string: url)!
}

public func getWeatherForecast(locationKey : String, name : String, area : String) {
    let request = NSMutableURLRequest(url: generateForecastURL(key: locationKey) as URL)
    let session = URLSession.shared
    
    request.httpMethod = "GET"
    let _: NSError?
    
    
    let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, err -> Void in
        
        var parsedForecasts = [String]()
        
        if err != nil {
            print(err!)
        } else {
            
            do {
                let parsedData = try JSONSerialization.jsonObject(with: data!, options: []) as! [String:Any]
                
                if  let forecasts = parsedData["DailyForecasts"] as? [[String: Any]] {
                    for forecast in forecasts {
                        if let name = forecast["name"] as? String {
                            //names.append(name)
                        }
                        if let name = forecast["name"] as? String {
                            //names.append(name)
                        }
                        if let name = forecast["name"] as? String {
                            //names.append(name)
                        }
                    }
                }
                
            } catch {
                print("error serializing JSON: \(error)")
            }
        }
    })
    
    task.resume()
    
}
