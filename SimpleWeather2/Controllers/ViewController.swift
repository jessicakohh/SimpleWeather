//
//  ViewController.swift
//  SimpleWeather2
//
//  Created by juyeong koh on 2022/10/06.
//

import UIKit
import CoreLocation


class ViewController: UIViewController, UITextFieldDelegate, WeatherManagerDelegate {
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    
    
    
    var weatherManager = WeatherManager()
    //    let locationManager = CLLocationManager()
    
    
    //    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.delegate = self
        weatherManager.delegate = self
        //        locationManager = CLLocationManager()
        
    }
    
    
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        searchTextField.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if searchTextField.text != "" {
            return true
        } else {
            textField.placeholder = "도시명을 입력하세요."
            return false
        }
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let city = searchTextField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        searchTextField.text = ""
    }
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.sync {
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
            self.cityLabel.text = weather.cityName
            self.descriptionLabel.text = weather.weatherDescription
            self.humidityLabel.text = weather.humidityString
            self.maxTempLabel.text = weather.maxTempString
            self.minTempLabel.text = weather.minTempString
            
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }

}





//MARK: - CLLocationManagerDelegate

//
//    extension ViewController: CLLocationManagerDelegate {
//
//        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//            if let location = locations.last {
//                locationManager.stopUpdatingLocation()
//                let lat = location.coordinate.latitude
//                let lon = location.coordinate.longitude
//                //            weatherManager.fetchWeather(latitude: lat, longitude: lon)
//            }
//        }
//
//        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//            print(error)
//        }
//    }
//}
