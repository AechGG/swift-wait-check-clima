//
//  WeatherData.swift
//  Wait Check Clima
//
//  Created by Harrison Gittos on 10/08/2020.
//  Copyright © 2020 Harrison Gittos. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    let name: String;
    let weather: [Weather];
    let main: Main;
}

struct Main: Codable {
    let temp: Double;
}

struct Weather: Codable {
    let id: Int;
    let description: String;
}
