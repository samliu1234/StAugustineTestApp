//
//  AnnouncementObject.swift
//  StAugustineTestApp
//
//  Created by Sam Liu on 2021-04-03.
//

import SwiftUI

struct AnnouncementObject: View {
    
    @Binding var title: String
    @Binding var text: String
    
    let pColor:Color = Color(red: 141/255, green: 18/255, blue: 48/255)
    
    var body: some View {
        VStack {
            
            Text(title)
                .bold()
                .foregroundColor(pColor)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 7)
            
            Text(text)
                .font(.body)
                .foregroundColor(pColor)
                .frame(maxWidth: .infinity, alignment: .leading)
            
        }
        .padding(.all)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(pColor, lineWidth: 0.75))
    }
}

struct AnnouncementObject_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementObject(title: Binding.constant("Basketball team"), text: Binding.constant("Tryouts start tomorrow everyone! Come out and show us what you got!"))
    }
}
