//
//  MainPageConfigurator.swift
//  ya-weather
//
//  Created by Nurbolat Yerdikul on 20.04.2021.
//

import Foundation
import UIKit

final class MainPageConfigurator {
    
    //TODO: = Router
    static func configureModule(viewController: MainPageViewController, coordinates: [LatLng]) {
        let interactor = MainPageInteractor(withCoordinates: coordinates)
        let presenter = MainPagePresenter()
        
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.mainPageViewController = viewController
    }
}
