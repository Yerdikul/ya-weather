//
//  DailyWeatherCollectionViewCell.swift
//  ya-weather
//
//  Created by Nurbolat Yerdikul on 18.04.2021.
//

import UIKit


private struct HourlyWeatherConstants {
    static let reuseHourlyCellIdentifier = "HourlyWeatherChildCollectionViewCell"
    static let cellWidth: CGFloat = 35.0
    static let collectionViewHorizontalPadding: CGFloat = 8.0
}

final class HourlyWeatherCollectionViewCell: UICollectionViewCell {
    
    var collectionView: UICollectionView
    private var hoursData: [HourlyViewModel]?
    
    func showHoursData(hoursData: [HourlyViewModel]?) {
        self.hoursData = hoursData
        collectionView.reloadData()
    }
    
    override init(frame: CGRect) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: .zero,
                                           left: HourlyWeatherConstants.collectionViewHorizontalPadding,
                                           bottom: .zero,
                                           right: HourlyWeatherConstants.collectionViewHorizontalPadding)

        collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        super.init(frame: frame)
        
        configureCV()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCV() {
        addSubview(collectionView)
        collectionView.backgroundColor = .clear
        collectionView.fillSuperview()

        collectionView.register(HourlyWeatherChildCollectionViewCell.self, forCellWithReuseIdentifier: HourlyWeatherConstants.reuseHourlyCellIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
    }
}


extension HourlyWeatherCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hoursData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourlyWeatherConstants.reuseHourlyCellIdentifier, for: indexPath) as! HourlyWeatherChildCollectionViewCell
        cell.showViewModel(view: hoursData?[indexPath.row])
        return cell
    }
}

extension HourlyWeatherCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: HourlyWeatherConstants.cellWidth, height: collectionView.frame.size.height)
    }
}
