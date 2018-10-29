//
//  TwitterFeedService.swift
//  MeTOO APP
//
//  Created by Ajinkya Sonar on 29/10/18.
//  Copyright © 2018 Ajinkya Sonar. All rights reserved.
//

import Foundation

class TwitterFeedService {
    
    static let instance = TwitterFeedService()
    
    
    func getTwitterFeeds(withUrl url: String, completion: @escaping (_ success: Bool, TwitterFeed?) -> ()) {
        
        guard let url = URL(string: url) else {return}
        
        var urlRequest = URLRequest(url: url)
        
        urlRequest.addValue("api_key", forHTTPHeaderField: "NNKOjkoul8n1CH18TWA9gwngW1s1SmjESPjNoUFo")
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            if error != nil {
                debugPrint(error?.localizedDescription ?? "")
                completion(false, nil)
                return
            } else {
                
                guard let data = data else {return completion(false, nil)}
                let decoder = JSONDecoder()
                
                do{
                    let twitterFeedJson = try decoder.decode(TwitterFeed.self, from: data)
                    completion(true, twitterFeedJson)
                } catch{
                    debugPrint(error.localizedDescription)
                    completion(false, nil)
                    return
                }
                
                
            }
            
        }.resume()
        
        
    }
    
}
