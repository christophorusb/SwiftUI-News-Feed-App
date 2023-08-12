//
//  ImageAPIServices.swift
//  CNNBonaFide
//
//  Created by laptop MCO on 12/08/23.
//

import Foundation
import Moya

enum ImageAPIServices {
    case fetchImage(path: String)
}

extension ImageAPIServices: TargetType {
    var baseURL: URL {
        return URL(string: "")!
    }

    var path: String {
        switch self {
        case .fetchImage(let path):
            return path
        }
    }

    var method: Moya.Method {
        switch self {
        case .fetchImage:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .fetchImage:
            return .requestPlain
        }
    }

    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }

    var sampleData: Data {
        return Data()
    }
}
