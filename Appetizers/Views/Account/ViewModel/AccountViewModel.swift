//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by User on 20/03/2024.
//

import Foundation
import SwiftUI

final class AccountViewModel: ObservableObject{
    
    @AppStorage("user") private var userData: Data?
    
    @Published  var user = UserModel()
    @Published var alertItem : AlertItem?
    
    var isValidForm: Bool{
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else{
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard user.email.isValidEmail else{
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        
        
        return true
    }
    
    func saveChanged(){
        guard isValidForm else{return}
        
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.userSaveSuccess
        }
        catch{
            alertItem = AlertContext.invalidUserData
        }
    }
    
    func retrieveUser(){
        guard let userData = userData else{return}
        
        do {
            user = try JSONDecoder().decode(UserModel.self, from: userData)
        }
        catch{
            alertItem = AlertContext.invalidUserData
        }
    }
}
