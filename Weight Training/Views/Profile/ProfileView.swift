//
//  ProfileView.swift
//  Weight Training
//
//  Created by Matt Sullivan on 12/10/2023.
//

import SwiftUI
import SwiftData

struct ProfileView: View {
    @State private var displaySheet: Bool = false
    @AppStorage("userName") var userName: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                List {
                    ProfileStats()
                }
            }
            .sheet(isPresented: $displaySheet, content: {
                ProfileForm(displaySheet: $displaySheet)
            })
            .onAppear {
                if userName.isEmpty {
                    displaySheet = true
                }
            }
            .navigationTitle(Text("Hey \(userName)!"))
            .toolbar {
                ToolbarItem {
                    NavigationLink(
                        destination:
                            ProfileSettings()
                    ) {
                        Image(systemName: "gear")
                            .font(.system(size: 20, design: .rounded))
                            .foregroundStyle(.blue)
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}

