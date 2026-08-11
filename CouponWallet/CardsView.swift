//
//  CardsView.swift
//  CouponWallet
//
//  Created by Pál Danyi on 24.07.26.
//

import SwiftUI

struct CardsView: View {
    var body: some View {
        ScrollView(.vertical){
            VStack{
                Card(image: "ikea")
                Card(image: "ikea")
            }
        }
        
    }
}

#Preview {
    CardsView()
}
