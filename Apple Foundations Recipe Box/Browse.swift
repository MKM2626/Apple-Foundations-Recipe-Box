//
//  ContentView.swift
//  Apple Foundations Recipe Box
//
//  Created by Michael Miller on 16/7/2026.
//

import SwiftUI

struct Browse: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        
        TabView {
                    Text("Home Screen")
                        .tabItem {
                            Image(systemName: "house")
                            Text("Home")
                        }
                    
                    Text("Settings Screen")
                        .tabItem {
                            Image(systemName: "gear")
                            Text("Settings")
                        }
                }
    }
}

#Preview {
    Browse()
}
