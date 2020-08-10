//
//  WeatherManager.swift
//  Wait Check Clima
//
//  Created by Harrison Gittos on 10/08/2020.
//  Copyright © 2020 Harrison Gittos. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "http://api.openweathermap.org/data/2.5/weather?units=metric";
    
    func fetchWeather(cityname: String) {
        let urlString = "\(weatherURL)&q=\(cityname)&appid=";
        print(urlString);
    }
}
