//
//  DailyWeatherCollectionViewCell.swift
//  ya-weather
//
//  Created by Nurbolat Yerdikul on 18.04.2021.
//

import UIKit

final class DailyWeatherCollectionViewCell: UICollectionViewCell {
    let nameLabel = UILabel()
    let dayTempLabel = UILabel()
    let nightTempLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(nightTempLabel)
        contentView.addSubview(dayTempLabel)
        
        nightTempLabel.textAlignment = .center
        dayTempLabel.textAlignment = .center

        nightTempLabel.alpha = 0.70
        
        nameLabel.anchor(top: contentView.topAnchor,
                         leading: contentView.leadingAnchor,
                         bottom: contentView.bottomAnchor,
                         trailing: nil,
                         padding: UIEdgeInsets.init(t: .zero, l: 16.0, b: .zero, r: .zero),
                         size: CGSize.zero)
        nightTempLabel.anchor(top: contentView.topAnchor,
                              leading: dayTempLabel.trailingAnchor,
                              bottom: contentView.bottomAnchor,
                              trailing: contentView.trailingAnchor,
                              padding: .zero,
                              size: CGSize.init(width: 50.0, height: 0.0))
        dayTempLabel.anchor(top: contentView.topAnchor,
                            leading: nil,
                            bottom: contentView.bottomAnchor,
                            trailing: nightTempLabel.leadingAnchor,
                            padding: .zero,
                            size: CGSize.init(width: 50.0, height: 0.0))
    }
    
    func showViewModel(viewModel: DailyViewModel?) {
        guard let viewModel = viewModel else { return }
        
        nameLabel.text = viewModel.name
        dayTempLabel.text = (viewModel.dayTemp).asStringOrNaNText()
        nightTempLabel.text = (viewModel.nightTemp).asStringOrNaNText()
        layoutIfNeeded()
    }
}
