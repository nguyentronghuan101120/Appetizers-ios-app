//
//  NetworkImage.swift
//  Appetizers
//
//  Created by User on 19/03/2024.
//

import SwiftUI

struct NetworkImage: View {
    
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        (imageLoader.image?.resizable() ?? Image("food-placeholder").resizable()).aspectRatio(contentMode: .fit).onAppear(){
            imageLoader.load(fromURLString: urlString)
        }
    }
}



#Preview {
    NetworkImage(urlString: "https://seanallen-course-backend.herokuapp.com/images/appetizers/chicken-wings.jpg")
}
