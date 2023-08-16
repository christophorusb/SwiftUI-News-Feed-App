//
//  NewsExploreView.swift
//  CNNBonaFide
//
//  Created by laptop MCO on 13/08/23.
//

import SwiftUI

struct NewsExploreView: View {
    
    @StateObject private var newsViewModel = NewsViewModel()
    @State private var searchTerm = ""
    @ObservedObject var navigationViewModel = NavigationViewModel()
    
    var body: some View {
        NavigationStack{
            ZStack {
                Color("PrimaryBG").edgesIgnoringSafeArea(.all)
                
                ScrollView{
                    //Super Wrapper
                    VStack(alignment: .leading, spacing: 20){
                        
                        //Category Label Scroll
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ClickableCategoryButtonsStackScrollable()
                            }
                            .padding(.bottom)
                        }
                        
                        
                        //Wrapper based on explore type
                        VStack {
                            HStack {
                                Text("Recent News")
                                    .bold()
                                    .font(.title2)
                                Spacer()
                                Text("View More")
                                    .font(.subheadline)
                            }
                            .foregroundColor(.white)
                            
                            // Horizontal stack of cards
                            ScrollView(.horizontal, showsIndicators: false){
                                HStack (spacing: 20) {
                                    ForEach(newsViewModel.newsResponse?.data[0..<11] ?? [], id: \.id) { newsItem in
                                        NavigationLink {
                                            NewsDetailView(newsItemDetail: newsItem)
                                        } label: {
                                            VerticalNewsCard(newsItem: newsItem)
                                        }
                                        .padding(.bottom)
                                        .padding(.top)
                                    }
                                }
                                .padding()
                            }
                            
                        }
                        
                        VStack {
                            HStack {
                                Text("Recommended")
                                    .bold()
                                    .font(.title2)
                                Spacer()
                                Text("View More")
                                    .font(.subheadline)
                            }
                            .foregroundColor(.white)
                            
                            // Horizontal stack of cards
                            ScrollView(.horizontal, showsIndicators: false){
                                HStack (spacing: 20) {
                                    ForEach(newsViewModel.newsResponse?.data[11..<21] ?? [], id: \.id) { newsItem in
                                        NavigationLink {
                                            NewsDetailView(newsItemDetail: newsItem)
                                        } label: {
                                            VerticalNewsCard(newsItem: newsItem)
                                        }
                                        .padding(.bottom)
                                        .padding(.top)
                                    }
                                }
                                .padding()
                            }
                        }
                        
                        VStack {
                            HStack {
                                Text("Trending Topics")
                                    .bold()
                                    .font(.title2)
                                Spacer()
                                Text("View More")
                                    .font(.subheadline)
                            }
                            .foregroundColor(.white)
                            
                            // Horizontal stack of cards
                            ScrollView(.horizontal, showsIndicators: false){
                                HStack (spacing: 20) {
                                    ForEach(newsViewModel.newsResponse?.data[21..<31] ?? [], id: \.id) { newsItem in
                                        NavigationLink {
                                            NewsDetailView(newsItemDetail: newsItem)
                                        } label: {
                                            VerticalNewsCard(newsItem: newsItem)
                                        }
                                        .padding(.bottom)
                                        .padding(.top)
                                    }
                                }
                                .padding()
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Discover")
            .onAppear{
                if newsViewModel.newsResponse?.data.isEmpty ?? true {
                    newsViewModel.getAll()
                }
            }
            //.toolbarBackground(Color.black.opacity(0.9), for: .navigationBar)
        }
        .accentColor(.white)
        .searchable(text: $searchTerm, prompt: "Search News")
    }
}

struct NewsExploreView_Previews: PreviewProvider {
    static var previews: some View {
        NewsExploreView()
    }
}

/*
 Button(action: {
         navigateToTech = true
     }){
         CategoryNavButton(iconName: "bolt.horizontal.circle.fill", buttonText: "Technology") {
             navigateToTech = true
         }
     }.navigationDestination(isPresented: $navigateToTech, destination: { NewsByCategoryView(category: "Technology")
     })
 
 Button(action: {
         navigateToEconomy = true
     }){
         CategoryNavButton(iconName: "bitcoinsign.circle.fill", buttonText: "Economy") {
             navigateToEconomy = true
         }
     }.navigationDestination(isPresented: $navigateToEconomy, destination: { NewsByCategoryView(category: "Economy")
     })
 
 Button(action: {
         navigateToInternational = true
     }){
         CategoryNavButton(iconName: "airplane", buttonText: "International") {
             navigateToInternational = true
         }
     }.navigationDestination(isPresented: $navigateToInternational, destination: { NewsByCategoryView(category: "International")
     })
 
 Button(action: {
         navigateToEntertainment = true
     }){
         CategoryNavButton(iconName: "aspectratio.fill", buttonText: "Entertainment") {
             navigateToEntertainment = true
         }
     }.navigationDestination(isPresented: $navigateToEntertainment, destination: { NewsByCategoryView(category: "Entertainment")
     })
 */
