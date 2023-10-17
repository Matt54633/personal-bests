//
//  ProfileCategories.swift
//  Weight Training
//
//  Created by Matt Sullivan on 12/10/2023.
//

import SwiftUI
import SwiftData

struct ManageCategories: View {
    @Query private var categories: [Category]
    @State private var categoryName: String = ""
    @Environment(\.modelContext) private var context
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                HStack {
                    TextField("e.g. Core", text: $categoryName)
                        .modifier(TextInputField())
                        .frame(maxWidth: .infinity)
                    Button(action: {
                        addCategory(categoryName: categoryName, context: context)
                        categoryName = ""
                    }) {
                        Image(systemName: "plus")
                            .frame(height: 30)
                    }
                    .buttonBorderShape(.roundedRectangle(radius: 10.0))
                    .buttonStyle(.borderedProminent)
                }
            }
            .navigationTitle("Manage Categories")
            .padding()
            List {
                ForEach(categories, id: \.self) { category in
                    Text(category.categoryName)
                        .swipeActions {
                            Button("Delete") {
                                deleteCategory(category: category, context: context)
                            }
                            .tint(.red)
                        }
                }
            }
            .padding(.top, -10)
        }
    }
}

#Preview {
    ManageCategories()
}
