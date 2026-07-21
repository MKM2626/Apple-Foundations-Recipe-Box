//
//  GroceryListPreview.swift
//  Apple Foundations Recipe Box
//
//  Created by Michael Miller on 21/7/2026.
//

import SwiftUI

struct GroceryListPreview: View {
    
    let categories = [
        ("Fruit & Vegetables", [
            "Apples",
            "Carrots",
            "Spinach"
        ]),
        
        ("Meat & Seafood", [
            "Chicken Breast",
            "Salmon"
        ]),
        
        ("Dairy", [
            "Milk",
            "Cheese"
        ]),
        
        ("Pantry", [
            "Rice",
            "Pasta"
        ])
    ]
    
    
    var body: some View {
        
        ZStack {
            
            ScrollView {
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("Grocery List")
                        .font(.largeTitle)
                        .bold()
                    
                    ForEach(categories, id: \.0) { category, items in
                        
                        VStack(alignment: .leading, spacing: 8) {
                            
                            Text(category)
                                .font(.headline)
                            
                            ForEach(items, id: \.self) { item in
                                
                                HStack {
                                    Image(systemName: "circle")
                                    Text(item)
                                }
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(.white)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 12)
                        )
                    }
                }
                .padding()
            }
            
            ComingSoonOverlay()
        }
    }
}

#Preview {
    GroceryListPreview()
}
