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
            Text("Create Profile")
                .modifier(TitleText())
            VStack(alignment: .leading) {
                Text("Please enter your name:")
                    .modifier(TextInputTitle())
                TextField("e.g. Ben", text: $name)
                    .modifier(TextInputField())
            }
            .frame(maxWidth: .infinity)
            Spacer(minLength: 20)
            Button(action: {
                dismiss()
            }) {
                Text("Save")
                    .modifier(SaveButtonText())
            }
            .buttonStyle(.borderedProminent)
            .tint(.blue)
            .disabled(name.isEmpty)
        }
        .padding()
        .presentationDetents([.height(250)])
    }
}

//#Preview {
//    ProfileForm()
//}
