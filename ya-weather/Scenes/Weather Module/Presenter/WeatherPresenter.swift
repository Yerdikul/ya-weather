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
    let todayHours: [HourlyViewModel]
    let days: [DailyViewModel]
}

struct HourlyViewModel {
    let temp: Int?
    let hour: String?
    
}

struct DailyViewModel {
    let name: String
    let dayTemp: Int?
    let nighyTemp: Int?
}

class WeatherPresenter: WeatherPresenterProtocol {
    weak var viewController: WeatherViewProtocol?

    func interactor(didFetch entity: YaWeatherEntity) {
        let todayHours = entity.forecasts.first?.hours.map{ HourlyViewModel(temp: $0.temp,
                                                                            hour: $0.hour) } ?? []
        let days = entity.forecasts.map{DailyViewModel(name: $0.date,
                                                       dayTemp: $0.parts.day.tempAvg,
                                                       nighyTemp: $0.parts.night.tempAvg)}

        viewController?.presenter(didRetrieveViewModel: WeatherViewModel(cityName: entity.geoObject.locality.name,
                                                                             temp: entity.fact.temp,
                                                                             todayHours: todayHours,
                                                                             days: days))
    }
}
