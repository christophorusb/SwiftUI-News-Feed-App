//
//  FeedContentView.swift
//  CNNBonaFide
//
//  Created by laptop MCO on 18/08/23.
//

import SwiftUI

struct FeedContentView: View {
    
    var newsResponseModel: NewsResponseModel? = nil
    
    var body: some View {
        VStack (alignment: .leading, spacing: 20){
            // Main Jumbotron
            TabView {
                ForEach(newsResponseModel?.data.shuffled().prefix(4) ?? [], id: \.id) {
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
                ForEach(newsResponseModel?.data.prefix(10) ?? [], id: \.id) { newsItem in
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
}

struct FeedContentView_Previews: PreviewProvider {
    static var previews: some View {
        FeedContentView()
    }
}
