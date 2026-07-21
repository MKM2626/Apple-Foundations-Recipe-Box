//
//  WelcomeView.swift
//  Apple Foundations Recipe Box
//
//  Created by Lian on 20/7/2026.
//
 
import SwiftUI
 
struct LaunchView: View {
    
    @State private var showContentView = false
    
    // Controls logo entrance animation
    @State private var showLogo = false
    
    // Controls logo exit animation
    @State private var logoExit = false
    
    // Controls slogan appearance
    @State private var showSlogan = false
    
    // Controls final fade out
    @State private var finishAnimation = false
    
    
    var body: some View {
        
        if showContentView {
            
            ContentView()
            
        } else {
            
            ZStack {
                
                
                // MARK: - Background Gradient
                
                LinearGradient(
                    colors: [
                        Color(red: 0.05, green: 0.5, blue: 0.4),
                        Color(red: 0.45, green: 0.85, blue: 0.65)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                .opacity(finishAnimation ? 0 : 1)
                
                
                
                // MARK: - Gift Logo
                
                VStack(spacing: 25) {
                    
                    Image(systemName: "gift.fill")
                        .font(.system(size: 88))
                        .foregroundStyle(.white)
                    
                    
                    Text("Recipe Box")
                        .font(.system(
                            size: 25,
                            weight: .bold,
                            design: .rounded
                        ))
                        .foregroundStyle(.white)
                }
                .offset(y: -50)
                
                // Logo appears small then grows
                .scaleEffect(
                    showLogo ?
                    (logoExit ? 0.05 : 1)
                    :
                    0.2
                )
                .opacity(
                    logoExit ? 0 : 1
                )
                
                
                
                // MARK: - Slogan
                
                Text("Easy, quick and healthy")
                    .font(.system(
                        size: 25,
                        weight: .medium
                    ))
                    .foregroundStyle(.white)
                    .opacity(showSlogan ? 1 : 0)
                    .scaleEffect(showSlogan ? 1 : 0.8)
                
                
                
            }
            
            
            .onAppear {
                
                
                // Logo appears from small size
                withAnimation(
                    .easeOut(duration: 1)
                ) {
                    showLogo = true
                }
                
                
                
                // Logo grows slightly and disappears
                DispatchQueue.main.asyncAfter(
                    deadline: .now() + 1.8
                ) {
                    
                    withAnimation(
                        .easeInOut(duration: 0.5)
                    ) {
                        logoExit = true
                    }
                }
                
                
                
                // Show slogan after logo disappears
                DispatchQueue.main.asyncAfter(
                    deadline: .now() + 2
                ) {
                    
                    withAnimation(
                        .easeOut(duration: 0.8)
                    ) {
                        showSlogan = true
                    }
                }
                
                
                
                // Fade out the whole launch screen
                DispatchQueue.main.asyncAfter(
                    deadline: .now() + 2.8
                ) {
                    
                    withAnimation(
                        .easeOut(duration: 0.4)
                    ) {
                        finishAnimation = true
                    }
                }
                
                
                
                // Navigate to main page
                DispatchQueue.main.asyncAfter(
                    deadline: .now() + 3.3
                ) {
                    
                    showContentView = true
                }
                
            }
        }
    }
}
 
 
#Preview {
    LaunchView()
}
