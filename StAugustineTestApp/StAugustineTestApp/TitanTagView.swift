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
        
        let pColor:Color = Color(red: 141/255, green: 18/255, blue: 48/255)
        let yColor:Color = Color(red: 216/255, green: 174/275, blue: 26/255)
        
        GeometryReader { geometry in
            
            VStack {
                // MARK: Title
                HStack {
                
                    Text("Titan Tag")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Spacer()
                    
                }
                .padding(.all, 25)
                .frame(width: geometry.size.width * 0.85)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(pColor, lineWidth: 8)
                )
                .background(pColor)
                .cornerRadius(20)
                .padding(.horizontal, 25)
                .padding(.bottom, 30)
                
                Image("qrcode")
                
                Text("This is your personal Titan Tag. You can get it scanned by club admins at events to get badges")
                    .foregroundColor(pColor)
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
}

struct TitanTagView_Previews: PreviewProvider {
    static var previews: some View {
        TitanTagView()
    }
}
