//
//  AccountView.swift
//  Appetizers
//
//  Created by User on 15/03/2024.
//

import SwiftUI

struct AccountView: View {
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var birthDate = Date()
    @State private var extraNapkins = false
    @State private var frequentRefills = false
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Personal Info")) {
                   TextField("First name",text: $firstName)
                    
                    TextField("Last name",text: $lastName)
                    
                    TextField("Email",text: $email).keyboardType(.emailAddress).autocapitalization(.none).disableAutocorrection(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
                    
                    DatePicker("Birthday", selection: $birthDate,displayedComponents: .date)
                    
                    Button{
                        
                    } label: {
                        Text("Save changes")
                    }
                }
                
                Section(header: Text("Requests")) {
                    Toggle("Extra Napkins", isOn:$extraNapkins )
                    Toggle("Frequent Refills", isOn:$frequentRefills )

                }
            }
            .navigationTitle("Account")
        }
    }
}

#Preview {
    AccountView()
}
