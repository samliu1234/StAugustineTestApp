//
//  SpiritBar.swift
//  StAugustineTestApp
//
//  Created by Sam Liu on 2021-01-26.
//

import SwiftUI

struct SpiritBar: View {
    
    @Binding var grade:Int
    @Binding var percentage:Double
    
    var body: some View {
        
        
        ZStack {
            
            GeometryReader { geometry in
            
                HStack() {
                    
                    Text(String(grade))
                        .padding(.trailing, 20)
                    RoundedRectangle(cornerRadius: 30)
                        .frame(height: 10)
                    
                }
                    
                
            }
        }
            
    }
}

struct SpiritBar_Previews: PreviewProvider {
    static var previews: some View {
        SpiritBar(grade: Binding.constant(9), percentage: Binding.constant(0.7))
    }
}
