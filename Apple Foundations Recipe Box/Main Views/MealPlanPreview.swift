//
//  MealPlanPreview.swift
//  Apple Foundations Recipe Box
//
//  Created by Michael Miller on 21/7/2026.
//

import SwiftUI

struct MealPlanPreviewView: View {
    
    let days = [
        ("Monday", "Chicken Pasta"),
        ("Tuesday", "Vegetable Stir Fry"),
        ("Wednesday", "Tacos"),
        ("Thursday", "Salmon Bowl"),
        ("Friday", "Pizza Night"),
        ("Saturday", "Curry"),
        ("Sunday", "Roast Dinner")
    ]
    
    
    var body: some View {
        ZStack {
            
            VStack(alignment: .leading, spacing: 16) {
                
                HStack {
                    Text("Meal Plan")
                        .font(.largeTitle)
                        .bold()
                    
                    Spacer()
                    
                    Button {
                        // Coming soon
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                    }
                    
                }
                
                ForEach(days, id: \.0) { day, meal in
                    
                    HStack {
                        Text(day)
                            .fontWeight(.semibold)
                            .frame(width: 100, alignment: .leading)
                        
                        Text(meal)
                            .foregroundStyle(.secondary)
                        
                        Spacer()
                        
                    }
                    .padding()
                    .background(.white)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 12)
                    
                    )
                    Divider()
                }
                
            }
            .padding()
            
         
        }
    }
}

#Preview {
    MealPlanPreviewView()
}
