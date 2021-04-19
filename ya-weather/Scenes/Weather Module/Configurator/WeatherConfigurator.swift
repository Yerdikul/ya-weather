//
//  WeatherConfigurator.swift
//  ya-weather
//
//  Created by Nurbolat Yerdikul on 19.04.2021.
//

import Foundation

class WeatherConfigurator {
    static func configureModule(viewController: WeatherCollectionViewController, latLng: LatLng) {
        let worker = YaWeatherAPIWorker()
        let interactor = WeatherInteractor(withYaWeatherAPIWorker: worker, coordinate: latLng)
        let presenter = WeatherPresenter()
        let router = WeatherRouter()
        
        viewController.router = router
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        router.navigationController = viewController.navigationController
    }
}
