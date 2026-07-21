//
//  WelcomeView.swift
//  Apple Foundations Recipe Box
//
//  Created by Lian on 20/7/2026.
//
 
import SwiftUI
 
struct LaunchView: View {

    @State private var showContentView = false

    var body: some View {

        if showContentView {

            ContentView()

        } else {

            ZStack {

                // Background

                Color(red: 0.2, green: 0.7, blue: 0.5)

                    .ignoresSafeArea()


                // Gift Icon

                Image(systemName: "gift.fill")

                    .font(.system(size: 120))

                    .foregroundStyle(.white)

            }

            .onAppear {

                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {

                    withAnimation {

                        showContentView = true

                    }

                }

            }

        }

    }

}
 
#Preview {

    LaunchView()

}
 
