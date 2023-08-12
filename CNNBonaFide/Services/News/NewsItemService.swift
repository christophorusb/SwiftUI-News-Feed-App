//
//  GetAllNews.swift
//  CNNBonaFide
//
//  Created by laptop MCO on 12/08/23.
//

import Combine
import Moya

class NewsItemService: ObservableObject {
    @Published var newsResponse: NewsResponseModel? = nil
    @Published var isLoading: Bool = false
    @Published var error: Error? = nil
  
    private var provider: MoyaProvider<NewsAPIServices> = {
        let logger = NetworkLoggerPlugin(configuration: .init(logOptions: [.errorResponseBody, .requestBody, .requestHeaders]))
        return MoyaProvider<NewsAPIServices>(plugins: [logger])
    }()

    func getAll() {
        self.isLoading = true
        provider.request(.getAllNews) { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let response):
                    do {
                        let decoder = JSONDecoder()
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"  // This format matches the provided isoDate string
                                                                                 // ISO 8601 with Milliseconds
                        decoder.dateDecodingStrategy = .formatted(dateFormatter)
                        let fetchedNews = try decoder.decode(NewsResponseModel?.self, from: response.data)
                        self.newsResponse = fetchedNews
                    } catch let parsingError {
                        self.error = parsingError
                        print("FOUND PARSING ERROR\n \(parsingError) \n")
                    }
                case .failure(let error):
                    self.error = error
                    print("FOUND ERROR\n \(error) \n")
                }
            }
        }
    }
}
