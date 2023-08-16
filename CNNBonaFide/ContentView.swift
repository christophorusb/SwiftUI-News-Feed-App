//
//  ContentView.swift
//  CNNBonaFide
//
//  Created by laptop MCO on 12/08/23.
//

import SwiftUI
import UIKit

struct ContentView: View {
    var body: some View {
        TabView {
            NewsFeedView()
                .tabItem{
                    Label("Feed", systemImage: "doc.plaintext")
                }
            NewsExploreView()
                .tabItem {
                    Label("Explore", systemImage: "safari.fill")
                }
        }
        .onAppear() {
            UITabBar.appearance().isTranslucent = true
            UITabBar.appearance().barTintColor = UIColor(Color.black.opacity(0.2)).withAlphaComponent(1)
        }
        .accentColor(.white)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
