//
//  SkeletonView.swift
//  CNNBonaFide
//
//  Created by laptop MCO on 12/08/23.
//

import SwiftUI

struct SkeletonView: View {
    var body: some View {
        Rectangle()
            .fill(Color.gray.opacity(0.2))
            .frame(height: 40)
            .cornerRadius(5)
            .modifier(ShimmerModifier(animationDuration: 1.5))
    }
}

struct SkeletonView_Previews: PreviewProvider {
    static var previews: some View {
        SkeletonView()
    }
}

struct ShimmerModifier: ViewModifier {
    @State private var gradientStart: UnitPoint = .init(x: -1, y: -0.2)
    @State private var gradientEnd: UnitPoint = .init(x: 1.5, y: 0.2)

    let animationDuration: Double

    func body(content: Content) -> some View {
        content
        .overlay(
            LinearGradient(gradient: Gradient(colors: [Color.clear, Color.white.opacity(0.5), Color.clear]), startPoint: self.gradientStart, endPoint: self.gradientEnd)
                .rotation3DEffect(
                    .degrees(30),
                    axis: (x: 0.0, y: 1.0, z: 0.0)
                )
                .mask(content)
        )
        .onAppear() {
            withAnimation(Animation.linear(duration: self.animationDuration).repeatForever(autoreverses: false)) {
                self.gradientStart = UnitPoint(x: 1.5, y: 0.2)
                self.gradientEnd = UnitPoint(x: -1, y: -0.2)
            }
        }
    }
}


