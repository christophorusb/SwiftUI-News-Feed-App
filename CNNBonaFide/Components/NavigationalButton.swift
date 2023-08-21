//
//  CategoryButton.swift
//  CNNBonaFide
//
//  Created by Christophorus Beneditto Aditya Satrio on 15/08/23.
//

import SwiftUI

struct NavigationalButton<DestinationView: View>: View {
    
    @Binding var isPresented: Bool

    var iconName: String
    var forView: DestinationView
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
        .navigationDestination(isPresented: $isPresented, destination: { forView })
    }
}


struct CategoryButton_Previews: PreviewProvider {
    static var previews: some View {
        NavigationalButton(isPresented: .constant(true), iconName: "skew", forView: NewsFeedView(), buttonText: "Science", action: {})
    }
}
