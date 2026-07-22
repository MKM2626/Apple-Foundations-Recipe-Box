//
//  test.swift
//  Apple Foundations Recipe Box
//
//  Created by Michael Miller on 21/7/2026.
//

import SwiftUI

struct RecipeDetailViewTest: View {
    
    @Binding var recipe: Recipe
    
    let appGreen = Color(
        red: 0.05,
        green: 0.56,
        blue: 0.25
    )
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 0) {
                
                // Hero Image
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
                .scaledToFit()
                .frame(height: 320)
                .frame(maxWidth: .infinity)
                .clipped()
                
                
                VStack(alignment: .leading, spacing: 24) {
                    
                    // Title
                    HStack {
                        Text(recipe.name)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        Spacer()
                    }
                    
                    // Time cards
                    HStack(spacing: 12) {
                        InfoCard(
                            title: "Prep",
                            value: "\(recipe.prepTime)m",
                            icon: "clock"
                        )
                        
                        InfoCard(
                            title: "Cook",
                            value: "\(recipe.cookTime)m",
                            icon: "flame"
                        )
                        
                        InfoCard(
                            title: "Serves",
                            value: "\(recipe.servingSize)",
                            icon: "person.3"
                        )
                    }
                    
                    // Tags
                    if !recipe.tags.isEmpty {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(recipe.tags) { tag in
                                    Text(tag.name)
                                        .font(.caption)
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 6)
                                        .background(appGreen.opacity(0.2))
                                        .clipShape(Capsule())
                                }
                            }
                        }
                    }
                    
                    RecipeSection(title: "Ingredients") {
                        ForEach(recipe.ingredients, id: \.self) { ingredient in
                            Text("• \(ingredient)")
                        }
                    }
                    
                    RecipeSection(title: "Instructions") {
                        ForEach(recipe.instructions.indices, id: \.self) { index in
                            HStack(alignment: .top) {
                                Text("\(index + 1)")
                                    .fontWeight(.bold)
                                    .foregroundColor(appGreen)
                                
                                Text(recipe.instructions[index])
                            }
                        }
                    }
                    
                    if !recipe.nutrition.isEmpty {
                        RecipeSection(title: "Nutrition") {
                            ForEach(recipe.nutrition, id: \.self) { item in
                                Text("• \(item)")
                            }
                        }
                    }
                }
                .padding()
                .background(Color(.systemGroupedBackground))
                .clipShape(
                    RoundedRectangle(cornerRadius: 28)
                )
                .offset(y: -25)
            }
        }
        .ignoresSafeArea(edges: .top)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    recipe.isSaved.toggle()
                } label: {
                    Image(systemName: recipe.isSaved ? "heart.fill" : "heart")
                        .foregroundStyle(recipe.isSaved ? .red : .white)
                        .font(.title3)
                }
            }
        }
    }
}

struct InfoCard: View {
    let title: String
    let value: String
    let icon: String
    
    let appGreen = Color(
        red: 0.05,
        green: 0.56,
        blue: 0.25
    )
    
    var body: some View {
        VStack(spacing: 6) {
            Image(systemName: icon)
                .foregroundColor(appGreen)
            
            Text(value)
                .font(.headline)
            
            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}


struct RecipeSection<Content: View>: View {
    let title: String
    let content: () -> Content
    
    init(title: String, @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.content = content
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.title2)
                .bold()
            
            content()
                .font(.body)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
 
    @Previewable @State var recipe = myRecipeData.recipes[0]
 
    NavigationStack {
        RecipeDetailViewTest(recipe: $recipe)
    }
}
