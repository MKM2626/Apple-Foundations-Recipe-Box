//
//  RecipeCard.swift
//  Apple Foundations Recipe Box
//
//  Created by Michael Miller on 16/7/2026.
//

import SwiftUI

struct RecipeCard: View {
    var body: some View {
        VStack(spacing: 12) {
           
            
            Image(systemName: "photo")
                .font(.system(size: 60))
                .foregroundColor(.gray)

            HStack {
                Text("Card Title")
                    .font(.title2)
                    .bold()
                
                Button("Action Button") {
                    // Action will be added later
                }
                .buttonStyle(.borderedProminent)
            }
            
            // Well probably get rid of it the description
            /*
            Text("Description text goes here")
                .font(.body)
                .foregroundColor(.secondary)
             */
            
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 4)
    }
}

#Preview {
    RecipeCard()
}
