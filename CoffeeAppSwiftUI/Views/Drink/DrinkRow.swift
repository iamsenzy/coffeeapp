//
//  DrinkRow.swift
//  CoffeeAppSwiftUI
//
//  Created by Geszti Bence on 2021. 04. 04..
//

import SwiftUI

struct DrinkRow: View {
    var categoryName: String
    var drinks: [Drink]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
            Text(self.categoryName)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .padding([.leading], 18)
            ScrollView (.horizontal, showsIndicators: false){
                HStack(alignment: .top) {
                    ForEach (drinks, id: \.id) { drink in
                        
                        NavigationLink(
                            destination: DrinkDetail(drink: drink)
                        ) {
                            DrinkItem(drink: drink)
                                .frame(width: 300)
                                .padding(.trailing, 30)
                        }
                        .buttonStyle(FlatLinkStyle())
                    }
                }
                .padding([.leading, .top], 18)
            }
        }
    }
}

struct DrinkRow_Previews: PreviewProvider {
    static var previews: some View {
        DrinkRow(categoryName: "HOT DRINKS", drinks: drinkData)
    }
}
