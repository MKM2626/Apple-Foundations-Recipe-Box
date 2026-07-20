import SwiftUI
 
struct RecipeCard: View {
    var recipe: Recipe
    @State private var isSaved = false
 
    var body: some View {
        VStack(spacing: 12) {
            Image("prawn")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 100)
                .frame(maxWidth: 140)
                .clipShape(RoundedRectangle(cornerRadius: 8))
 
            HStack {
                Text(recipe.name)
                    .font(.title2)
                    .bold()
 
                Button {
                    isSaved.toggle()
                } label: {
                    Image(systemName: isSaved ? "heart.fill" : "heart")
                        .foregroundColor(isSaved ? .red : .gray)
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
    RecipeCard(recipe: myRecipeData.recipes[0])
}
