//
//  SearchBar.swift
//  Apple Foundations Recipe Box
//
//  Created by Michael Miller on 16/7/2026.
//

import SwiftUI

struct SearchBar: View {
    @State private var searchText = ""
    @State private var selectedTags: [String] = []
    @State private var recipes = ["chicken", "pasta", "fish", "eggs"]
    let allTags = ["vegan", "vegetarian", "gluten-free", "dairy-free"]
    
    var body: some View {
        
    }
    
}
    

#Preview {
    SearchBar()
}
