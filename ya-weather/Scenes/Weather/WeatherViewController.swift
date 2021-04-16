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
        pageController.setViewControllers([generateViewController()], direction: .forward, animated: false, completion: nil)
        
        pageController.dataSource = self
        pageController.delegate = self
    }
}

extension WeatherViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return generateViewController()
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return generateViewController()
    }
    
    private func generateViewController() -> UIViewController {
        let vc = UIViewController()
        vc.view.backgroundColor = Bool.random() ? .green : .red
        return vc
    }
    
}

#if DEBUG
import SwiftUI

struct WeatherVCRepresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {

    }

    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController {
        WeatherViewController()
    }
}

@available(iOS 13.0, *)
struct MainVCPreview: PreviewProvider {
    static var previews: some View {
        WeatherVCRepresentable()
    }
}
#endif

