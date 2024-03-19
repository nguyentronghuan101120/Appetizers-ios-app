

import Foundation

enum NetworkError : Error{
    case invalidUrl(message: String)
     case invalidResponse(message: String)
     case invalidData(message: String)
     case unableToComplete(message: String)
    
    var errorDescription: String? {
           switch self {
           case .invalidUrl(let message):
               return message
           case .invalidResponse(let message):
               return message
           case .invalidData(let message):
               return message
           case .unableToComplete(let message):
               return message
           }
       }
    
}
