//
//  ClickableCategoryButtonScrollable.swift
//  CNNBonaFide
//
//  Created by laptop MCO on 16/08/23.
//

import SwiftUI

struct ClickableCategoryButtonsStackScrollable: View {
    
    @ObservedObject var navigationViewModel = NavigationViewModel()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                
                Button(action: {
                        navigationViewModel.navigateToTech = true
                    }){
                        CategoryNavButton(iconName: "bolt.horizontal.circle.fill", buttonText: "Technology") {
                            navigationViewModel.navigateToTech = true
                        }
                    }.navigationDestination(isPresented: $navigationViewModel.navigateToTech, destination: { NewsByCategoryView(category: "Technology")
                    })
                
                Button(action: {
                        navigationViewModel.navigateToEconomy = true
                    }){
                        CategoryNavButton(iconName: "bitcoinsign.circle.fill", buttonText: "Economy") {
                            navigationViewModel.navigateToEconomy = true
                        }
                    }.navigationDestination(isPresented: $navigationViewModel.navigateToEconomy, destination: { NewsByCategoryView(category: "Economy")
                    })
                
                Button(action: {
                        navigationViewModel.navigateToInternational = true
                    }){
                        CategoryNavButton(iconName: "airplane", buttonText: "International") {
                            navigationViewModel.navigateToInternational = true
                        }
                    }.navigationDestination(isPresented: $navigationViewModel.navigateToInternational, destination: { NewsByCategoryView(category: "International")
                    })
                
                Button(action: {
                        navigationViewModel.navigateToEntertainment = true
                    }){
                        CategoryNavButton(iconName: "aspectratio.fill", buttonText: "Entertainment") {
                            navigationViewModel.navigateToEntertainment = true
                        }
                    }.navigationDestination(isPresented: $navigationViewModel.navigateToEntertainment, destination: { NewsByCategoryView(category: "Entertainment")
                    })
            }
            .padding(.bottom)
        }
    }
}

struct ClickableCategoryButtonScrollable_Previews: PreviewProvider {
    static var previews: some View {
        ClickableCategoryButtonsStackScrollable()
    }
}
