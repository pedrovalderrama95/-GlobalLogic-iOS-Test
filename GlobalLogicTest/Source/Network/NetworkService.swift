//
//  NetworkService.swift
//  GlobalLogicTest
//
//  Created by Pedro Valderrama on 01/06/2022.
//

import Moya

enum NetworkService {
    case getInfo
}

extension NetworkService: TargetType {
    var baseURL: URL { return URL(string: "http://private-f0eea-mobilegllatam.apiary-mock.com")! }
    
    var path: String {
        switch self {
        case .getInfo: return "list"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getInfo: return .get
        }
    }
    
    var sampleData: Data { return Data() }
        
    var task: Moya.Task {
        switch self {
        case .getInfo:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var authorizationType: AuthorizationType? {
        return nil
    }
    
}

