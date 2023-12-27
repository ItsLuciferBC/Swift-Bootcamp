//
//  WeatherData.swift
//  Clima
//
//  Created by Fahad Mansuri on 08.06.23.
//

import Foundation

struct WeatherData: Codable{
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable{
    let temp: Double
}

struct Weather: Codable{
    let id: Int
    let main: String
    let description: String
    let icon: String
}
