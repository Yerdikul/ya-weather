//
//  Optional+Extension.swift
//  ya-weather
//
//  Created by Nurbolat Yerdikul on 19.04.2021.
//

import Foundation

extension Optional {
    func asStringOrNaNText() -> String {
        switch self {
            case .some(let value):
                return String(describing: value)
            case _:
                return "NaN"
        }
    }
}
