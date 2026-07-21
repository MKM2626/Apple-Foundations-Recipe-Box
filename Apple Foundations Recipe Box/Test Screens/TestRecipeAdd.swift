//
//  TestRecipeAdd.swift
//  Apple Foundations Recipe Box
//
//  Created by Michael Miller on 21/7/2026.
//

import SwiftUI
import PhotosUI

struct AddRecipeViewTest: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var selectedPhoto: PhotosPickerItem?
    @State private var selectedImageData: Data?
    
    @State private var name = ""
    @State private var prepTime = 0
    @State private var cookTime = 0
    @State private var servingSize = 0
    
    @State private var ingredients: [String] = []
    @State private var newIngredient = ""
    
    @State private var instructions: [String] = []
    @State private var newInstruction = ""
    
    @State private var nutrition: [String] = []
    @State private var newNutrition = ""
    
    @State private var selectedTags: [Tag] = []
    
    @Binding var recipeData: RecipeData
    @Binding var tagData: TagData
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    
                    // Photo Card
                    VStack {
                        PhotosPicker(
                            selection: $selectedPhoto,
                            matching: .images
                        ) {
                            if let imageData = selectedImageData,
                               let uiImage = UIImage(data: imageData) {
                                
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 220)
                                    .frame(maxWidth: .infinity)
                                    .clipped()
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                
                            } else {
                                VStack(spacing: 12) {
                                    Image(systemName: "photo")
                                        .font(.largeTitle)
                                    
                                    Text("Add Recipe Photo")
                                        .font(.headline)
                                }
                                .foregroundColor(.secondary)
                                .frame(maxWidth: .infinity)
                                .frame(height: 220)
                                .background(Color(.systemGray6))
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                            }
                        }
                        .onChange(of: selectedPhoto) { _, newPhoto in
                            Task {
                                if let data = try? await newPhoto?.loadTransferable(type: Data.self) {
                                    selectedImageData = data
                                }
                            }
                        }
                    }
                    
                    
                    // Recipe Name
                    Card {
                        TextField("Recipe Name", text: $name)
                            .font(.title3)
                    }
                    
                    
                    // Time Cards
                    HStack(spacing: 12) {
                        TimeBox(title: "Prep", value: $prepTime)
                        TimeBox(title: "Cook", value: $cookTime)
                        TimeBox(title: "Serves", value: $servingSize)
                    }
                    
                    
                    // Ingredients
                    ListCard(title: "Ingredients") {
                        ForEach(ingredients.indices, id: \.self) { index in
                            HStack {
                                TextField(
                                    "Ingredient",
                                    text: $ingredients[index]
                                )
                                
                                Button {
                                    ingredients.remove(at: index)
                                } label: {
                                    Image(systemName: "minus.circle.fill")
                                        .foregroundColor(.red)
                                }
                            }
                        }
                        
                        HStack {
                            TextField("Add ingredient", text: $newIngredient)
                            
                            Button {
                                ingredients.append(newIngredient)
                                newIngredient = ""
                            } label: {
                                Image(systemName: "plus.circle.fill")
                                    .foregroundColor(.orange)
                            }
                            .disabled(newIngredient.isEmpty)
                        }
                    }
                    
                    
                    // Instructions
                    ListCard(title: "Instructions") {
                        ForEach(instructions.indices, id: \.self) { index in
                            
                            HStack(alignment: .top) {
                                Text("\(index + 1).")
                                    .bold()
                                
                                TextField(
                                    "Instruction",
                                    text: $instructions[index],
                                    axis: .vertical
                                )
                                
                                Button {
                                    instructions.remove(at: index)
                                } label: {
                                    Image(systemName: "minus.circle.fill")
                                        .foregroundColor(.red)
                                }
                            }
                        }
                        
                        HStack {
                            TextField(
                                "Add instruction",
                                text: $newInstruction,
                                axis: .vertical
                            )
                            
                            Button {
                                instructions.append(newInstruction)
                                newInstruction = ""
                            } label: {
                                Image(systemName: "plus.circle.fill")
                                    .foregroundColor(.orange)
                            }
                            .disabled(newInstruction.isEmpty)
                        }
                    }
                    
                    
                    // Tags
                    Card {
                        Menu {
                            ForEach(tagData.Tags) { tag in
                                Button {
                                    if let index = selectedTags.firstIndex(where: { $0.id == tag.id }) {
                                        selectedTags.remove(at: index)
                                    } else {
                                        selectedTags.append(tag)
                                    }
                                } label: {
                                    HStack {
                                        Text(tag.name)
                                        
                                        if selectedTags.contains(where: { $0.id == tag.id }) {
                                            Image(systemName: "checkmark")
                                        }
                                    }
                                }
                            }
                        } label: {
                            Label(
                                selectedTags.isEmpty ? "Choose Tags" : "Change Tags",
                                systemImage: "tag"
                            )
                        }
                        
                        ForEach(selectedTags) { tag in
                            HStack {
                                Text(tag.name)
                                    .font(.subheadline)
                                
                                Spacer()
                                
                                Button {
                                    selectedTags.removeAll {
                                        $0.id == tag.id
                                    }
                                } label: {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.red)
                                }
                            }
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(Color.orange.opacity(0.15))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("New Recipe")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        let newRecipe = Recipe(
                            imageName: "",
                            imageData: selectedImageData,
                            name: name,
                            prepTime: prepTime,
                            cookTime: cookTime,
                            servingSize: servingSize,
                            ingredients: ingredients,
                            instructions: instructions,
                            nutrition: nutrition,
                            isSaved: true,
                            tags: selectedTags
                        )
                        
                        recipeData.recipes.append(newRecipe)
                        dismiss()
                    }
                    .disabled(name.isEmpty)
                }
            }
        }
    }
}

struct Card<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            content
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}


struct TimeBox: View {
    let title: String
    @Binding var value: Int
    
    var body: some View {
        VStack {
            Text(title)
                .font(.caption)
            
            TextField("0", value: $value, format: .number)
                .multilineTextAlignment(.center)
                .keyboardType(.numberPad)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}


struct ListCard<Content: View>: View {
    let title: String
    let content: Content
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.title3)
                .bold()
            
            content
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    @Previewable @State var recipeData = myRecipeData
    @Previewable @State var tagData = myTagData

    AddRecipeViewTest(recipeData: $recipeData, tagData: $tagData)
}
