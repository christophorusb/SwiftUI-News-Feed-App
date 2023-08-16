//
//  NavigationViewModel.swift
//  CNNBonaFide
//
//  Created by laptop MCO on 16/08/23.
//

import Foundation

class NavigationViewModel: ObservableObject {
    @Published var navigateToTech = false
    @Published var navigateToInternational = false
    @Published var navigateToEntertainment = false
    @Published var navigateToEconomy = false
}
