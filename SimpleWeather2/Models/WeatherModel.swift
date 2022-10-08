//
//  WeatherModel.swift
//  SimpleWeather2
//
//  Created by juyeong koh on 2022/10/08.
//

import Foundation

struct WeatherModel {
    let conditionID: Int
    let cityName: String
    let temperature: Double
    
    let maxTemp: Double
    let minTemp: Double
    let humidity: Double

    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    
    var maxTempString: String {
        return String(format: "%.1f", maxTemp)
    }
    
    var minTempString: String {
        return String(format: "%.1f", minTemp)
    }
    
    var humidityString: String {
        return String(format: "%.1f", humidity)
    }

    var conditionName: String {
        switch conditionID {
        case 200...232:
            return "cloud.bolt.fill"
        case 300...321:
            return "cloud.drizzle.fill"
        case 500...531:
            return "cloud.rain.fill"
        case 600...622:
            return "cloud.snow.fill"
        case 701...781:
            return "cloud.fog.fill"
        case 800:
            return "sun.max.fill"
        case 801...804:
            return "cloud.bolt.fill"
        default:
            return "cloud.fill"
        }
    }
    
    var weatherDescription: String {
        switch conditionID {
        case 200...232:
            return "천둥번개"
        case 300...321:
            return "흐리고 비"
        case 500...531:
            return "비"
        case 600...622:
            return "눈"
        case 701...781:
            return "안개"
        case 800:
            return "맑음"
        case 801...804:
            return "번개"
        default:
            return "구름"
        }
    }
}
