//
//  FillImageCardView.swift
//  CNNBonaFide
//
//  Created by laptop MCO on 12/08/23.
//

import SwiftUI
import Foundation

struct FillImageCardView: View {
    let item: NewsItemModel
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            // Handle the image loading here, possibly with another conditional or default image.
            
            ImageView(url: item.image.large.formatted())
            
            VStack(alignment: .leading, spacing: 4) {
                Text(item.title)
                    .font(.headline)
                    .foregroundColor(.white)
                    .shadow(radius: 2)
                
                Text(item.contentSnippet)
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .shadow(radius: 2)
            }
            .background(Color("VerticalCardBG"))
            .padding()
        }
    }
}

struct ImageView: View {
    let url: String
    var body: some View {
        AsyncImage(url: URL(string: "\(url)")) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            else if phase.error != nil {
                
            }
            else {
                Image(systemName: "photo") // 4
                   .resizable()
                   .aspectRatio(contentMode: .fill)
            }
        } 
    }
}


//struct FillImageCardView_Previews: PreviewProvider {
//    let dateFormatter = DateFormatter()
//    static var previews: some View {
//        FillImageCardView(item: NewsItemModel(
//            title: "Desa di Italia Dinobatkan Jadi yang Tercantik di Dunia",
//            link: URL(string: "https://www.cnnindonesia.com/gaya-hidup/20230812044947-269-985152/desa-di-italia-dinobatkan-jadi-yang-tercantik-di-dunia")!,
//            contentSnippet: "Di dunia ini penuh dengan kota dan desa kecil yang cantik. Tapi, desa mana yang dianggap tercantik di dunia?",
//            isoDate: DateFormatter().date(from: "2023-08-12T06:10:13.000Z")!,
//            image: ImageLinks(
//                small: URL(string: "https://akcdn.detik.net.id/visual/2023/08/11/desa-cinque-terre-di-italia_169.jpeg?w=360&q=90")!,
//                large: URL(string: "https://akcdn.detik.net.id/visual/2023/08/11/desa-cinque-terre-di-italia_169.jpeg?w=360&q=100")!
//                )
//            )
//        )
//    }
//}

/*
    SAMPLE DATA
        
     {
         "title": "Desa di Italia Dinobatkan Jadi yang Tercantik di Dunia",
         "link": "https://www.cnnindonesia.com/gaya-hidup/20230812044947-269-985152/desa-di-italia-dinobatkan-jadi-yang-tercantik-di-dunia",
         "contentSnippet": "Di dunia ini penuh dengan kota dan desa kecil yang cantik. Tapi, desa mana yang dianggap tercantik di dunia?",
         "isoDate": "2023-08-12T06:10:13.000Z",
         "image": {
             "small": "https://akcdn.detik.net.id/visual/2023/08/11/desa-cinque-terre-di-italia_169.jpeg?w=360&q=90",
             "large": "https://akcdn.detik.net.id/visual/2023/08/11/desa-cinque-terre-di-italia_169.jpeg?w=360&q=100"
         }
    }
*/
