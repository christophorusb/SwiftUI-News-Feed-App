//
//  APIServices.swift
//  CNNBonaFide
//
//  Created by laptop MCO on 12/08/23.
//

import Moya

enum NewsAPI {
    case getAllNews
}

extension NewsAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://berita-indo-api-next.vercel.app/api/")!
    }

    var path: String {
        switch self {
        case .getAllNews:
            return "/cnn-news"
        }
    }

    var method: Moya.Method {
        switch self {
        case .getAllNews:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .getAllNews:
            return .requestPlain
        }
    }

    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }

    var sampleData: Data {
        return Data()  // Used for testing purposes
    }
}
