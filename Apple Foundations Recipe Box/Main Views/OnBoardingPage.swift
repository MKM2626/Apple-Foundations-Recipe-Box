//
//  OnBoardingPage.swift
//  Apple Foundations Recipe Box
//
//  Created by Michael Miller on 21/7/2026.
//

import SwiftUI

struct Slide: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let image: String
}

let slides = [
    Slide(
        title: "Welcome",
        subtitle: "Discover amazing features.",
        image: "sparkles",
    ),
    Slide(
        title: "Stay Organised",
        subtitle: "Everything in one place.",
        image: "calendar",
    ),
    Slide(
        title: "Track Progress",
        subtitle: "Visualise your achievements.",
        image: "chart.line.uptrend.xyaxis",
    ),
    Slide(
        title: "Get Started",
        subtitle: "Let's begin your journey.",
        image: "paperplane.fill"
    )
]

struct Swiper2View: View {

    var body: some View {
        
        ZStack {
            Color(.blue.opacity(0.1))
                .edgesIgnoringSafeArea(.all)
            
            ScrollView(.horizontal) {
                HStack(spacing: 24) {
                    ForEach(slides) { slide in
                        SlideView(slide: slide)
                            .containerRelativeFrame(.horizontal)
                            .scrollTransition(.interactive, axis: .horizontal) { view, phase in
                            
                                view
                                    .scaleEffect(phase.isIdentity ? 1.0 : 0.88)
                                    .rotationEffect(.degrees(phase.value * 12))
                                    .opacity(1 - abs(phase.value) * 0.4)
                                    .offset(y: abs(phase.value) * 30)
                                    .offset(x: abs(phase.value) * 8)
                            }
                    }
                }
            }
            .contentMargins(.horizontal, 20)
            .contentMargins(.vertical, 40)
            .scrollTargetBehavior(.paging) // swipe snaps to each page
            .scrollIndicators(.hidden) // hide scroll bar
        }
    }
}

struct SlideView: View {

    let slide: Slide

    var body: some View {

        VStack(spacing: 24) {
            Spacer()

            Image(systemName: slide.image)
                .font(.system(size: 90))
                .foregroundStyle(.blue)

            Text(slide.title)
                .font(.largeTitle.bold())

            Text(slide.subtitle)
                .font(.title3)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)

            Spacer()
        }
        .padding(40)
        .frame(maxWidth: .infinity)
        .frame(height: 550)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .shadow(color: Color.blue.opacity(0.15), radius: 20)
        
    }
}


#Preview("Swiper 2") {
    Swiper2View()
}
