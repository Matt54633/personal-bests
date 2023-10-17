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
            .textInputAutocapitalization(.words)
            .tint(.blue)
            .frame(height: 35)
            .padding(5)
            .padding(.horizontal, 7.5)
            .background(RoundedRectangle(cornerRadius: 10).fill(colorScheme == .dark ? .quaternary : .quinary))
            .submitLabel(.done)
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
            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
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
                    .fill(.blue.opacity(colorScheme == .dark ? 0.25 : 0.125))
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

struct BlueButtonStyle: ViewModifier {
    @Environment(\.colorScheme) var colorScheme

    func body(content: Content) -> some View {
        content
            .font(.system(size: 20, design: .rounded))
            .foregroundStyle(.blue)
            .buttonStyle(.bordered)
            .buttonBorderShape(.circle)
    }
}
