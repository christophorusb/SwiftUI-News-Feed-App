//
//  SearchResultsView.swift
//  CNNBonaFide
//
//  Created by laptop MCO on 21/08/23.
//

import SwiftUI

struct SearchResultsView: View {
    
    let searchText: String
    
    let items: [NewsItemModel]
    
    var filteredItems: [NewsItemModel] {
        items.filter { item in
            searchText.isEmpty || item.title.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    var body: some View {
        NavigationStack {
            Text("Results for '\(searchText)'")
                .bold()
                .font(.title2)
            List{
                ForEach(items, id: \.id) { item in
                    NavigationLink {
                    NewsDetailView(newsItemDetail: item)
                    } label: {
                        Text("\(item.title)")
                    }
                }
            }
        }
    }
}

struct SearchResultsView_Previews: PreviewProvider {

    static var previews: some View {
        SearchResultsView(searchText: "Another", items: [
            NewsItemModel(),
            NewsItemModel(title: "Another News Title",
                          link: URL(string: "https://another-example.com")!,
                          contentSnippet: "Another news snippet content.",
                          isoDate: Date().addingTimeInterval(-3600), // 1 hour ago for variety
                          image: ImageLinks(small: URL(string: "https://another-example.com/small.jpg")!,
                                           large: URL(string: "https://another-example.com/large.jpg")!)),
            NewsItemModel(title: "Yet Another News Title",
                          link: URL(string: "https://yet-another-example.com")!,
                          contentSnippet: "Yet another news snippet content.",
                          isoDate: Date().addingTimeInterval(-7200), // 2 hours ago for variety
                          image: ImageLinks(small: URL(string: "https://yet-another-example.com/small.jpg")!,
                                           large: URL(string: "https://yet-another-example.com/large.jpg")!))
        ])
    }
}
