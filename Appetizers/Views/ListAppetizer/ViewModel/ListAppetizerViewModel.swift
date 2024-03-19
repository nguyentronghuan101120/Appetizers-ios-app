//
//  ListAppetizerViewModel.swift
//  Appetizers
//
//  Created by User on 19/03/2024.
//

import Foundation

final class ListAppetizerViewModel: ObservableObject{
    
    @Published var viewStatus: ViewStatusEnum = ViewStatusEnum.initial
    @Published var listAppetizer: [AppetizerData] = []
    @Published var errorMessage: String = ""
    
    func getListAppetizer(){
        
        viewStatus = ViewStatusEnum.loading
        
        NetworkManager.shared.getListAppetizer{result in
            switch result{
            case .success(let data):
                self.listAppetizer = data
                self.viewStatus = ViewStatusEnum.success
            case .failure(let error):
                self.errorMessage = error.errorDescription ?? ""
                self.viewStatus = ViewStatusEnum.failure
            }
        }
        
    }
}
