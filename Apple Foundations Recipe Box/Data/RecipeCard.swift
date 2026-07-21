//
//  testCard.swift
//  Apple Foundations Recipe Box
//
//  Created by Michael Miller on 21/7/2026.
//

import SwiftUI

struct RecipeCard: View {
    @Binding var recipe: Recipe
    
    var body: some View {
            VStack(spacing: 0) {

                Group {
                    if let imageData = recipe.imageData,
                       let uiImage = UIImage(data: imageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                    } else {
                        Image(recipe.imageName)
                            .resizable()
                    }
                }
                .scaledToFill()
                .frame(maxWidth: .infinity)
                .frame(height: 140)
                .clipped()

                HStack {
                    Text(recipe.name)
                        .font(.headline)
                        .foregroundColor(.primary)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)

                    Spacer()

                    Button {
                        recipe.isSaved.toggle()
                    } label: {
                        Image(systemName: recipe.isSaved ? "heart.fill" : "heart")
                            .foregroundColor(recipe.isSaved ? .red : .gray)
                    }
                }
                .padding(.horizontal, 10)
                .frame(height: 60)
            }
            .frame(width: 180, height: 200)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(radius: 4)
        }
}

#Preview {
    @Previewable @State var recipe = myRecipeData.recipes[0]
    
    RecipeCard(recipe: $recipe)
}
