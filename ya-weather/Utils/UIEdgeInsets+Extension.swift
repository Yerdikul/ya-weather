//
//  UIEdgeInsets+Extension.swift
//  ya-weather
//
//  Created by Nurbolat Yerdikul on 19.04.2021.
//

import UIKit

extension UIEdgeInsets {
    init(padding: CGFloat) {
        self.init(top: padding, left: padding, bottom: padding, right: padding)
    }
    
    init(horizontalPadding: CGFloat = 0.0, verticalPadding: CGFloat = 0.0) {
        self.init(top: verticalPadding, left: horizontalPadding, bottom: verticalPadding, right: horizontalPadding)
    }
    
    init(t: CGFloat = 0.0, l: CGFloat = 0.0, b: CGFloat = 0.0, r: CGFloat = 0.0) {
        self.init(top: t, left: l, bottom: b, right: r)
    }
    
    static func padded(_ padding: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(padding: padding)
    }
    
    static func padded(horizontal: CGFloat = 0.0, vertical: CGFloat = 0.0) -> UIEdgeInsets {
        return UIEdgeInsets(horizontalPadding: horizontal, verticalPadding: vertical)
    }
}
