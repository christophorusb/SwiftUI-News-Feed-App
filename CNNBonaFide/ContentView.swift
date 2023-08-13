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
                ScrollView{
                    // Super Wrapper
                    VStack (alignment: .leading, spacing: 20){
                        // Main Jumbotron
                        if let mainJumbotron = newsItemService.newsResponse?.data.first {
                            FillImageCardView(item: mainJumbotron)
                        }
                        
                        // Divider Horizontal Border
                        Divider()
                            .background(Color.gray.opacity(0.2))
                        
                        // Top Stories Wrapper
                        VStack {
                            HStack {
                                Text("Top Stories")
                                    .bold()
                                    .font(.title2)
                                Spacer()
                                Text("See all")
                                
                            }
                            .foregroundColor(Color.white)
                            
                            //Horizontal Card
      
                            ForEach(newsItemService.newsResponse?.data.prefix(10) ?? [], id: \.id) { newsItem in
                                NewsCard(news: newsItem)
                            }
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
