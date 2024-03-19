//
//  NetworkManager.swift
//  Appetizers
//
//  Created by User on 19/03/2024.
//

import Foundation
import UIKit

struct NetworkManager{
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseUrl = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    
    private let getAppetizerUrl = baseUrl + "appetizers"
    
    
    func getListAppetizer(completed: @escaping (Result<[AppetizerData], NetworkError>) -> Void){
        guard let url = URL(string: getAppetizerUrl) else{
            completed(.failure(.invalidUrl(message: "Invalid URL")))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){
            data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete(message: error?.localizedDescription ?? "")))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
                completed(.failure(.invalidResponse(message: error?.localizedDescription ?? "")))
                return
            }
            
            guard let data = data else{
                completed(.failure(.invalidData(message: error?.localizedDescription ?? "")))
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
                
                completed(.success(decodedResponse.request))
                
                
            }
            
            catch{
                completed(.failure(.invalidData(message: error.localizedDescription )))
            }
        }
        
        task.resume()
    }
    
    func downloadedImage(fromURLString: String, completed: @escaping (UIImage?) -> Void){
        let cacheKey = NSString(string: fromURLString)
        
        if let image = cache.object(forKey: cacheKey)
        {
            completed(image)
            return
        }
        
        guard let url = URL(string: fromURLString) else{
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){
            data, response, error in
            guard let data = data, let image = UIImage(data: data) else{
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume()
    
    }

}
