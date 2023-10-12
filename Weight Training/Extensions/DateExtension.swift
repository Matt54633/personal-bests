//
//  DateExtension.swift
//  Weight Training
//
//  Created by Matt Sullivan on 09/10/2023.
//

import Foundation

extension Date {
    var formattedAsDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/YY"
        return formatter.string(from: self)
    }
}
