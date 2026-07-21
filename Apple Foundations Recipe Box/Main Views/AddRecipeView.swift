
import SwiftUI
 
struct AddRecipeView: View {
    @Environment(\.dismiss) var dismiss
 
    @State private var imageName: String = "prawn"
    @State private var name: String = ""
    @State private var prepTime: Int = 0
    @State private var cookTime: Int = 0
    @State private var servingSize: Int = 0
    @State private var ingredients: [String] = []
    @State private var newIngredient: String = ""
    @State private var instructions: [String] = []
    @State private var newInstruction: String = ""
    @State private var nutrition: [String] = []
    @State private var newNutrition: String = ""
    
    // Updated to hold the actual Tag objects
    @State private var selectedTags: [Tag] = []
 
    var body: some View {
        NavigationStack {
            Form {
                Section("RECIPE DETAILS") {
                    TextField("Recipe Name", text: $name)
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 160)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                    Menu {
                        // Optional: Logic to change image could go here
                    } label: {
                        HStack {
                            Text("Image")
                            Spacer()
                            Text(imageName.replacingOccurrences(of: "_", with: " ").capitalized)
                        }
                    }
                }
                
                Section("Time and Servings") {
                    HStack {
                        Text("Prep Time (mins)")
                        TextField("Minutes", value: $prepTime, format: .number)
                    }
                    HStack {
                        Text("Cook Time (mins)")
                        TextField("Minutes", value: $cookTime, format: .number)
                    }
                    HStack {
                        Text("Serving Size (Servings)")
                        TextField("Servings", value: $servingSize, format: .number)
                    }
                }
                
                Section("Ingredients") {
                    ForEach(ingredients, id: \.self) { item in
                        Text(item)
                    }
                    .onDelete { ingredients.remove(atOffsets: $0) }
 
                    HStack {
                        TextField("New ingredient", text: $newIngredient)
                        Button("Add") {
                            ingredients.append(newIngredient)
                            newIngredient = ""
                        }
                        .disabled(newIngredient.isEmpty)
                    }
                }
 
                Section("Instructions") {
                    ForEach(instructions, id: \.self) { item in
                        Text(item)
                    }
                    .onDelete { instructions.remove(atOffsets: $0) }
 
                    HStack {
                        TextField("New instruction", text: $newInstruction)
                        Button("Add") {
                            instructions.append(newInstruction)
                            newInstruction = ""
                        }
                        .disabled(newInstruction.isEmpty)
                    }
                }
 
                Section("Tags") {
                    Menu(selectedTags.isEmpty ? "Choose Tags" : "\(selectedTags.count) Selected") {
                        ForEach(myTagData.Tags) { tag in
                            Button {
                                // Toggle selection: if already in list, remove it. Otherwise, add it.
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
                    }
 
                    // Display selected tags in the form
                    ForEach(selectedTags) { tag in
                        Text(tag.name)
                    }
                    .onDelete { indexSet in
                        selectedTags.remove(atOffsets: indexSet)
                    }
                }
            }
            .navigationTitle("Add Recipe")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("CANCEL") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        // 1. Create the new recipe object
                        let newRecipe = Recipe(
                            imageName: imageName,
                            name: name,
                            prepTime: prepTime,
                            cookTime: cookTime,
                            servingSize: servingSize,
                            ingredients: ingredients,
                            instructions: instructions,
                            nutrition: nutrition,
                            isSaved: false,
                            tags: selectedTags // Pass the selected tags here
                        )
                        
                        // 2. Add to your global database list
                        myRecipeData.recipes.append(newRecipe)
                        
                        dismiss()
                    }
                    .disabled(name.isEmpty)
                }
            }
        }
    }
}
 
#Preview {
    AddRecipeView()
}
