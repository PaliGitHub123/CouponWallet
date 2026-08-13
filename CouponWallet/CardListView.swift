//
//  CardsView.swift
//  CouponWallet
//
//  Created by Pál Danyi on 24.07.26.
//

import SwiftUI

struct CardListView: View {
    
    @State var cardList = CardController.getCardList()
    
    var body: some View {
        ScrollView(.vertical){
            VStack{
                List(cardList){ item in
                    CardController().getCard()
                }
            }
        }
        
    }
}

#Preview {
    CardListView()
}
