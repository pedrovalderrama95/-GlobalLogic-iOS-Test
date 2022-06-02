//
//  ItemList.swift
//  GlobalLogicTest
//
//  Created by Pedro Valderrama on 01/06/2022.
//

import Foundation
import UIKit

struct ItemList: Equatable, Codable {
    let title: String?
    let description: String?
    let image: URL?
    
    enum CodingKeys: String, CodingKey {
        case title
        case description
        case image
    }
    
}
