//
//  DrinkDetail.swift
//  CoffeeAppSwiftUI
//
//  Created by Geszti Bence on 2021. 04. 04..
//

import SwiftUI

struct DrinkDetail: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var drink: Drink
    
    var btnBack : some View { Button(action: {
            self.presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                Image(systemName: "arrow.left")
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    Text("Go back")
                        .foregroundColor(.white)
                }
            }
    }
    
    var body: some View {
        ScrollView {
            ZStack (alignment: .bottom) {
                Image(drink.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Rectangle()
                    .foregroundColor(.black)
                    .frame(height: 80)
                    .opacity(0.35)
                    .blur(radius: 10)
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(drink.name)
                            .foregroundColor(.white)
                            .font(.largeTitle)
                    }
                    .padding([.leading, .bottom])
                    Spacer()
                }
            }
            Text(drink.description)
                .foregroundColor(.primary)
                .font(.body)
                .lineLimit(nil)
                .lineSpacing(12)
                .padding(14)
            Spacer()
        }
        .edgesIgnoringSafeArea(.top)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
    }
}

struct DrinkDetail_Previews: PreviewProvider {
    static var previews: some View {
        DrinkDetail(drink: drinkData[0])
    }
}
