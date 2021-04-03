//
//  SpiritMeter.swift
//  StAugustineTestApp
//
//  Created by Sam Liu on 2021-04-03.
//

import SwiftUI

struct SpiritMeter: View {
    
    @Binding var grade:Int
    @Binding var percentage:Double
    var screenWidth:Double
    
    let pColor:Color = Color(red: 141/255, green: 18/255, blue: 48/255)
    let yColor:Color = Color(red: 216/255, green: 174/275, blue: 26/255)
    
    var body: some View {
        HStack() {
            Text(String(grade))
                .frame(idealWidth: 30, maxWidth: 30, alignment: .leading)
                .foregroundColor(pColor)
            RoundedRectangle(cornerRadius: 30)
                .frame(width: CGFloat(screenWidth * 0.55 * percentage), height: 10, alignment: .leading)
                .foregroundColor(yColor)
            Spacer()
        }
    }
}

struct SpiritMeter_Previews: PreviewProvider {
    static var previews: some View {
        SpiritMeter(grade: Binding.constant(9), percentage: Binding.constant(0.7), screenWidth: 200)
    }
}
