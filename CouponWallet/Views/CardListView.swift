//
//  CardsView.swift
//  CouponWallet
//
//  Created by Pál Danyi on 24.07.26.
//

import SwiftUI

struct CardListView: View {
    
    //@State var cardList = CardController.getCardList()
    
    var body: some View {
            List{
                HStack{
                    Image("ikea")
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    Text("Ikea")
                }
                HStack{
                    Image("ikea")
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    Text("Ikea")
                }
            }
        
    }
}

#Preview {
    CardListView()
}


