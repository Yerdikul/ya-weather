//
//  WeatherInteractor.swift
//  ya-weather
//
//  Created by Nurbolat Yerdikul on 19.04.2021.
//

import Foundation

protocol WeatherInteractorProtocol {
    func fetchWeather()
}

final class WeatherInteractor: WeatherInteractorProtocol {
    private let yaWeatherAPIWorker: YaWeatherAPIWorkerProtocol
    private let coordinate: LatLng
    private var yaWeather: YaWeatherEntity?

    var presenter: WeatherPresenterProtocol?

    init(withYaWeatherAPIWorker yaWeatherAPIWorker: YaWeatherAPIWorkerProtocol, coordinate: LatLng) {
        self.yaWeatherAPIWorker = yaWeatherAPIWorker
        self.coordinate = coordinate
    }
    
    func fetchWeather() {
        yaWeatherAPIWorker.fetchWeather(lat: coordinate.lat, lon: coordinate.lng) { (yaWeather) in
            self.yaWeather = yaWeather
            self.presenter?.interactor(didFetch: yaWeather)
        } errorCallback: { (message) in
            self.presenter?.interactor(didFailRequest: message)
        }
    }
}
