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
            
            ZStack{
                Color("PrimaryBG").edgesIgnoringSafeArea(.all)
                // Main content
                VStack {
                    VStack {
                        if let mainJumbotron = newsItemService.newsResponse?.data.first {
                            FillImageCardView(item: mainJumbotron)
                        }
                    }
                    .padding()
                }
                
                // Top Nav
                TopNavBar()
                
            }
        }
        .onAppear{
            if newsItemService.newsResponse?.data.isEmpty ?? true {
                newsItemService.getAll()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



//                List(newsItemService.newsResponse?.data ?? []) { item in
//                    VStack (alignment: .leading){
//                        Text(item.title)
//                        Text(item.id.uuidString)
//                        Text(item.categoryFlag.formatted())
//                    }
//                }
//                .onAppear {
//                    if newsItemService.newsResponse?.data.isEmpty ?? true {
//                        newsItemService.getAll()
//                    }
//                }
//                .overlay(Group {
//                    if newsItemService.isLoading {
//                        ProgressView() // Show a loading indicator
//                    }
//                })
