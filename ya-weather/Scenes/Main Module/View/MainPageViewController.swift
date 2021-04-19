//
//  ViewController.swift
//  ya-weather
//
//  Created by Nurbolat Yerdikul on 17.04.2021.
//

import UIKit

protocol MainPageViewProtocol: class {
    var interactor: MainPageInteractorProtocol? { get set }
    func setViewControllers(viewControllers: [UIViewController])
}

final class MainPageViewController: UIViewController {
    private var pageController = UIPageViewController(transitionStyle: .scroll,
                                                      navigationOrientation: .horizontal)
    var interactor: MainPageInteractorProtocol?
    
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
        interactor?.setToFirstViewController()
        
        pageController.dataSource = self
        pageController.delegate = self
    }
}

extension MainPageViewController: MainPageViewProtocol {
    func setViewControllers(viewControllers: [UIViewController]) {
        pageController.setViewControllers(viewControllers,
                                          direction: .forward,
                                          animated: false,
                                          completion: nil)
    }
}

extension MainPageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return interactor?.viewController(before: viewController)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return interactor?.viewController(after: viewController)
    }
}
