//
//  APIServices.swift
//  CNNBonaFide
//
//  Created by Christophorus Beneditto Aditya Satrio on 12/08/23.
//

import Moya

enum NewsAPIServices {
    case getAllNews
    case getInternationalNews
    case getEconomyNews
    case getTechnologyNews
    case getEntertainmentNews
}

extension NewsAPIServices: TargetType {
    var baseURL: URL {
        return URL(string: "https://berita-indo-api-next.vercel.app/api/")!
    }
    
    var path: String {
        switch self {
        case .getAllNews:
            return "/cnn-news"
        case .getInternationalNews:
            return "/cnn-news/internasional"
        case .getEconomyNews:
            return "/cnn-news/ekonomi"
        case .getTechnologyNews:
            return "/cnn-news/teknologi"
        case .getEntertainmentNews:
            return "/cnn-news/hiburan"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getAllNews:
            return .get
        case .getInternationalNews:
            return .get
        case .getEconomyNews:
            return .get
        case .getTechnologyNews:
            return .get
        case .getEntertainmentNews:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .getAllNews:
            return .requestPlain
        case .getInternationalNews:
            return .requestPlain
        case .getEconomyNews:
            return .requestPlain
        case .getTechnologyNews:
            return .requestPlain
        case .getEntertainmentNews:
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
