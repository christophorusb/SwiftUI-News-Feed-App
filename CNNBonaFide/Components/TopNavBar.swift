//
//  TopNavBar.swift
//  CNNBonaFide
//
//  Created by laptop MCO on 12/08/23.
//

import SwiftUI

struct TopNavBar: View {
    var body: some View {
        // Top Navbar
        GeometryReader { geometry in
            VStack {
                ZStack {
                    Rectangle()
                        .fill(Color("TopNavBG"))

                    VStack {
                        HStack {
                            Image(systemName: "line.horizontal.3.decrease")
                                .resizable()
                                .frame(width: 24, height: 24)

                            Spacer()

                            HStack(spacing: 20){
                                Image(systemName: "magnifyingglass")
                                    .resizable()
                                    .frame(width: 24, height: 24)

                                Image(systemName: "bell")
                                    .resizable()
                                    .frame(width: 24, height: 24)

                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                            }
                        }
                        .padding()
                        
                        Spacer()

                        HStack {
                            Button(action: {
                                print("Button tapped!")
                            }) {
                                Text("Tech")
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(
                                        LinearGradient(gradient: Gradient(colors: [Color.red, Color.red, Color.clear, Color.clear]),
                                                       startPoint: .top,
                                                       endPoint: .bottom)
                                            .frame(height: 6)
                                            .offset(y: 18) // Adjust this value based on your padding and font size
                                    )
                            }
                            
                            Button(action: {
                                print("Button tapped!")
                            }) {
                                Text("Science")
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(
                                        LinearGradient(gradient: Gradient(colors: [Color.red, Color.red, Color.clear, Color.clear]),
                                                       startPoint: .top,
                                                       endPoint: .bottom)
                                            .frame(height: 6)
                                            .offset(y: 18) // Adjust this value based on your padding and font size
                                    )
                            }
                            
                            Button(action: {
                                print("Button tapped!")
                            }) {
                                Text("Education")
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(
                                        LinearGradient(gradient: Gradient(colors: [Color.red, Color.red, Color.clear, Color.clear]),
                                                       startPoint: .top,
                                                       endPoint: .bottom)
                                            .frame(height: 6)
                                            .offset(y: 18) // Adjust this value based on your padding and font size
                                    )
                            }
                            
                            Button(action: {
                                print("Button tapped!")
                            }) {
                                Text("Business")
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(
                                        LinearGradient(gradient: Gradient(colors: [Color.red, Color.red, Color.clear, Color.clear]),
                                                       startPoint: .top,
                                                       endPoint: .bottom)
                                            .frame(height: 6)
                                            .offset(y: 18)
                                    )
                            }
                        }
                        .padding(.top, 5)
                        
                    }
                    .padding(.top, geometry.safeAreaInsets.top + 70)  // Add padding equal to the top safe area inset
                    .foregroundColor(Color.white)
                }
                .frame(height: 162 + geometry.safeAreaInsets.top)  // Adjust the navbar's height based on the top safe area inset
            }
        }
        .edgesIgnoringSafeArea(.top)  // This is necessary for the GeometryReader to get the correct safe area insets
    }
}

struct TopNavBar_Previews: PreviewProvider {
    static var previews: some View {
        TopNavBar()
    }
}
