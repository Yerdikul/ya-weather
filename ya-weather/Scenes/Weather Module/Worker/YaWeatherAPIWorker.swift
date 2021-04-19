//
//  YaWeatherAPIWorker.swift
//  ya-weather
//
//  Created by Nurbolat Yerdikul on 19.04.2021.
//

import Foundation
import Alamofire

protocol YaWeatherAPIWorkerProtocol {
    func fetchWeather(lat: Double, lon: Double, callback: @escaping (YaWeatherEntity) -> Void)
}

fileprivate struct YaWeatherRequest: Encodable {
    let lat: Double
    let lon: Double
    let limit: Int
}

class YaWeatherAPIWorker: YaWeatherAPIWorkerProtocol {
    func fetchWeather(lat: Double, lon: Double, callback: @escaping (YaWeatherEntity) -> Void) {
        let headers: HTTPHeaders = [
            YaWeatherAPIConstant.HeaderKeys.apiKey: YaWeatherAPIConstant.HeaderParams.apiKey,
        ]
        let params = YaWeatherRequest(lat: lat, lon: lon, limit: 7)
        
        AF.request(YaWeatherAPIConstant.baseUrlString, parameters: params, encoder: URLEncodedFormParameterEncoder.default, headers: headers).responseData() { (response) in
            switch (response.result) {
            case .success(let data):
                do {
                    let jsonDecoder = JSONDecoder()
                    let entity = try jsonDecoder.decode(YaWeatherEntity.self, from: data)
                    callback(entity)
                } catch (let error) {
                    // TODO: - Error handling
                    print(error.localizedDescription)
                    print(error.asAFError.debugDescription)
                }
            case .failure(let error):
                // TODO: - Error handling
                print(error.localizedDescription)
            }
        }
    }
}
