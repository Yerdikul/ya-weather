//
//  WeatherPresenter.swift
//  ya-weather
//
//  Created by Nurbolat Yerdikul on 19.04.2021.
//

import Foundation

protocol WeatherPresenterProtocol {
    func interactor(didFetch object: YaWeatherEntity)
}

struct WeatherViewModel {
    let cityName: String
    let temp: Int?
}

class WeatherPresenter: WeatherPresenterProtocol {
    weak var viewController: WeatherViewProtocol?

    func interactor(didFetch entity: YaWeatherEntity) {
        viewController?.presenter(didRetrieveViewModel: WeatherViewModel(cityName: entity.geoObject.locality.name,
                                                                             temp: entity.fact.temp))
    }
}
