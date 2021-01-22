//
//  SongRequestObject.swift
//  StAugustineTestApp
//
//  Created by Sam Liu on 2021-01-21.
//

import SwiftUI

struct SongRequestObject: View {
    
    @Binding var songName:String
    @Binding var songAuthor:String
    @Binding var votes:Int
    
    var body: some View {
        
        let pColor:Color = Color(red: 141/255, green: 18/255, blue: 48/255)
        
        GeometryReader { geometry in
        
            // Song request
            HStack {
            
                Button(action: {
                    print("up clicked")
                }, label: {
                    
                    VStack(spacing: 0) {
                        Image(systemName: "chevron.up")
                            .foregroundColor(.white)
                            .padding(.bottom, 8)
                            .font(.system(size: 10))
                        Text(String(votes))
                            .foregroundColor(.white)
                            .font(.system(size: 15))
                    }
                })
                .frame(width: 0.25 * geometry.size.width)
                .padding(.vertical, 15)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(songName)
                        .font(.system(size: 10))
                        .bold()
                        .foregroundColor(pColor)
                    Text(songAuthor)
                        .font(.system(size: 8))
                        .font(.body)
                        .foregroundColor(pColor)
                }
                .frame(width: 0.75 * geometry.size.width)
                .padding(.vertical, 15)
                .background(Color.white)
                
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(pColor, lineWidth: 4)
                )
                
                
                
                
            }
            .background(pColor)
            .cornerRadius(10)
        
            
        }
        
    }
}

struct SongRequestObject_Previews: PreviewProvider {
    static var previews: some View {
        SongRequestObject(songName: Binding.constant("Wrecking Ball"), songAuthor: Binding.constant("Miley Cyrus"), votes: Binding.constant(37))
    }
}
