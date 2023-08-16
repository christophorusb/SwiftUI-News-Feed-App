//
//  NewsByCategoryView.swift
//  CNNBonaFide
//
//  Created by laptop MCO on 15/08/23.
//

import SwiftUI
import WrappingHStack

struct NewsByCategoryView: View {
    var category: String
    @StateObject private var newsViewModel = NewsViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("PrimaryBG").edgesIgnoringSafeArea(.all)

                ScrollView {
                    VStack{
                        ForEach(newsViewModel.newsResponse?.data.shuffled() ?? [], id: \.id) {
                            newsItem in
                            NavigationLink {
                                NewsDetailView(newsItemDetail: newsItem)
                            } label: {
                                HorizontalNewsCard(newsItem: newsItem)
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("\(category.capitalized)")
            .onAppear {
                if newsViewModel.newsResponse?.data.isEmpty ?? true {
                    newsViewModel.getAll(byCategory: category)
                }
            }
        }
        
    }
}


struct NewsByCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        NewsByCategoryView(category: "TECHNOLOGY")
    }
}
