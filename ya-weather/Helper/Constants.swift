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

struct AppConfig {
    static let coordinates = [LatLng(lat: 51.169392, lng: 71.449074), // Nur-Sultan
                              LatLng(lat: 44.85278, lng: 65.50917),   // Kyzylorda
                              LatLng(lat: 43.238949, lng: 76.889709), // Almaty
                              LatLng(lat: 55.751244, lng: 37.618423)] // Moscow
}
