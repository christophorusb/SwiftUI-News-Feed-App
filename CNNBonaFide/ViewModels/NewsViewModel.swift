//
//  NewsViewModel.swift
//  CNNBonaFide
//
//  Created by laptop MCO on 15/08/23.
//

import Foundation
import Moya
import Combine

class NewsViewModel: ObservableObject {
    @Published var newsResponse: NewsResponseModel? = nil
    @Published var isLoading: Bool = false
    @Published var error: Error? = nil
    
    private var provider: MoyaProvider<NewsAPIServices> = {
        let logger = NetworkLoggerPlugin(configuration: .init(logOptions: [.errorResponseBody, .requestBody, .requestHeaders]))
        return MoyaProvider<NewsAPIServices>(plugins: [logger])
    }()
    
    func getAll(byCategory category: String? = nil){
        
        self.isLoading = true
        
        var endpoint: NewsAPIServices
        
        switch category {
        case "TECHNOLOGY":
            endpoint = .getTechnologyNews
        case "ECONOMY":
            endpoint = .getEconomyNews
        case "ENTERTAINMENT":
            endpoint = .getEntertainmentNews
        case "INTERNATIONAL":
            endpoint = .getInternationalNews
        default:
            endpoint = .getAllNews
        }
        
        self.isLoading = true
        
        provider.request(endpoint) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let response):
                    do {
                        let decoder = JSONDecoder()
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"  // This format matches the provided isoDate string
                                                                                 // ISO 8601 with Milliseconds
                        decoder.dateDecodingStrategy = .formatted(dateFormatter)
                        let fetchedNews = try decoder.decode(NewsResponseModel?.self, from: response.data)
                        self?.newsResponse = fetchedNews
                    } catch let parsingError {
                        self?.error = parsingError
                        print("FOUND PARSING ERROR\n \(parsingError) \n")
                    }
                case .failure(let error):
                    self?.error = error
                    print("FAILURE! ERROR\n \(error) \n")
                }
            }
        }
    }
}
