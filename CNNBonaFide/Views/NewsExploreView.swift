//
//  NewsExploreView.swift
//  CNNBonaFide
//
//  Created by Christophorus Beneditto Aditya Satrio on 13/08/23.
//

import SwiftUI

struct NewsExploreView: View {
    
    @StateObject private var newsViewModel = NewsViewModel()
    @State private var searchText = ""
    @State private var isSearchBarActive = false
    @State private var arrayResponse: [NewsItemModel]? = []
    @State private var filteredItems: [NewsItemModel] = []
    
    func filterNews() {
        filteredItems = (newsViewModel.newsResponse?.data.filter({ item in
            item.title.localizedCaseInsensitiveContains(searchText)
        }))!
        
        print("\nFound \(filteredItems.count) matches\n")
    }
    
    
    var body: some View {
        NavigationStack{
            ZStack {
                Color("PrimaryBG").edgesIgnoringSafeArea(.all)
                
                
                
                ScrollView{
                    //Super Wrapper
                    VStack(alignment: .leading, spacing: 20){
                        
                        if isSearchBarActive == false {
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
                                
                                if newsViewModel.isLoading == true {
                                    LoadingSpinner(scaleMultiplier: 1.3, isIncludeText: false)
                                }
                                else {
                                    // Horizontal stack of cards
                                    ScrollView(.horizontal, showsIndicators: false){
                                        HStack (spacing: 50) {
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
                                
                                if newsViewModel.isLoading == true {
                                    LoadingSpinner(scaleMultiplier: 1.3, isIncludeText: false)
                                }
                                else{
                                    // Horizontal stack of cards
                                    ScrollView(.horizontal, showsIndicators: false){
                                        HStack (spacing: 50) {
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
                                
                                if newsViewModel.isLoading == true {
                                    LoadingSpinner(scaleMultiplier: 1.3, isIncludeText: false)
                                }
                                else {
                                    // Horizontal stack of cards
                                    ScrollView(.horizontal, showsIndicators: false){
                                        HStack (spacing: 50) {
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
                        }
                        else{
//                            Text("\(searchText)")
//                                .foregroundColor(.white)
                            VStack(alignment: .leading) {
                                Text("Results for ' \(searchText) '")
                                    .bold()
                                    .font(.title2)
                                    .foregroundColor(Color("CategoryLabel"))
                                    .padding(.bottom)
                                
                                Divider()
                                    .background(Color.white.opacity(1))
                                
                                if filteredItems.count > 0 {
                                    ForEach(filteredItems, id: \.id) { item in
                                        NavigationLink {
                                            NewsDetailView(newsItemDetail: item)
                                        } label: {
                                            VStack(alignment: .leading, spacing: 10) {
                                                HStack{
                                                    Text("\(item.title)")
                                                        .foregroundColor(.white)
                                                        .multilineTextAlignment(.leading)
                                                        .font(.headline)
                                                    
                                                    Spacer()
                                                    
                                                    
                                                    Image(systemName: "chevron.right.circle.fill")
                                                        .resizable()
                                                        .frame(width: 20, height: 20)
                                                        .foregroundColor(Color("CategoryLabel"))
                                                }
                                                
                                                
                                                Divider()
                                                    .background(Color.white.opacity(0.3))
                                            }
                                        }
                                    }
                                }else {

                                    Text("Sorry! We cannot find what you're looking for 😣")
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.center)
                                        .bold()
                                        .padding(.top, 50)
                                }
                            }
                        }
                    }
                    .padding()
                    .searchable(text: $searchText)
                }
                .refreshable{
                    newsViewModel.getAll()
                }
            }
            .navigationTitle("Discover")
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(
                Color.black,
                for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .onAppear{
                if newsViewModel.newsResponse?.data.isEmpty ?? true {
                    newsViewModel.getAll()
                }
            }
            .onChange(of: searchText) { newValue in
                if !newValue.isEmpty {
                    isSearchBarActive = true
                    filterNews()
                }
                else {
                    isSearchBarActive = false
                }
            }
        }
    }
}

struct NewsExploreView_Previews: PreviewProvider {
    static var previews: some View {
        NewsExploreView()
    }
}
