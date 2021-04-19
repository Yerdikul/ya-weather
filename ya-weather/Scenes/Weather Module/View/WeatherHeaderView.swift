//
//  WeatherHeaderView.swift
//  ya-weather
//
//  Created by Nurbolat Yerdikul on 18.04.2021.
//

import UIKit

final class WeatherHeaderView: UICollectionReusableView {
    let namelabel: UILabel
    let degreeLabel: UILabel
    
    override init(frame: CGRect) {
        self.namelabel = UILabel()
        self.degreeLabel = UILabel()

        super.init(frame: frame)
        setupUI()
    }
    
    private func setupUI() {
        let view = UIView()
        addSubview(view)
        
        view.addSubview(namelabel)
        view.addSubview(degreeLabel)
        view.centerInSuperview()
        view.anchor(top: nil, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor)
        
        namelabel.anchor(top: view.topAnchor,
                         leading: view.leadingAnchor,
                         bottom: degreeLabel.topAnchor,
                         trailing: view.trailingAnchor,
                         padding: UIEdgeInsets.init(t: .zero, l: .zero, b: 8.0, r: .zero))
        
        degreeLabel.anchor(top: namelabel.bottomAnchor,
                           leading: view.leadingAnchor,
                           bottom: view.bottomAnchor,
                           trailing: view.trailingAnchor,
                           padding: UIEdgeInsets.init(t: 8.0, l: .zero, b: .zero, r: .zero))
        
        namelabel.textAlignment = .center
        degreeLabel.textAlignment = .center
        
        namelabel.font = UIFont.systemFont(ofSize: 50.0)
        degreeLabel.font = UIFont.systemFont(ofSize: 40.0)

        namelabel.numberOfLines = 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func show(name: String, temp: Int? ) {
        namelabel.text = name
        degreeLabel.text = (temp != nil) ? "\(temp!)°" : ""
        self.layoutIfNeeded()
    }

}
