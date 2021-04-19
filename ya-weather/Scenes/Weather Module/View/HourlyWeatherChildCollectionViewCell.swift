//
//  DailyWeatherCellCollectionViewCell.swift
//  ya-weather
//
//  Created by Nurbolat Yerdikul on 18.04.2021.
//

import UIKit

final class HourlyWeatherChildCollectionViewCell: UICollectionViewCell {
    let hourLabel = UILabel()
    let tempLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(hourLabel)
        contentView.addSubview(tempLabel)
        
        hourLabel.textAlignment = .center
        tempLabel.textAlignment = .center

        hourLabel.anchor(top: contentView.topAnchor,
                         leading: contentView.leadingAnchor,
                         bottom: tempLabel.topAnchor,
                         trailing: contentView.trailingAnchor)
        
        tempLabel.anchor(top: hourLabel.bottomAnchor,
                           leading: contentView.leadingAnchor,
                           bottom: contentView.bottomAnchor,
                           trailing: contentView.trailingAnchor)
        hourLabel.heightAnchor.constraint(equalTo: tempLabel.heightAnchor, multiplier: 1.0).isActive = true
    }
    
    func showViewModel(view: HourlyViewModel?) {
        guard let view = view else {
            return
        }
        hourLabel.text = view.hour
        tempLabel.text = ((view.temp != nil) ? String(view.temp!) : "NaN") + "°"
        layoutIfNeeded()
    }
}
