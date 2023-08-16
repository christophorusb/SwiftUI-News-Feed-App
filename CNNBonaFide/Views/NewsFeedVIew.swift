//
//  NewsFeedVIew.swift
//  CNNBonaFide
//
//  Created by laptop MCO on 15/08/23.
//

import SwiftUI

struct NewsFeedView: View {
    
    @StateObject private var newsViewModel = NewsViewModel()
    @State private var currentJumbotronSelection: Int = 0
    
    var body: some View {
        MyNavigationStack {
            ZStack{
                Color("PrimaryBG").edgesIgnoringSafeArea(.all)
                
                // Main content
                ScrollView{
                    // Super Wrapper
                    VStack (alignment: .leading, spacing: 20){
                        // Main Jumbotron
                        TabView {
                            ForEach(newsViewModel.newsResponse?.data.shuffled().prefix(4) ?? [], id: \.id) {
                                newsItem in
                                NavigationLink {
                                    NewsDetailView(newsItemDetail: newsItem)
                                } label: {
                                    FillImageCardView(item: newsItem)
                                }
                            }
                        }
                        .tabViewStyle(.page)
                        .frame(minHeight: 272)
                        

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
                            
                            //News Card
                            ForEach(newsViewModel.newsResponse?.data.prefix(10) ?? [], id: \.id) { newsItem in
                                NavigationLink {
                                    NewsDetailView(newsItemDetail: newsItem)
                                } label: {
                                    HorizontalNewsCard(newsItem: newsItem)
                                }

                            }
                        }
                    }
                    .padding()
                }
                .padding(.top, 142)
              

                // Top Nav
                TopNavBar()
            }
        }
        .onAppear{
            if newsViewModel.newsResponse?.data.isEmpty ?? true {
                newsViewModel.getAll()
            }
        }
    }
}

struct NewsFeedVIew_Previews: PreviewProvider {
    static var previews: some View {
        NewsFeedView()
    }
}
