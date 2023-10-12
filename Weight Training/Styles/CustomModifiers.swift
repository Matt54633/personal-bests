//
//  CustomModifiers.swift
//  Weight Training
//
//  Created by Matt Sullivan on 05/10/2023.
//

import Foundation
import SwiftUI

struct TextInputField: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    
    func body(content: Content) -> some View {
        content
            .tint(.blue)
            .frame(height: 35)
            .padding(5)
            .background(RoundedRectangle(cornerRadius: 10).fill(colorScheme == .dark ? .quaternary : .quinary)
            )
    }
}

struct TextInputTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .fontWeight(.bold)
            .fontDesign(.rounded)
            .font(.system(size: 18))
    }
}

struct TitleText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .fontWeight(.bold)
            .fontDesign(.rounded)
            .foregroundStyle(.blue)
            .padding(.bottom, 15)
    }
}

struct CategoryTag: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .font(.system(size: 18))
            .fontWeight(.bold)
            .background(
                RoundedRectangle(cornerRadius: 100)
                    .fill(Color.blue.opacity(colorScheme == .dark ? 0.2 : 0.125))
            )
            .padding(.vertical, 10)
            .foregroundStyle(.blue)
            .listRowInsets(EdgeInsets())
            .textCase(nil)
    }
}

struct SaveButtonText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title2)
            .fontDesign(.rounded)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity)
            .padding(2.5)
    }
}
