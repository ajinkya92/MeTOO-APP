//
//  HarrasmentLawService.swift
//  MeTOO APP
//
//  Created by Ajinkya Sonar on 29/10/18.
//  Copyright © 2018 Ajinkya Sonar. All rights reserved.
//

import Foundation

class HarrasmentLawService {
    
    static let instance = HarrasmentLawService()
    
    
    func getHarrasmentLawData(withUrl url: String, completion: @escaping (_ success: Bool, HarrasmentLaws?) -> ()) {
        
        guard let url = URL(string: url) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                debugPrint(error?.localizedDescription ?? "")
                completion(false, nil)
                return
            } else {
                
                guard let data = data else {return completion(false, nil)}
                let decoder = JSONDecoder()
                
                do{
                    let harrasmentLawJson = try decoder.decode(HarrasmentLaws.self, from: data)
                    completion(true, harrasmentLawJson)
                } catch{
                    debugPrint(error.localizedDescription)
                    completion(false, nil)
                    return
                }
                
            }
            
            
        }.resume()
        
    }
    
}
