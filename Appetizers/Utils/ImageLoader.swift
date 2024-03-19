//
//  RemoteImage.swift
//  Appetizers
//
//  Created by User on 19/03/2024.
//

import Foundation
import SwiftUI

final class ImageLoader: ObservableObject{
   @Published var image: Image? = nil
    
    func load(fromURLString urlString: String){
        NetworkManager.shared.downloadedImage(fromURLString: urlString) { uiImage in
            guard let uiImage = uiImage else {return}
            
            DispatchQueue.main.async{
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}
