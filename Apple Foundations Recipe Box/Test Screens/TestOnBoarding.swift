//
//  featureIntro.swift
//  Apple Foundations Recipe Box
//
//  Created by Michael Miller on 21/7/2026.
//

import SwiftUI

struct OnBoardingTest: View {
    
    @State private var currentIndex = 0
    @State private var scrollPosition: Int?
    @State private var goToContent = false
    
    
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
            
            ZStack {
                
                appGreen.opacity(0.08)
                    .ignoresSafeArea()
                
                
                VStack {
                    
                    
                    ScrollView(.horizontal) {

                        HStack() {

                            ForEach(Array(features.enumerated()), id: \.offset) { index, feature in
                                
                                FeatureCardTest(
                                    feature: feature,
                                    appGreen: appGreen
                                )
                                .containerRelativeFrame(.horizontal)
                                .scrollTransition(.interactive, axis: .horizontal) { view, phase in
                                    
                                    view
                                        .scaleEffect(phase.isIdentity ? 1 : 0.88)
                                        .opacity(1 - abs(phase.value) * 0.4)
                                }
                                .id(index)
                            }
                        }
                        .scrollTargetLayout()
                    }
                    .contentMargins(.horizontal, 20)
                    .contentMargins(.vertical, 40)
                    .scrollTargetBehavior(.paging)
                    .scrollIndicators(.hidden)
                    .scrollPosition(id: $scrollPosition)
                    .onChange(of: scrollPosition) { _, newValue in
                        if let newValue {
                            currentIndex = newValue
                        }
                    }
                    
                    
                    if currentIndex == features.count - 1 {

                        Button {
                            goToContent = true
                        } label: {
                            Text("GET STARTED")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(width: 220, height: 50)
                                .background(appGreen)
                                .clipShape(Capsule())
                                
                        }
                        .padding(.bottom, 30)

                    } else {

                        Text("Swipe to explore")
                            .font(.title2)
                            .foregroundStyle(.secondary)
                            
                    }
                    
                    
                }
            }
        }
    }
}

struct FeatureCardTest: View {
    
    let feature: Feature
    let appGreen: Color
    
    
    var body: some View {
        
        VStack(spacing: 24) {
            
            Spacer()
            
            Image(systemName: feature.image)
                .font(.system(size: 90))
                .foregroundStyle(appGreen)
            
            
            Text(feature.title)
                .font(.largeTitle.bold())
            
            
            Text(feature.description)
                .font(.title3)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
            
            
            Spacer()
            
        }
        .padding(40)
        .frame(width: 330, height: 550)
        .background(.white)
        .clipShape(
            RoundedRectangle(
                cornerRadius: 30
            )
        )
        .shadow(
            color: appGreen.opacity(0.15),
            radius: 20
        )
    }
}

#Preview {
    OnBoardingTest()
}
