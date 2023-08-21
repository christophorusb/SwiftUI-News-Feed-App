//
//  TopNavBar.swift
//  CNNBonaFide
//
//  Created by Christophorus Beneditto Aditya Satrio on 12/08/23.
//

import SwiftUI

struct TopNavBar: View {
    
   // @EnvironmentObject var navigationViewModel: NavigationViewModel
    @ObservedObject var navigationViewModelInstance: NavigationViewModel
    
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
                                navigationViewModelInstance.selectedContentTobeRendered = .tech
//                                navigationViewModel.contentToBeRendered = .tech
                            }) {
                                Text("Tech")
                                    .font(.system(size: 14))
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 8)
                                    .background(
                                        navigationViewModelInstance.selectedContentTobeRendered == .tech ?
                                        LinearGradient(gradient: Gradient(colors: [Color.red, Color.red, Color.clear, Color.clear]),
                                                       startPoint: .top,
                                                       endPoint: .bottom)
                                            .frame(height: 7)
                                            .offset(y: 18) // Adjust this value based on your padding and font size
                                        :
                                        LinearGradient(gradient: Gradient(colors: [Color.clear, Color.clear, Color.clear, Color.clear]),
                                                       startPoint: .top,
                                                       endPoint: .bottom)
                                            .frame(height: 6)
                                            .offset(y: 18) // Adjust this value based on your padding and font size
                                    )
                                    .bold(navigationViewModelInstance.selectedContentTobeRendered == .tech ? true : false)
                            }
                            
                            
                            Button(action: {
                                navigationViewModelInstance.selectedContentTobeRendered = .entertainment
//                                navigationViewModel.contentToBeRendered = .entertainment
                            }) {
                                Text("Entertainment")
                                    .font(.system(size: 14))
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 8)
                                    .background(
                                        navigationViewModelInstance.selectedContentTobeRendered == .entertainment ?
                                        LinearGradient(gradient: Gradient(colors: [Color.red, Color.red, Color.clear, Color.clear]),
                                                       startPoint: .top,
                                                       endPoint: .bottom)
                                            .frame(height: 7)
                                            .offset(y: 18) // Adjust this value based on your padding and font size
                                        :
                                        LinearGradient(gradient: Gradient(colors: [Color.clear, Color.clear, Color.clear, Color.clear]),
                                                       startPoint: .top,
                                                       endPoint: .bottom)
                                            .frame(height: 6)
                                            .offset(y: 18) // Adjust this value based on your padding and font size
                                    )
                                    .bold(navigationViewModelInstance.selectedContentTobeRendered == .entertainment ? true : false)
                            }
                            
                            Button(action: {
                                navigationViewModelInstance.selectedContentTobeRendered = .international
//                                navigationViewModel.contentToBeRendered = .international
                            }) {
                                Text("International")
                                    .font(.system(size: 14))
                                    .padding(.horizontal, 14)
                                    .padding(.vertical, 8)
                                    .background(
                                        navigationViewModelInstance.selectedContentTobeRendered == .international ?
                                        LinearGradient(gradient: Gradient(colors: [Color.red, Color.red, Color.clear, Color.clear]),
                                                       startPoint: .top,
                                                       endPoint: .bottom)
                                            .frame(height: 6)
                                            .offset(y: 18) // Adjust this value based on your padding and font size
                                        :
                                        LinearGradient(gradient: Gradient(colors: [Color.clear, Color.clear, Color.clear, Color.clear]),
                                                       startPoint: .top,
                                                       endPoint: .bottom)
                                            .frame(height: 6)
                                            .offset(y: 18) // Adjust this value based on your padding and font size
                                    )
                                    .bold(navigationViewModelInstance.selectedContentTobeRendered == .international ? true : false)
                            }
                            
                            Button(action: {
                                navigationViewModelInstance.selectedContentTobeRendered = .economy
//                                navigationViewModel.contentToBeRendered = .economy
                            }) {
                                Text("Economy")
                                    .font(.system(size: 14))
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(
                                        navigationViewModelInstance.selectedContentTobeRendered == .economy ?
                                        LinearGradient(gradient: Gradient(colors: [Color.red, Color.red, Color.clear, Color.clear]),
                                                       startPoint: .top,
                                                       endPoint: .bottom)
                                            .frame(height: 6)
                                            .offset(y: 18) // Adjust this value based on your padding and font size
                                        :
                                        LinearGradient(gradient: Gradient(colors: [Color.clear, Color.clear, Color.clear, Color.clear]),
                                                       startPoint: .top,
                                                       endPoint: .bottom)
                                            .frame(height: 6)
                                            .offset(y: 18) // Adjust this value based on your padding and font size
                                    )
                                    .bold(navigationViewModelInstance.selectedContentTobeRendered == .economy ? true : false)
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
        TopNavBar(navigationViewModelInstance: NavigationViewModel())
    }
}

/*
 LinearGradient(gradient: Gradient(colors: [Color.red, Color.red, Color.clear, Color.clear]),
                startPoint: .top,
                endPoint: .bottom)
     .frame(height: 6)
     .offset(y: 18) // Adjust this value based on your padding and font size
 :
 LinearGradient(gradient: Gradient(colors: [Color.clear, Color.clear, Color.clear, Color.clear]),
                startPoint: .top,
                endPoint: .bottom)
     .frame(height: 6)
     .offset(y: 18) // Adjust this value based on your padding and font size
 */
