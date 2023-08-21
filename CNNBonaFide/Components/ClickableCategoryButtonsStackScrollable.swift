//
//  ClickableCategoryButtonScrollable.swift
//  CNNBonaFide
//
//  Created by Christophorus Beneditto Aditya Satrio on 16/08/23.
//

import SwiftUI

struct ClickableCategoryButtonsStackScrollable: View {
    
    @ObservedObject var navigationViewModel = NavigationViewModel()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                
                NavigationalButton(
                    isPresented: $navigationViewModel.navigateToTech,
                    iconName: "bolt.horizontal.circle.fill",
                    forView: NewsByCategoryView(category: "Technology"),
                    buttonText: "Technology",
                    action: {navigationViewModel.navigateToTech = true}
                )
                
                NavigationalButton(
                    isPresented: $navigationViewModel.navigateToEconomy,
                    iconName: "bitcoinsign.circle.fill",
                    forView: NewsByCategoryView(category: "Economy"),
                    buttonText: "Economy",
                    action: { navigationViewModel.navigateToEconomy = true }
                )
                
                NavigationalButton(
                    isPresented: $navigationViewModel.navigateToInternational,
                    iconName: "airplane",
                    forView: NewsByCategoryView(category: "International"),
                    buttonText: "International",
                    action: { navigationViewModel.navigateToInternational = true}
                )
                
                NavigationalButton(
                    isPresented: $navigationViewModel.navigateToEntertainment,
                    iconName: "aspectratio.fill",forView: NewsByCategoryView(category: "Entertainment"),
                    buttonText: "Entertainment",
                    action: {navigationViewModel.navigateToEntertainment = true}
                )
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
