//
//  SongRequestView.swift
//  StAugustineTestApp
//
//  Created by Matthew Morelli on 2020-10-25.
//

import SwiftUI

struct SongRequestView: View {
    var body: some View {
        
        let pColor:Color = Color(red: 141/255, green: 18/255, blue: 48/255)
        let yColor:Color = Color(red: 216/255, green: 174/275, blue: 26/255)
        
        ScrollView {
            
            VStack {
                
                // MARK: Title block
                HStack {
                    
                    // Welcome text
                    VStack(alignment: .leading, spacing: 15) {
                        
                        HStack {
                        
                            Text("Song Requests")
                                .font(.title)
                                .bold()
                                .foregroundColor(.white)
                                .fixedSize(horizontal: false, vertical: true)
                            
                            Spacer()
                            
                        }
                        
                    }
                    
                }
                
                // Properties for welcome block
                .padding(.all, 25)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(pColor, lineWidth: 8)
                )
                .background(pColor)
                .cornerRadius(20)
                .padding([.horizontal, .top], 25)
                
            }
            
            // MARK: Add song and song request
            VStack(alignment: .leading, spacing: 20) {
                
                // Add song button
                Button(action: {
                    print("Add song")
                }, label: {
                    
                    HStack {
                        Spacer()
                        Text("Add Song")
                            .foregroundColor(.white)
                            .bold()
                        Spacer()
                    }
                    .padding(.all, 10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(yColor, lineWidth: 0.75)
                    )
                    .background(yColor)
                    .cornerRadius(25)
                    
                })
                
                // MARK: Individual song request
                
                GeometryReader { geometry in
                
                    // Song request
                    HStack(spacing: 0) {
                    
                        Button(action: {
                            print("up clicked")
                        }, label: {
                            
                            VStack {
                                Image(systemName: "chevron.up")
                                    .foregroundColor(.white)
                                    .padding(.bottom, 7)
                                Text("37")
                                    .foregroundColor(.white)
                            }
                        })
                        .frame(width: 0.3 * geometry.size.width)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text("What Makes You Beautiful")
                                .font(.system(size: 13))
                                .bold()
                                .foregroundColor(pColor)
                            Text("By: One Direction")
                                .font(.system(size: 10))
                                .font(.body)
                                .foregroundColor(pColor)
                        }
                        .frame(width: 0.7 * geometry.size.width)
                        
                    }
                    .background(pColor)
                    
                }

            }
            
            // Properties for song requests
            .padding(.all, 25)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.15), lineWidth: 4))
            .padding(.all, 25)
            
        }
        
    }
}

struct SongRequestView_Previews: PreviewProvider {
    static var previews: some View {
        SongRequestView()
    }
}
