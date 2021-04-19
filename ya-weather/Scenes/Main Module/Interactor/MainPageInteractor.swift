//
//  MainPageInteractor.swift
//  ya-weather
//
//  Created by Nurbolat Yerdikul on 20.04.2021.
//

import Foundation
import UIKit

protocol MainPageInteractorProtocol {
    func setToFirstViewController()
    func viewController(before vc: UIViewController) -> UIViewController?
    func viewController(after vc: UIViewController) -> UIViewController?

}

class MainPageInteractor: MainPageInteractorProtocol {
    var presenter: MainPagePresenterProtocol?
    
    private let coordinates: [LatLng]
    private var viewControllers: [UIViewController] = []
    
    init(withCoordinates coordinates: [LatLng]) {
        self.coordinates = coordinates
        self.coordinates.forEach { viewControllers.append(getWeatherViewController(coordinate: $0)) }
    }
    
    private func getWeatherViewController(coordinate: LatLng) -> UIViewController {
        let vc = WeatherCollectionViewController()
        WeatherConfigurator.configureModule(viewController: vc, latLng: coordinate)
        return vc
    }

    func setToFirstViewController() {
        guard let firstViewController = viewControllers.first else { return }
        presenter?.setViewController(viewController: firstViewController)
    }
    
    func viewController(before vc: UIViewController) -> UIViewController? {
        guard let index = viewControllers.firstIndex(of: vc), index > 0 else { return nil }
        return viewControllers[index - 1]
    }

    func viewController(after vc: UIViewController) -> UIViewController? {
        guard let index = viewControllers.firstIndex(of: vc), index + 1 < viewControllers.count else { return nil }
        return viewControllers[index + 1]
    }

}
