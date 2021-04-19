//
//  Date+Extension.swift
//  ya-weather
//
//  Created by Nurbolat Yerdikul on 20.04.2021.
//

import Foundation

extension Date {
    static var weekdayDate: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = .current
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter
    }
}
