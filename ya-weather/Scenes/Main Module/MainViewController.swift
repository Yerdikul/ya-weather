//
//  ViewController.swift
//  ya-weather
//
//  Created by Nurbolat Yerdikul on 17.04.2021.
//

import UIKit

final class MainViewController: UIViewController {
    private var pageController = UIPageViewController(
        transitionStyle: .scroll,
        navigationOrientation: .horizontal)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
    }
    
    private func configUI() {
        configurePageController()
    }
    
    private func configurePageController() {
        addChild(pageController)
        view.addSubview(pageController.view)
        pageController.view.fillSuperview()
        pageController.setViewControllers([generateWeatherViewController()], direction: .forward, animated: false, completion: nil)
        
        pageController.dataSource = self
        pageController.delegate = self
    }
}

extension MainViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return generateWeatherViewController()
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return generateWeatherViewController()
    }
    
    private func generateWeatherViewController() -> UIViewController {
        let vc = WeatherCollectionViewController()
        WeatherConfigurator.configureModule(viewController: vc, latLng: LatLng(lat: 51.169392, lng: 71.449074))
        return vc
    }
    
}
