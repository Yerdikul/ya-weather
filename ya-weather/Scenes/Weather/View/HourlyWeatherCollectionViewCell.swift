//
//  DailyWeatherCollectionViewCell.swift
//  ya-weather
//
//  Created by Nurbolat Yerdikul on 18.04.2021.
//

import UIKit

let reuseHourlyCellIdentifier = "HourlyWeatherChildCollectionViewCell"
class HourlyWeatherCollectionViewCell: UICollectionViewCell {
    
    var collectionView: UICollectionView
    
    
    override init(frame: CGRect) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 6, bottom: 0, right: 6)

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
        return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseHourlyCellIdentifier, for: indexPath) as! HourlyWeatherChildCollectionViewCell
        cell.backgroundColor = .red
        return cell
    }
}

extension HourlyWeatherCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 35.0, height: collectionView.frame.size.height)
    }
}
