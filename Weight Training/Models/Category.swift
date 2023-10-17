//
//  CustomCategory.swift
//  Weight Training
//
//  Created by Matt Sullivan on 12/10/2023.
//


import Foundation
import SwiftData

@Model
final class Category: Identifiable {
    var id: String
    var categoryName: String
    
    init(categoryName: String) {
        self.id = UUID().uuidString
        self.categoryName = categoryName
    }
}

func addCategory(categoryName: String, context: ModelContext) {
    let category = Category(categoryName: categoryName)
    context.insert(category)
}

func deleteCategory(category: Category, context: ModelContext) {
    context.delete(category)
}
