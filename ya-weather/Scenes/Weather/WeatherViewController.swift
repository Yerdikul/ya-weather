//
//  ViewController.swift
//  ya-weather
//
//  Created by Nurbolat Yerdikul on 17.04.2021.
//

import UIKit

class WeatherViewController: UIViewController {
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

extension WeatherViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return generateWeatherViewController()
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return generateWeatherViewController()
    }
    
    private func generateWeatherViewController() -> UIViewController {
        let vc = WeatherCollectionViewController()
        return vc
    }
    
}

//#if DEBUG
//import SwiftUI
//
//struct WeatherVCRepresentable: UIViewControllerRepresentable {
//    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
//
//    }
//
//    @available(iOS 13.0.0, *)
//    func makeUIViewController(context: Context) -> UIViewController {
//        WeatherViewController()
//    }
//}
//
//@available(iOS 13.0, *)
//struct MainVCPreview: PreviewProvider {
//    static var previews: some View {
//        WeatherVCRepresentable()
//    }
//}
//#endif
//
