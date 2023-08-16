//
//  HorizontalNewsCard.swift
//  CNNBonaFide
//
//  Created by laptop MCO on 13/08/23.
//

import SwiftUI

struct HorizontalNewsCard: View {
    
    let newsItem: NewsItemModel
    
    var body: some View {
        VStack {
            HStack(spacing: 12) {
                ResizableImageView(url: newsItem.image.large.formatted(), width: 80, height: 62)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("CNN Indonesia")
                        .font(.footnote)
                        .foregroundColor(Color.gray)
                    
                    Text(newsItem.title)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                        .truncationMode(.tail)
                        .foregroundColor(.white)
                        .bold()
                }
            }
            .padding()
            
            HStack {
                Text(newsItem.isoDate.formatted(date: .abbreviated, time: .omitted))
                    .font(.footnote)
                +
                Text(" • \(newsItem.timeToRead) min read")
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

struct HorizontalNewsCard_Previews: PreviewProvider {
    
    static var previews: some View {
        HorizontalNewsCard(newsItem: NewsItemModel())
    }
}

