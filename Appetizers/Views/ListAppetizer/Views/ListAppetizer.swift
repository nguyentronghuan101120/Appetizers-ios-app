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
                        AppetizerCell(item: item).onTapGesture {
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
