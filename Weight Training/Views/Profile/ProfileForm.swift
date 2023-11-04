//
//  ProfileForm.swift
//  Weight Training
//
//  Created by Matt Sullivan on 12/10/2023.
//

import SwiftUI

struct ProfileForm: View {
    @Environment(\.dismiss) var dismiss
    @Binding var displaySheet: Bool
    @AppStorage("userName") var name: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Please enter your name:")
                .font(.title)
                .fontDesign(.default)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            HStack {
                TextField("e.g. Ben", text: $name)
                    .modifier(TextInputField())
                Spacer()
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "checkmark.circle.fill")
                        .modifier(SaveButtonText())
                }
                .frame(width: 60)
                .buttonStyle(.borderedProminent)
                .tint(.blue)
                .disabled(name.isEmpty)
            }
        }
        .padding(.horizontal)
        .presentationDetents([.height(180)])
        .presentationDragIndicator(.visible)
    }
}

//#Preview {
//    ProfileForm()
//}
