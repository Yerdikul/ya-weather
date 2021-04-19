//
//  DailyWeatherCollectionViewCell.swift
//  ya-weather
//
//  Created by Nurbolat Yerdikul on 18.04.2021.
//

import UIKit

let reuseHourlyCellIdentifier = "HourlyWeatherChildCollectionViewCell"
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
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)

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

        collectionView.register(HourlyWeatherChildCollectionViewCell.self, forCellWithReuseIdentifier: reuseHourlyCellIdentifier)
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

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseHourlyCellIdentifier, for: indexPath) as! HourlyWeatherChildCollectionViewCell
        cell.showViewModel(view: hoursData?[indexPath.row])
        return cell
    }
}

extension HourlyWeatherCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 35.0, height: collectionView.frame.size.height)
    }
}
