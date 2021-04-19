//
//  Constants.swift
//  ya-weather
//
//  Created by Nurbolat Yerdikul on 19.04.2021.
//

import Foundation

struct YaWeatherAPIConstant {
    static let baseUrlString = "https://api.weather.yandex.ru/v2/forecast"
    
    struct HeaderKeys {
        static let apiKey = "X-Yandex-API-Key"
    }
    
    struct HeaderParams {
        static let apiKey = APIKeys.yandexWeatherKey
    }
}
