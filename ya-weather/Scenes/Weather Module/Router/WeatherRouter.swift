//
//  WeatherRouter.swift
//  ya-weather
//
//  Created by Nurbolat Yerdikul on 19.04.2021.
//

import UIKit

protocol WeatherRouterProtocol {
    var navigationController: UINavigationController? { get }
}

class WeatherRouter: WeatherRouterProtocol {
    weak var navigationController: UINavigationController?
}
