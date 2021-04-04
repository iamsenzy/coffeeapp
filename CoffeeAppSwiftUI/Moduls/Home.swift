//
//  ContentView.swift
//  CoffeeAppSwiftUI
//
//  Created by Geszti Bence on 2021. 04. 04..
//

import SwiftUI

struct Home: View {
    
    init() {
        UITableView.appearance().showsVerticalScrollIndicator = false
    }
    
    var categories: [String: [Drink]] {
        .init(grouping: drinkData, by: { $0.category.rawValue })
    }
    
    var body: some View {
        NavigationView {
            List (categories.keys.sorted(), id: \String.self) { key in
                DrinkRow(categoryName: "\(key) Drinks".uppercased(), drinks: self.categories[key] ?? [])
                    .padding([.top, .bottom], 16)
            }
            .listStyle(SidebarListStyle())
            .navigationBarTitle("COFFEE APP")
            .padding([.leading,.trailing], -25)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
