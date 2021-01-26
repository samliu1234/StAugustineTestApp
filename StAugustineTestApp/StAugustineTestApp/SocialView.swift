//
//  SocialView.swift
//  StAugustineTestApp
//
//  Created by Matthew Morelli on 2020-10-25.
//

import SwiftUI

struct SocialView: View {
    
    let pColor:Color = Color(red: 141/255, green: 18/255, blue: 48/255)
    
    var body: some View {
        ScrollView {
            
            GeometryReader { geometry in
            
                VStack(alignment: .leading, spacing: 30) {
                    
                    // MARK: Title
                    HStack {
                    
                        Text("Socials")
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Spacer()
                        
                    }
                    .padding(.all, 25)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(pColor, lineWidth: 8)
                    )
                    .background(pColor)
                    .cornerRadius(20)
                    .padding([.horizontal, .top], 25)
                    
                    // MARK: Main body
                    VStack() {
                        
                        Text("My clubs")
                            .foregroundColor(pColor)
                            .bold()
                        
                        
                        Image(systemName: "heart.fill")

                        
                    }
                    // Properties for song requests
                    .frame(width: 0.7 * geometry.size.width, alignment: .center)
                    .padding(.all, 25)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.15), lineWidth: 4))
                    .padding(.all, 25)
                    
                }
            }
        }
    }
}

struct SocialView_Previews: PreviewProvider {
    static var previews: some View {
        SocialView()
    }
}
