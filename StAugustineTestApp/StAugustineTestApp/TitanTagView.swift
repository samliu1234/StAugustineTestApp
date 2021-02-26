//
//  TitanTagView.swift
//  StAugustineTestApp
//
//  Created by Sam Liu on 2021-02-26.
//

import SwiftUI

struct TitanTagView: View {
    
    let yColor:Color = Color(red: 216/255, green: 174/275, blue: 26/255)
    
    var body: some View {
        
        NavigationView {
            
            
            VStack {
            
                NavigationLink(destination: SocialView()) {
                    
                    HStack {
                        Image(systemName: "chevron.left")
                            .foregroundColor(yColor)
                            .font(.system(size: 20))
                        Text("Back")
                            .foregroundColor(yColor)
                            .font(.system(size: 20))
                        Spacer()
                    }
                    .padding(.leading, 30)
                    
                }
                
                Image("qrcode")
                
                Text("This is your personal Titan Tag. You can get it scanned by club admins at events to get badges")
                    .multilineTextAlignment(.center)
                    .padding()
                
            }
            
        }
        .navigationBarTitle("")
                        .navigationBarHidden(true)
    }
}

struct TitanTagView_Previews: PreviewProvider {
    static var previews: some View {
        TitanTagView()
    }
}
