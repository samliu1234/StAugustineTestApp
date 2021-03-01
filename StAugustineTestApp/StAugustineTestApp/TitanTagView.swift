//
//  TitanTagView.swift
//  StAugustineTestApp
//
//  Created by Sam Liu on 2021-02-26.
//

import SwiftUI

struct TitanTagView: View {
    @Environment(\.presentationMode) var presentationMode
    let yColor:Color = Color(red: 216/255, green: 174/275, blue: 26/255)
    
    var body: some View {
            
            
        VStack {
            
            Image("qrcode")
            
            Text("This is your personal Titan Tag. You can get it scanned by club admins at events to get badges")
                .multilineTextAlignment(.center)
                .padding()
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image(systemName: "chevron.left")
                        .foregroundColor(yColor)
                        .font(.system(size: 20))
                    Text("Back")
                        .foregroundColor(yColor)
                        .font(.system(size: 20))
                }
            }
        )
            
    }
}

struct TitanTagView_Previews: PreviewProvider {
    static var previews: some View {
        TitanTagView()
    }
}
