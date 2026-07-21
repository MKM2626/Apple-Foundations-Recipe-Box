//
//  FeatureIntroView.swift
//  Recipe Box
//
 
import SwiftUI
 
 
struct FeatureIntroView: View {
    
    @State private var currentIndex = 0
    
    // Navigate to main app
    @State private var goToContent = false
    
    
    // App theme colour
    let appGreen = Color(
        red: 0.05,
        green: 0.56,
        blue: 0.25
    )
    
    
    let features = [
        
        Feature(
            image: "network",
            title: "Browse",
            description: "Discover new recipes and explore different cooking ideas."
        ),
        
        Feature(
            image: "menucard.fill",
            title: "My Recipes",
            description: "Save your favourite recipes and create your own recipe collection."
        ),
        
        Feature(
            image: "sparkles",
            title: "Coming Soon",
            description: "More exciting features are coming soon."
        ),
        
        Feature(
            image: "calendar",
            title: "Meal Planning",
            description: "Plan your meals and organise your week with an upcoming meal planner."
        ),

        Feature(
            image: "list.bullet",
            title: "Grocery List",
            description: "Turn your recipes into a shopping list with upcoming grocery tools."
        )
    ]
    
    
    
    var body: some View {
        
        if goToContent {
            
            ContentView()
            
        } else {
            
            VStack {
                
                
                Spacer()
                
                
                // MARK: - Feature Cards
                
                TabView(selection: $currentIndex) {
                    
                    ForEach(
                        0..<features.count,
                        id: \.self
                    ) { index in
                        
                        FeatureCard(
                            feature: features[index],
                            appGreen: appGreen
                        )
                        .tag(index)
                    }
                    
                }
                .tabViewStyle(
                    PageTabViewStyle(
                        indexDisplayMode: .always
                    )
                )
                .frame(height: 420)
                
                
                
                Spacer()
                
                
                // MARK: - Bottom Action
                
                if currentIndex == features.count - 1 {
                    
                    Button {
                        
                        goToContent = true
                        
                    } label: {
                        
                        Text("GET STARTED")
                            .font(
                                .system(
                                    size: 16,
                                    weight: .bold
                                )
                            )
                            .foregroundStyle(.white)
                            .frame(
                                width: 180,
                                height: 45
                            )
                            .background(appGreen)
                            .clipShape(
                                RoundedRectangle(
                                    cornerRadius: 20
                                )
                            )
                    }
                    
                } else {
                    
                    Text("Swipe to explore")
                        .font(
                            .system(
                                size: 20,
                                weight: .medium
                            )
                        )
                        .foregroundStyle(.gray)
                }
                
                
                Spacer()
                
            }
            .background(.white)
        }
    }
}
 
 
 
 
 
// MARK: - Feature Card
 
struct FeatureCard: View {
    
    let feature: Feature
    let appGreen: Color
    
    
    var body: some View {
        
        VStack(spacing: 25) {
            
            
            Image(systemName: feature.image)
                .font(.system(size: 80))
                .foregroundStyle(appGreen)
            
            
            
            Text(feature.title)
                .font(
                    .system(
                        size: 32,
                        weight: .bold
                    )
                )
                .foregroundStyle(.black)
            
            
            
            Text(feature.description)
                .font(
                    .system(
                        size: 17
                    )
                )
                .multilineTextAlignment(.center)
                .foregroundStyle(.gray)
                .padding(.horizontal,25)
            
            
        }
        .frame(
            width: 310,
            height: 360
        )
        
        // Card background
        .background(appGreen.opacity(0.02))
        
        
        // Green border
        .overlay(
            RoundedRectangle(
                cornerRadius: 30
            )
            .stroke(
                appGreen,
                lineWidth: 5
            )
        )
        
        
        // Rounded corners
        .clipShape(
            RoundedRectangle(
                cornerRadius: 30
            )
        )
        
        
        // Shadow effect
        .shadow(
            radius: 10,
            y: 5
        )
    }
}
 
 
 
 
 
// MARK: - Feature Model
 
struct Feature {
    
    let image: String
    let title: String
    let description: String
    
}
 
 
 
 
 
#Preview {
    FeatureIntroView()
}
