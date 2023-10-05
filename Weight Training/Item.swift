//
//  Item.swift
//  Weight Training
//
//  Created by Matt Sullivan on 05/10/2023.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
