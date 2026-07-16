//
//  BrowseView.swift
//  Apple Foundations Recipe Box
//
//  Created by Michael Miller on 16/7/2026.
//

import SwiftUI

struct BrowseView: View {
    var body: some View {
        VStack {
            Text("This is the browse screen.")
            
            // This button switches screens
            NavigationLink("Go to Details", destination: MyRecipesView())
        }
        .navigationTitle("Home")
    }
}

#Preview {
    BrowseView()
}
