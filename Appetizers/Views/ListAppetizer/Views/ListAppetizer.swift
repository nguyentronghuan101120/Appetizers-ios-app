//
//  ListView.swift
//  Appetizers
//
//  Created by User on 15/03/2024.
//

import SwiftUI

struct ListAppetizer: View {
    
    @StateObject private var viewModel: ListAppetizerViewModel = ListAppetizerViewModel()
    
    @State var isShowDetail: Bool = false
    @State var appetizerPicked: AppetizerData = MockData.sampleAppetizer
    

    
    var body: some View {
        NavigationView{
            switch viewModel.viewStatus {
           
            case .loading:
                ProgressView()
            case .success:
                ZStack{
                    List(viewModel.listAppetizer){
                        item in
                        HStack{
                            NetworkImage(urlString: item.imageURL).frame(width: 120,height: 90).cornerRadius(8)
                            VStack(alignment: .leading, spacing: 5) {
                                Text(item.name)
                                    .font(.title2)
                                    .fontWeight(.medium)
                                
                                Text("$\(item.price, specifier: "%.2f")")
                                    .foregroundColor(.secondary)
                                    .fontWeight(.semibold)
                            }
                            .padding(.leading)
                        }.onTapGesture {
                            isShowDetail = true
                            appetizerPicked = item
                        }
                    }.navigationTitle("Appetizers").blur(radius: isShowDetail ? 5: 0).disabled(isShowDetail)
                    
                    if isShowDetail{
                        AppetizerDetailView(isShowDetail: $isShowDetail, appetizer: appetizerPicked)
                    }
                }
            case .failure:
                Text(viewModel.errorMessage)
            case .initial:
                Spacer()
            }
        }.onAppear(){
            viewModel.getListAppetizer()
        }
    }
}

#Preview {
    ListAppetizer(appetizerPicked: MockData.sampleAppetizer)
}
