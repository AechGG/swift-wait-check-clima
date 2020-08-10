//
//  WeatherManager.swift
//  Wait Check Clima
//
//  Created by Harrison Gittos on 10/08/2020.
//  Copyright © 2020 Harrison Gittos. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?units=metric";
    
    func fetchWeather(cityname: String) {
        let urlString = "\(weatherURL)&q=\(cityname)&appid=";
        performRequest(urlString);
    }
    
    func performRequest(_ urlString: String) {
        // 1. Create URL
        if let url = URL(string: urlString) {
            // 2. Create a URLSession
            let session = URLSession(configuration: .default);
            
            // 3. Give the session a task
            let task = session.dataTask(with: url, completionHandler: handleRequest(data:urlResponse:error:));
            
            // 4. Start the task
            task.resume();
        }
    }
    
    func handleRequest(data: Data?, urlResponse: URLResponse?, error: Error?) {
        if error != nil{
            print(error!);
            return;
        }
        
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8);
            print(dataString);
        }
    }
}
