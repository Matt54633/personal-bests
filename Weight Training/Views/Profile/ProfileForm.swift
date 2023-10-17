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
            Spacer()
            VStack(alignment: .leading) {
                Text("Please enter your name:")
                    .font(.title)
                    .fontDesign(.default)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                TextField("e.g. Ben", text: $name)
                    .modifier(TextInputField())
            }
            .frame(maxWidth: .infinity)
            Spacer()
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
        .presentationDetents([.height(225)])
        .presentationDragIndicator(.visible)
    }
}

//#Preview {
//    ProfileForm()
//}
