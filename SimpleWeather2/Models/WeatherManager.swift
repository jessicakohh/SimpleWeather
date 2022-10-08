//
//  WeatherManager.swift
//  SimpleWeather2
//
//  Created by juyeong koh on 2022/10/06.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}


struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=11669b1d8a6c2ad880d1fc1dc7afc847&units=metric"
    
    var delegate: WeatherManagerDelegate?
    

    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)

    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                   if let weather = self.parseJSON(weatherData: safeData) {
                       self.delegate?.didUpdateWeather(self, weather: weather)
                   }
                }
            }
            
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
           let decodeData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodeData.weather[0].id
            let temp = decodeData.main.temp
            let name = decodeData.name
            
            let weather = WeatherModel(conditionID: id, cityName: name, temperature: temp, maxTemp: temp, minTemp: temp, humidity: temp)
            
            return weather
            
                

        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
