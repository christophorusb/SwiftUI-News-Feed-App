//
//  NavigationViewModel.swift
//  CNNBonaFide
//
//  Created by Christophorus Beneditto Aditya Satrio on 16/08/23.
//

import Foundation

class NavigationViewModel: ObservableObject {
    
    enum ButtonType {
        case tech, entertainment, international, economy
    }
    
    enum FeedContentToBeRendered {
        case tech, entertainment, international, economy, new
    }
    
    @Published var selectedContentTobeRendered: FeedContentToBeRendered = .tech
    @Published var previousRenderedContent: FeedContentToBeRendered = .new
    
    @Published var selectedButton: ButtonType?
    
    @Published var navigateToTech = false
    @Published var navigateToInternational = false
    @Published var navigateToEntertainment = false
    @Published var navigateToEconomy = false
}
