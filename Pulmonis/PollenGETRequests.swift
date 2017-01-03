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

