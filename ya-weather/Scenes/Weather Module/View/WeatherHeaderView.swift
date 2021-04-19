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

        
        namelabel.anchor(top: view.topAnchor,
                         leading: view.leadingAnchor,
                         bottom: degreeLabel.topAnchor,
                         trailing: view.trailingAnchor)
        
        degreeLabel.anchor(top: namelabel.bottomAnchor,
                           leading: view.leadingAnchor,
                           bottom: view.bottomAnchor,
                           trailing: view.trailingAnchor)
        
        namelabel.textAlignment = .center
        degreeLabel.textAlignment = .center
        
        namelabel.font = UIFont.systemFont(ofSize: 50.0)
        degreeLabel.font = UIFont.systemFont(ofSize: 50.0)

        namelabel.numberOfLines = 0
        degreeLabel.numberOfLines = 0

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func show(name: String, temp: Int? ) {
        namelabel.text = name
        degreeLabel.text = (temp != nil) ? "\(temp!)°C" : ""
        namelabel.updateConstraints()
        degreeLabel.updateConstraints()
    }
    

}
