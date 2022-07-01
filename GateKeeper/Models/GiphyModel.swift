//
//  GiphyModel.swift
//  GateKeeper
//
//  Created by Ray on 01/07/22.
//

import Foundation

struct GiphyModel: Decodable {

    let author: String
    let title: String
    let url: String
    
    enum OuterKeys: String, CodingKey {
        case data
    }
    
    enum DataKeys: String, CodingKey {
        case user
        case title
        case images
    }
    
    enum UserKeys: String, CodingKey {
        case displayName
    }
    
    enum ImagesKeys: String, CodingKey {
        case downsized
    }
    
    enum DownsizedKeys: String, CodingKey {
        case url
    }
    
    init(from decoder: Decoder) throws {
        let outerContainer = try decoder.container(keyedBy: OuterKeys.self)
        let dataContainer = try outerContainer.nestedContainer(keyedBy: DataKeys.self, forKey: .data)
        let userContainer = try dataContainer.nestedContainer(keyedBy: UserKeys.self, forKey: .user)
        let imagesContainer = try dataContainer.nestedContainer(keyedBy: ImagesKeys.self, forKey: .images)
        let downsizedContainer = try imagesContainer.nestedContainer(keyedBy: DownsizedKeys.self, forKey: .downsized)

        self.author = try userContainer.decode(String.self, forKey: .displayName)
        self.title = try dataContainer.decode(String.self, forKey: .title)
        self.url = try downsizedContainer.decode(String.self, forKey: .url)
      }
}
