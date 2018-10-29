//
//  HarrasmentLaws.swift
//  MeTOO APP
//
//  Created by Ajinkya Sonar on 29/10/18.
//  Copyright © 2018 Ajinkya Sonar. All rights reserved.
//

// To parse the JSON, add this file to your project and do:
//
//   let harrasmentLaws = try? newJSONDecoder().decode(HarrasmentLaws.self, from: jsonData)

import Foundation

typealias HarrasmentLaws = [HarrasmentLaw]

struct HarrasmentLaw: Codable {
    let id, title, description: String
    let image, thumbImage: String
    
    enum CodingKeys: String, CodingKey {
        case id, title, description, image
        case thumbImage = "thumb_image"
    }
}
