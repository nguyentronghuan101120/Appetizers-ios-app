//
//  File.swift
//  Appetizers
//
//  Created by User on 20/03/2024.
//

import Foundation

struct UserModel : Codable{
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthDate = Date()
    var extraNapkins = false
    var frequentRefills = false

}
