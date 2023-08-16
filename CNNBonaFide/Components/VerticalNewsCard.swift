//
//  VerticalNewsCard.swift
//  CNNBonaFide
//
//  Created by laptop MCO on 14/08/23.
//

import SwiftUI

struct VerticalNewsCard: View {
    
    let newsItem: NewsItemModel
    
    var body: some View {
        VStack{
            ResizableImageView(url: newsItem.image.large.formatted(), width: 166, height: 104)
               
            VStack (alignment: .leading, spacing: 12){
                Text("CNN News")
                    .font(.footnote)
                    .foregroundColor(.gray)
                +
                Text(" • \(newsItem.timeToRead) min read")
                    .font(.footnote)
                    .foregroundColor(.gray)
                
                Text(newsItem.title)
                    .frame(minHeight: 50)
                    .font(.headline)
                    .bold()
                    .foregroundColor(.white)
                    .lineLimit(3)
                    .truncationMode(.tail)
                
                HStack {
                    Text("\(newsItem.isoDate.formatted(date: .abbreviated, time: .omitted))")
                        .font(.footnote)
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    Image(systemName: "bookmark")
                        .resizable()
                        .frame(width: 15, height: 20)
                        .foregroundColor(Color("CategoryLabel"))
                }
                .padding(.top)
            }
            .padding(.top)
        }
        .padding()
        .background(Color("VerticalCardBG"))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .frame(width: 192, height: 240)
    }
}

struct VerticalNewsCard_Previews: PreviewProvider {
    static var previews: some View {
        VerticalNewsCard(newsItem: NewsItemModel())
    }
}
