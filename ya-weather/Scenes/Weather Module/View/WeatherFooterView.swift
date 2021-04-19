//
//  WeatherFooterCollectionViewCell.swift
//  ya-weather
//
//  Created by Nurbolat Yerdikul on 20.04.2021.
//

import UIKit

class WeatherFooterView: UICollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .white
    }
}
