//
//  NewsDetailView.swift
//  CNNBonaFide
//
//  Created by laptop MCO on 13/08/23.
//

import SwiftUI

struct NewsDetailView: View {
    let newsItemDetail: NewsItemModel
    var body: some View {
        ZStack {
            Color("PrimaryBG").edgesIgnoringSafeArea(.all)
            VStack {
                ImageView(url: newsItemDetail.image.large.formatted())
                
                VStack (alignment: .leading, spacing: 10){
                    CategoryDeterminatorLabel(categoryNum: newsItemDetail.categoryFlag)
                    
                    Text(newsItemDetail.title)
                        .font(.title2)
                        .bold()
                    
                    Text("CNN News")
                        .foregroundColor(.gray)
                        .font(.headline)
                    
                    
                    Text("\(newsItemDetail.timeToRead) min read")
                        .font(.footnote)
                    +
                    Text(" • \(newsItemDetail.isoDate.formatted())")
                        .font(.footnote)
                    
                    HStack {
                        Image("Facebook")
                            .resizable()
                            .renderingMode(.template)
                            .frame(width: 25, height: 25)
                            .foregroundColor(Color("IconMain"))
                        
                        Image("Twitter")
                            .resizable()
                            .renderingMode(.template)
                            .frame(width: 25, height: 25)
                            .foregroundColor(Color("IconMain"))
                        
                        Image("Frame")
                            .resizable()
                            .renderingMode(.template)
                            .frame(width: 25, height: 25)
                            .foregroundColor(Color("IconMain"))

                    }
                    
                    Divider()
                        .background(Color.gray.opacity(0.2))
                        .padding(.top)
                        .padding(.bottom)
                    
                    Text(newsItemDetail.contentSnippet)
                 
                    
                    Spacer()
                        
                }
                .foregroundColor(.white)
                .frame(maxHeight: .infinity)
                .padding()
            }
        }
    }
}

struct NewsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailView(newsItemDetail: NewsItemModel())
    }
}
