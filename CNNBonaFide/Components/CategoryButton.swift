//
//  CategoryButton.swift
//  CNNBonaFide
//
//  Created by laptop MCO on 15/08/23.
//

import SwiftUI

struct CategoryNavButton: View {
    var iconName: String
    var buttonText: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "\(iconName)")
                .resizable()
                .frame(width: 20, height: 20)
            Text("\(buttonText)")
                .bold()
                .shadow(radius: 10)
                .padding(EdgeInsets(top: 0, leading:5, bottom: 0, trailing: 15))
        }
        .buttonStyle(.borderedProminent)
        .tint(Color("CategoryLabel"))
        .cornerRadius(25)
    }
}

struct CategoryButton_Previews: PreviewProvider {
    static var previews: some View {
        CategoryNavButton(iconName: "skew", buttonText: "Science", action: {})
    }
}
