//
//  CircleDimissButton.swift
//  TodoIOSApp
//
//  Created by User on 19/03/2024.
//

import SwiftUI

struct CircleDismissButton: View {
    
    var action: () -> Void
    var body: some View {
        Button(action: {
            action()
        }, label: {
            ZStack{
                Circle().frame(width: 30,height: 30).foregroundColor(.white).opacity(0.6)
                
                Image(systemName: "xmark").imageScale(.small).frame(width: 44,height: 44).foregroundColor(.black)
            }
        })
    }
}

#Preview {
    CircleDismissButton{}
}
