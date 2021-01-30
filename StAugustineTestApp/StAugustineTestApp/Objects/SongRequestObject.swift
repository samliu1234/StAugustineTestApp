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
    @Binding var highlight: Bool
    
    var body: some View {
        
        let pColor:Color = Color(red: 141/255, green: 18/255, blue: 48/255)
        
        GeometryReader { geometry in
        
            // Song request
            HStack (spacing: 0) {
            
                Button(action: {
                    print("up clicked")
                }, label: {
                    
                    VStack(spacing: 0) {
                        if highlight {
                            Image(systemName: "chevron.up")
                                .foregroundColor(.yellow)
                                .padding(.bottom, 8)
                                .font(.system(size: 17))
                        }
                        else {
                            Image(systemName: "chevron.up")
                                .foregroundColor(.white)
                                .padding(.bottom, 8)
                                .font(.system(size: 17))
                        }
                        Text(String(votes))
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                    }
                })
                .frame(width: 0.25 * geometry.size.width)
                .padding(.vertical, 15)
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text(songName)
                        .font(.system(size: 15))
                        .bold()
                        .foregroundColor(pColor)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 20)
                        .padding(.top, 10)
                    
                    Text(songAuthor)
                        .font(.system(size: 10))
                        .font(.body)
                        .foregroundColor(pColor)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 20)
                        .padding(.bottom, 10)
                    
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
        .frame(height: 90) // Super important to set the height of the GeometryReader
        
    }
}

struct SongRequestObject_Previews: PreviewProvider {
    static var previews: some View {
        SongRequestObject(songName: Binding.constant("What Makes You Beautiful"), songAuthor: Binding.constant("One Direction"), votes: Binding.constant(37), highlight: Binding.constant(true))
    }
}
