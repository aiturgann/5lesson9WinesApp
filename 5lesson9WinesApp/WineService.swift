//
//  WineService.swift
//  5lesson9WinesApp
//
//  Created by Aiturgan Kurmanbekova on 8/4/24.
//

import Foundation

class WineService {
    static let shared = WineService()
    
    func getWines(completionHandler: @escaping ([Wine]) -> Void) {
        let url = URL(string: "https://api.sampleapis.com/wines/reds")
        
        var urlRequest = URLRequest(url: url!)
        
        let urlSession = URLSession.shared
        
        urlRequest.httpMethod = "GET"
        
        let task = urlSession.dataTask(with: urlRequest) { data, response, error in
//            guard let error = error, let data = data else {
//                return
//            }
            
            if let httpResponse = response as? HTTPURLResponse {
                print(httpResponse.statusCode)
            }
            do {
                let wines = try JSONDecoder().decode([Wine].self, from: data!)
                DispatchQueue.main.async {
                    completionHandler(wines)
                }
                
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
