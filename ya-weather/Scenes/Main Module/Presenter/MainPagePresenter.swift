//
//  MainPagePresenter.swift
//  ya-weather
//
//  Created by Nurbolat Yerdikul on 20.04.2021.
//

import Foundation
import UIKit

protocol MainPagePresenterProtocol {
    func setViewController(viewController: UIViewController)
}

class MainPagePresenter: MainPagePresenterProtocol {
    weak var mainPageViewController: MainPageViewProtocol?
    
    func setViewController(viewController: UIViewController) {
        mainPageViewController?.setViewControllers(viewControllers: [viewController])
    }

}
