//
//  ContentView.swift
//  CNNBonaFide
//
//  Created by laptop MCO on 12/08/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var newsItemService = NewsItemService()
    
    var body: some View {
        MyNavigationStack {
            List(newsItemService.newsResponse?.data ?? []) { item in
                Text(item.title)
            }
            .onAppear {
                if newsItemService.newsResponse?.data.isEmpty ?? true{
                    newsItemService.getAll()
                }
            }
            .overlay(Group {
                if newsItemService.isLoading {
                    ProgressView() // Show a loading indicator
                }
            })
        }
        VStack{
            Text("ADASDASDASDASD")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
