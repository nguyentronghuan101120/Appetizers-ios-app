//
//  AccountView.swift
//  Appetizers
//
//  Created by User on 15/03/2024.
//

import SwiftUI

struct AccountView: View {
    
   @StateObject var viewModel = AccountViewModel()
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Personal Info")) {
                    TextField("First name",text: $viewModel.user.firstName)
                    
                    TextField("Last name",text: $viewModel.user.lastName)
                    
                    TextField("Email",text: $viewModel.user.email).keyboardType(.emailAddress).autocapitalization(.none).disableAutocorrection(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
                    
                    DatePicker("Birthday", selection: $viewModel.user.birthDate,displayedComponents: .date)
                    
                    Button{
                        viewModel.saveChanged()
                    } label: {
                        Text("Save changes")
                    }
                }
                
                Section(header: Text("Requests")) {
                    Toggle("Extra Napkins", isOn:$viewModel.user.extraNapkins )
                    Toggle("Frequent Refills", isOn:$viewModel.user.frequentRefills )

                }
            }
            .navigationTitle("Account")
        
        }.onAppear(){
            viewModel.retrieveUser()
        }
        .alert(item: $viewModel.alertItem){
            item in
            Alert(title: item.title,message: item.message,dismissButton: item.dismissButton)
        }
    }
}

#Preview {
    AccountView()
}
