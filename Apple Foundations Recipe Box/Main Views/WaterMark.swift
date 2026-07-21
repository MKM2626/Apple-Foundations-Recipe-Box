//
//  WaterMark.swift
//  Apple Foundations Recipe Box
//
//  Created by Michael Miller on 21/7/2026.
//

import SwiftUI

struct ComingSoonOverlay: View {
    
    var body: some View {
        
        ZStack {
            
            Color.white.opacity(0.65)
            
            Text("COMING SOON")
                .font(.system(size: 42, weight: .black))
                .foregroundStyle(.green.opacity(0.5))
                .rotationEffect(.degrees(-25))
        }
        .allowsHitTesting(false)
    }
}

#Preview {
    ComingSoonOverlay()
}
