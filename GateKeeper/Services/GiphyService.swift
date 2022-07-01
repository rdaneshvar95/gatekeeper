//
//  GiphyService.swift
//  GateKeeper
//
//  Created by Ray on 01/07/22.
//

import Foundation

struct GiphyService {
    
    private let networkManager = NetworkManager()
    
    private let baseURL = "https://api.giphy.com/v1/gifs/"
    private let apiKey = "sdi88mQdyVhTGzfI5NyFwmXoQ8awIScy"

    func getRandom(completion: @escaping (Result<GiphyModel, Error>) -> Void) {
        let endpoint = "random"

        var queryItems: [URLQueryItem] = []
        queryItems.append(URLQueryItem(name: "api_key", value: apiKey))

        var components = URLComponents(string: baseURL + endpoint)!
        components.queryItems = queryItems

        networkManager.request(url: components.url!, completion: completion)
    }
}
