//
//  CNNBonaFideApp.swift
//  CNNBonaFide
//
//  Created by Christophorus Beneditto Aditya Satrio on 12/08/23.
//

import SwiftUI
import UIKit

@main
struct CNNBonaFideApp: App {
    
    init() {
        UISearchBar.appearance(whenContainedInInstancesOf: [UINavigationBar.self]).tintColor = UIColor.white
        UISearchBar.appearance(whenContainedInInstancesOf: [UINavigationBar.self])
        
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = UIColor.white
        
//        let navigationBarAppearance = UINavigationBarAppearance()
//        navigationBarAppearance.configureWithOpaqueBackground()
//        navigationBarAppearance.titleTextAttributes = [ NSAttributedString.Key.foregroundColor : UIColor.white ]
//
//        navigationBarAppearance.backgroundColor = UIColor(named: "PrimaryBG")
//
//        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
//        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
//        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
//
//        UINavigationBar.appearance().tintColor = UIColor.white
//        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
//        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor.white]
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
