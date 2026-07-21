//
//  RecipeView.swift
//  Apple Foundations Recipe Box
//
//  Created by Michael Miller on 16/7/2026.
//
 
import SwiftUI
 
struct RecipeDetailView: View {
 
    @Binding var recipe: Recipe
 
    var body: some View {
 
        ScrollView {
 
            VStack(alignment: .leading, spacing: 20) {
 
 
                // Image + Favorite Button
                ZStack(alignment: .topTrailing) {
 
                    Image(recipe.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 250)
                        .frame(maxWidth: .infinity)
                        .clipped()
 
 
                    Button {
                        recipe.isSaved.toggle()
 
                    } label: {
                        Image(systemName: recipe.isSaved ? "heart.fill" : "heart")
                            .font(.title)
                            .foregroundStyle(recipe.isSaved ? .red : .white)
                            .padding()
                            .background(.black.opacity(0.5))
                            .clipShape(Circle())
                    }
                    .padding()
                }
 
                // Recipe Name
                Text(recipe.name)
                    .font(.largeTitle)
                    .bold()
                    .padding(.horizontal)
 
                // prep/cook/serving details
                HStack {
                    VStack {
                        Text("Prep Time")
                            .font(.headline)
 
                        Text("\(recipe.prepTime) min")
                    }
 
                    Spacer()
 
                    VStack {
                        Text("Cook Time")
                            .font(.headline)
 
                        Text("\(recipe.cookTime) min")
                    }
 
                    Spacer()
 
                    VStack {
                        Text("Serving")
                            .font(.headline)
 
                        Text("\(recipe.servingSize)")
                    }
                }
                .padding(.horizontal)
 
                Divider()
 
                // Ingredients
                VStack(alignment: .leading, spacing: 8) {
 
                    Text("Ingredients")
                        .font(.title2)
                        .bold()
 
                    ForEach(recipe.ingredients, id: \.self) { ingredient in
                        Text("• \(ingredient)")
                    }
 
                }
                .padding(.horizontal)
 
                Divider()
 
                // Instructions
                VStack(alignment: .leading, spacing: 8) {
 
                    Text("Instructions")
                        .font(.title2)
                        .bold()
 
                    ForEach(recipe.instructions.indices, id: \.self) { index in
 
                        Text("\(index + 1). \(recipe.instructions[index])")
 
                    }
 
                }
                .padding(.horizontal)
 
                Divider()
 
                // Nutrition
                VStack(alignment: .leading, spacing: 8) {
 
                    Text("Nutrition")
                        .font(.title2)
                        .bold()
 
                    ForEach(recipe.nutrition, id: \.self) { item in
 
                        Text("• \(item)")
 
                    }
 
                }
                .padding(.horizontal)
 
            }
            .padding(.bottom)
        }
        .navigationBarTitleDisplayMode(.inline)
 
        
    }
}
 
#Preview {
 
    @Previewable @State var recipe = myRecipeData.recipes[0]
 
    NavigationStack {
        RecipeDetailView(recipe: $recipe)
    }
}
