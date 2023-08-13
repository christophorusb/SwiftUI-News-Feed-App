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

struct NewsItemHelper {
    static func getSampleNewsItemData() -> NewsItemModel {
        var sampleObject: NewsItemModel!
        let JSONstring =
        """
        {
            "title": "FOTO: Penampakan Chery Omoda 5  EV di GIIAS 2023",
            "link": "https://www.cnnindonesia.com/otomotif/20230812111934-605-985219/foto-penampakan-chery-omoda-5-ev-di-giias-2023",
            "contentSnippet": "Chery meramaikan Gaikindo Indonesia International Auto Show (GIIAS) 2023 dengan memperkenalkan mobil listrik Omoda 5 EV.",
            "isoDate": "2023-08-12T05:16:30.000Z",
            "image": {
                "small": "https://akcdn.detik.net.id/visual/2023/08/11/mobil-chery-omoda-ev-5_169.jpeg?w=360&q=90",
                "large": "https://akcdn.detik.net.id/visual/2023/08/11/mobil-chery-omoda-ev-5_169.jpeg?w=360&q=100"
            }
        }
        """
        
        if let jsonData = JSONstring.data(using: .utf8) {
            let decoder = JSONDecoder()
            do {
                sampleObject = try decoder.decode(NewsItemModel.self, from: jsonData)
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        
        return sampleObject
    }
}
