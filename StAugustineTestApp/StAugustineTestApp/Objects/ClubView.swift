//
//  ClubView.swift
//  StAugustineTestApp
//
//  Created by Sam Liu on 2021-01-30.
//

import SwiftUI

struct ClubView: View {
    
    @Binding var clubName:String
    @Binding var imageName:String
    let tmpColor = Color(red: 211/255, green: 211/255, blue: 211/255, opacity: 0.5)
    let pColor:Color = Color(red: 141/255, green: 18/255, blue: 48/255)
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                
                
                Image(imageName)
                    .resizable()
                    .overlay(
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .foregroundColor(.clear)
                            .background(LinearGradient(gradient: Gradient(colors: [Color.clear, tmpColor]), startPoint: .top, endPoint: .bottom))
                        )
                    .cornerRadius(20)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(pColor, lineWidth: 3)
                    )
                    .frame(height: 175)
                    
                
                Text(clubName)
                    .foregroundColor(.white)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .offset(x: 25, y: 50)
                
            }
        }
        .frame(height: 175)
    }
    
}

struct ClubView_Previews: PreviewProvider {
    static var previews: some View {
        ClubView(clubName: Binding.constant("Computer Science Club"), imageName: Binding.constant("computerScience"))
    }
}
