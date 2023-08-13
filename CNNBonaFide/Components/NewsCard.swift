//
//  NewsCard.swift
//  CNNBonaFide
//
//  Created by laptop MCO on 13/08/23.
//

import SwiftUI

struct NewsCard: View {
    
    let news: NewsItemModel
    
    var body: some View {
        VStack {
            HStack {
                ResizableImageView(url: news.image.large.formatted(), width: 80, height: 62)
                
                VStack(alignment: .leading) {
                    Text("CNN Indonesia")
                        .font(.footnote)
                        .foregroundColor(Color.gray)
                        
                    Spacer()
                    
                    Text(news.title)
                        .lineLimit(2)
                        .truncationMode(.tail)
                        .foregroundColor(.white)
                        .bold(true)
                }
            }
            .padding()
            
            HStack {
                Text(news.isoDate.formatted(date: .abbreviated, time: .omitted))
                    .font(.footnote)
                +
                Text(" • \(news.timeToRead) min read")
                    .font(.footnote)
                
                Spacer()
                
                Image(systemName: "bookmark")
                    .resizable()
                    .frame(width: 15, height: 20)
                
                Image(systemName: "ellipsis")
                    .resizable()
                    .frame(width: 20, height: 5)
            }
            .foregroundColor(.white)
            .padding(.leading)
            .padding(.trailing)
            .padding(.bottom)
        }
        .background(Color("HorizontalCardBG"))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(.bottom)
        .frame(maxWidth: .infinity)
    }
}

struct NewsCard_Previews: PreviewProvider {
    
    static var previews: some View {
        NewsCard(news: NewsItemModel())
    }
}
