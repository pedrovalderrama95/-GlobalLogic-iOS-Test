//
//  GLError.swift
//  GlobalLogicTest
//
//  Created by Pedro Valderrama on 01/06/2022.
//

import Foundation

//Global Logic Error
enum GLError: LocalizedError {
    case noConnection

    var errorDescription: String? {
        switch self {
        case .noConnection: return GLError.kNoConnection
        }
    }
}

extension GLError {
    static let kNoConnection = "Unable to connect to the internet."
}
