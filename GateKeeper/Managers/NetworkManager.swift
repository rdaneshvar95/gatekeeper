//
//  NetworkManager.swift
//  GateKeeper
//
//  Created by Ray on 01/07/22.
//

import Foundation

struct NetworkManager {
    
    func request<T: Decodable>(url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in

            if let error = error {
                completion(.failure(error))
                return
            }

            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase

            if let data = data {
                do {
                    let result = try decoder.decode(T.self, from: data)

                    DispatchQueue.main.async {
                        completion(.success(result))
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                }
            }
        })
        task.resume()
    }
}
