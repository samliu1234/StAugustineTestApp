//
//  CafeItem.swift
//  StAugustineTestApp
//
//  Created by Sam Liu on 2021-01-26.
//

import SwiftUI

struct CafeItem: View {
    @Binding var imageName:String
    @Binding var item:String
    @Binding var price:Double
    
    let pColor:Color = Color(red: 141/255, green: 18/255, blue: 48/255)
    let tmpColor = Color(red: 211/255, green: 211/255, blue: 211/255, opacity: 0.7)
    
    var body: some View {
        
        ZStack {
            
            Image(imageName)
                .resizable()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(pColor, lineWidth: 3)
                        .foregroundColor(.clear)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.clear, tmpColor]), startPoint: .top, endPoint: .bottom))
                        
                    )
                .cornerRadius(10)
                
            VStack {
                Spacer()
                
                Text(item)
                    .foregroundColor(.white)
                    .bold()
                    .font(.system(size: 8))
                
                Text(String(format: "%.02f", price))
                    .foregroundColor(.white)
                    .bold()
                    .font(.system(size: 8))
                    .padding(.bottom, 10)
            }
                
        }
    
    }
}

struct CafeItem_Previews: PreviewProvider {
    static var previews: some View {
        CafeItem(imageName: Binding.constant("rotini_pasta"), item: Binding.constant("Rotini Pasta"), price: Binding.constant(4.50))
    }
}
