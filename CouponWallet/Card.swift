//
//  Card.swift
//  CouponWallet
//
//  Created by Pál Danyi on 11.08.26.
//

import SwiftUI

struct Card: View {
    
    let image: UIImage
    //let cardColor: String
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25)
                .fill(.yellow)
                .frame(width: 360, height: 509)
                .scaledToFit()
            Image(uiImage: image)
                .resizable()
                //.scaledToFill()
                //.frame(width: 400, height: 300)
                //.cornerRadius(30)
                .clipShape(.rect(cornerRadius: 25))
                .frame(width: 330, height: 466)
        }
    }
}

/*#Preview {
    Card(image: "ikea")
}*/
