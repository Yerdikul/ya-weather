//
//  WeatherCollectionViewController.swift
//  ya-weather
//
//  Created by Nurbolat Yerdikul on 17.04.2021.
//

import UIKit


protocol WeatherViewProtocol: class {
    var interactor: WeatherInteractorProtocol? { get set }
    var router:  WeatherRouterProtocol? { get set }
    
    func presenter(didRetrieveViewModel viewModel: WeatherViewModel)
    func presenter(didFailRetrieveViewModel message: String)
}

private struct WeatherConstant {
    static let headerViewHeight: CGFloat = 250.0
    static let bgImageAlpha: CGFloat = 0.75
    static let bgImage = UIImage(named: "clear")
    
    static let reuseHourlyIdentifier = "HourlyWeatherCollectionViewCell"
    static let reuseDailyIdentifier = "DailyWeatherCollectionViewCell"
    static let reuseHeaderIdentifier = "WeatherHeaderView"
    static let reuseFooterIdentifier = "WeatherFooterView"

}

private enum WeatherSection {
    case daily, hourly
    
    func cellHeight() -> CGFloat {
        switch self {
        case .hourly: return 80.0
        case .daily: return 40.0
    }}
    
    func minimumLineSpacing() -> CGFloat {
        switch self {
        case .daily: return 4.0
        case .hourly: return .zero
    }}
}

final class WeatherCollectionViewController: UICollectionViewController, WeatherViewProtocol {
    var interactor: WeatherInteractorProtocol?
    var router: WeatherRouterProtocol?
    private var viewModel: WeatherViewModel?
    
    private var sections: [WeatherSection] = [.hourly, .daily]
    
    private let bgImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = WeatherConstant.bgImage
        imageView.alpha = WeatherConstant.bgImageAlpha
        imageView.clipsToBounds = true
        return imageView
    }()

    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        interactor?.fetchWeather()
    }
    
    private func configureUI() {
        configureCollectionView()
    }
    
    private func configureCollectionView() {
        self.collectionView.register(HourlyWeatherCollectionViewCell.self, forCellWithReuseIdentifier: WeatherConstant.reuseHourlyIdentifier)
        self.collectionView.register(DailyWeatherCollectionViewCell.self, forCellWithReuseIdentifier: WeatherConstant.reuseDailyIdentifier)
        self.collectionView.register(WeatherHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: WeatherConstant.reuseHeaderIdentifier)
        self.collectionView.register(WeatherFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: WeatherConstant.reuseFooterIdentifier)

        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.backgroundView = bgImageView
    }
}

extension WeatherCollectionViewController {
    
    func presenter(didRetrieveViewModel viewModel: WeatherViewModel) {
        self.viewModel = viewModel
        self.collectionView.reloadData()
    }
    
    func presenter(didFailRetrieveViewModel message: String) {
        showError(message)
    }
}

extension WeatherCollectionViewController {

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch sections[section] {
        case .daily:
            return viewModel?.days.count ?? 0
        case.hourly:
            return 1
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch sections[indexPath.section] {
        case .hourly:
            return self.collectionView(collectionView, cellForHourlyItemAt: indexPath)
        case .daily:
            return self.collectionView(collectionView, cellForDailyItemAt: indexPath)
        }
    }
    
    private func collectionView(_ collectionView: UICollectionView, cellForHourlyItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherConstant.reuseHourlyIdentifier, for: indexPath) as! HourlyWeatherCollectionViewCell
        cell.showHoursData(hoursData: viewModel?.todayHours)
        return cell
    }
    
    private func collectionView(_ collectionView: UICollectionView, cellForDailyItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherConstant.reuseDailyIdentifier, for: indexPath) as! DailyWeatherCollectionViewCell
        cell.showViewModel(viewModel: viewModel?.days[indexPath.row])
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: WeatherConstant.reuseHeaderIdentifier, for: indexPath) as! WeatherHeaderView
            headerView.show(name: viewModel?.cityName ?? "", temp: viewModel?.temp ?? -1)
            return headerView
            
        case UICollectionView.elementKindSectionFooter:
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: WeatherConstant.reuseFooterIdentifier, for: indexPath) as! WeatherFooterView
            return footerView
        default:
            assert(false, "Unexpected element kind")
        }
    }

}

extension WeatherCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        guard section == 0 else { return CGSize.zero }
        return CGSize(width: collectionView.frame.size.width, height: WeatherConstant.headerViewHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 0.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: sections[indexPath.section].cellHeight())
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sections[section].minimumLineSpacing()
    }
}
