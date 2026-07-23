
import SwiftUI
import PhotosUI
 
struct AddRecipeView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var selectedPhoto: PhotosPickerItem?
    @State private var selectedImageData: Data?
    
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
    
    @Binding var recipeData: RecipeData
    @Binding var tagData: TagData
 
    var body: some View {
        NavigationStack {
            Form {
                Section("RECIPE DETAILS") {
                    TextField("Recipe Name", text: $name)
                    
                    
                    // Photo Picker
                    PhotosPicker(
                        selection: $selectedPhoto,
                        matching: .images,
                        photoLibrary: .shared()
                    ) {
                        Label(
                            selectedImageData == nil ? "Choose Recipe Photo" : "Change Photo",
                            systemImage: "photo"
                        )
                    }

                    .onChange(of: selectedPhoto) { _, newPhoto in
                        Task {
                            if let data = try? await newPhoto?.loadTransferable(type: Data.self) {
                                selectedImageData = data
                            }
                        }
                    }

                    if let imageData = selectedImageData,
                       let uiImage = UIImage(data: imageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
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
                        ForEach(tagData.Tags) { tag in
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
 
#Preview {
    @Previewable @State var recipeData = myRecipeData
    @Previewable @State var tagData = myTagData

    AddRecipeView(recipeData: $recipeData, tagData: $tagData)
}
