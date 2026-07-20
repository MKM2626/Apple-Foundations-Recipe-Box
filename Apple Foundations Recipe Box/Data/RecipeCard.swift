import SwiftUI
 
struct RecipeCard: View {
    @Binding var recipe: Recipe
    //@State private var isSaved = false
 
    var body: some View {
        VStack(spacing: 12) {
            Image(recipe.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 100)
                .frame(maxWidth: 140)
                .clipShape(RoundedRectangle(cornerRadius: 8))
 
            HStack {
                Text(recipe.name)
                    .font(.title2)
                    .bold()
                    .foregroundColor(.black)
 
                Button {
                    //isSaved.toggle()
                    recipe.isSaved.toggle()
                } label: {
                    Image(systemName: recipe.isSaved ? "heart.fill" : "heart")
                        .foregroundColor(recipe.isSaved ? .red : .gray)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 4)
    }
}
 
#Preview {
    @Previewable @State var recipe = myRecipeData.recipes[0]

        RecipeCard(recipe: $recipe)
}
