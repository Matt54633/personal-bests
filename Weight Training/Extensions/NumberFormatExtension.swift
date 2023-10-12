//
//  NumberFormatExtension.swift
//  Weight Training
//
//  Created by Matt Sullivan on 09/10/2023.
//

import Foundation

extension NumberFormatter {
    static func decimalFormatter(decimalPlaces: Int) -> NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = decimalPlaces
        return formatter
    }
}
