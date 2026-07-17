//
//  BrowseView.swift
//  Apple Foundations Recipe Box
//
//  Created by Michael Miller on 16/7/2026.
//

import SwiftUI

struct BrowseView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var recipeData = myRecipeData
    
    var body: some View {
        Scroll(recipeData: recipeData)
    }
}

#Preview {
    BrowseView()
}
