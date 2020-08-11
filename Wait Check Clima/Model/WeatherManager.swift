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
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default);
            
            let task = session.dataTask(with: url) {(data, urlResponse, error) in
                if error != nil{
                    print(error!);
                    return;
                }
                
                if let safeData = data {
                    self.parseJSON(weatherData: safeData);
                }
            };
            
            task.resume();
        }
    }
    
    func parseJSON(weatherData: Data) {
        let decoder = JSONDecoder();
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData);
            let id = decodedData.weather[0].id;
            let temp = decodedData.main.temp;
            let name = decodedData.name;
            
            let weather = WeatherModel(conditionId: id, cityName: name, temp: temp);
            print(weather.conditionName);
            print(weather.tempString);
        } catch {
            print(error);
        }
        
    }
    
}
