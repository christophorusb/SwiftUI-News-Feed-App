//
//  LoadingSpinner.swift
//  CNNBonaFide
//
//  Created by laptop MCO on 18/08/23.
//

import SwiftUI

struct LoadingSpinner: View {
    var scaleMultiplier: CGFloat
    var isIncludeText: Bool
    
    var body: some View {
        ProgressView {
            if isIncludeText {
                Text("Loading Content...")
                    .foregroundColor(Color("CategoryLabel"))
                    .font(.caption2)
            }
        }
        .progressViewStyle(CircularProgressViewStyle(tint: Color("CategoryLabel")))
        .scaleEffect(scaleMultiplier, anchor: .center)
    }
}


struct LoadingSpinner_Previews: PreviewProvider {
    static var previews: some View {
        LoadingSpinner(scaleMultiplier: 1.7, isIncludeText: true)
    }
}
