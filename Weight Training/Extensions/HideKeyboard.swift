//
//  HideKeyboard.swift
//  Weight Training
//
//  Created by Matt Sullivan on 17/10/2023.
//

import Foundation
import UIKit
import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
