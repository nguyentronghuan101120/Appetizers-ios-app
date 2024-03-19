//
//  AppButton.swift
//  TodoIOSApp
//
//  Created by User on 19/03/2024.
//

import SwiftUI

struct AppButton: View {
    let action: () -> Void
    let title: String
    var body: some View {
        Button(action: action, label: {
            Text(title).font(.title3).fontWeight(.semibold).frame(width: 260,height: 50).foregroundColor(.white).background(.brandPrimary).cornerRadius(8)
        }).padding(.bottom, 30)
    }
}

#Preview {
    AppButton (action: {
        
    }, title: "String")
}
