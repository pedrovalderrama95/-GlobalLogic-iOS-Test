//
//  APIRequestable.swift
//  GlobalLogicTest
//
//  Created by Pedro Valderrama on 01/06/2022.
//

import Foundation
import Moya
import Alamofire
import UIKit

protocol APIRequestable: AnyObject {
    associatedtype Service: TargetType
    var provider: MoyaProvider<Service> { get }
}

extension APIRequestable {
    
    var isReachable: Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
    
    /// Endpoints with data on success
    func request<T : Decodable>(target: Service,
                                model: T.Type,
                                progress: ProgressBlock? = .none,
                                callback: @escaping (Swift.Result<T, Error>) -> Void)  {
        
        guard isReachable else {
            callback(.failure(GLError.noConnection))
            return
        }
        
        self.provider.request(target, progress: progress) { result in
            switch result {
            case let .success(response):
                do {
                    let decoder = JSONDecoder()
                    let decodedModel = try decoder.decode(model.self, from: response.data)
                    print("Provider decoding succesfully: \(decodedModel)")
                    callback(.success(decodedModel))
                } catch {
                    print("Provider decoding failure: \(error.localizedDescription)")
                    callback(.failure(error))
                }
            case let .failure(error):
                callback(.failure(error))
            }
        }
    }
    
}
