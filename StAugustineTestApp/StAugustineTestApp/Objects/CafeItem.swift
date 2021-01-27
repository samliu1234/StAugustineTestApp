//
//  CafeItem.swift
//  StAugustineTestApp
//
//  Created by Sam Liu on 2021-01-26.
//

import SwiftUI

struct CafeItem: View {
    @Binding var item:String
    @Binding var price:Double
    
    
    var body: some View {
        
        let pColor:Color = Color(red: 141/255, green: 18/255, blue: 48/255)
        
        VStack(alignment: .leading, spacing: 10) {
            
            Text(item)
                .bold()
                .foregroundColor(pColor)
            
            Text(String(format: "%.2f", price))
                .font(.body)
                .foregroundColor(pColor)
    
        }
        
        .padding(.all)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(pColor, lineWidth: 0.75))
    }
}

struct CafeItem_Previews: PreviewProvider {
    static var previews: some View {
        CafeItem(item: Binding.constant("Pizza"), price: Binding.constant(4.50))
    }
}
