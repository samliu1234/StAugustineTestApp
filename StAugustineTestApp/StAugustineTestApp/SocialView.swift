//
//  SocialView.swift
//  StAugustineTestApp
//
//  Created by Matthew Morelli on 2020-10-25.
//

import SwiftUI

struct SocialView: View {
    
    let pColor:Color = Color(red: 141/255, green: 18/255, blue: 48/255)
    let yColor:Color = Color(red: 216/255, green: 174/275, blue: 26/255)
    @State var clubNames:[String] = ["Computer Science Club", "Engineering Club"]
    @State var imageNames:[String] = ["computerScience", "engineering"]
    
    var body: some View {
        
        NavigationView {
            GeometryReader { geometry in
                
                ScrollView {
                
                    VStack(alignment: .center, spacing: 10) {
                        
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
                        VStack(alignment: .leading, spacing: 30) {
                          
                            Text("My clubs")
                                .foregroundColor(pColor)
                                .bold()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.white)
                            
                            ClubView(clubName: $clubNames[0], imageName: $imageNames[0])
                            
                            ClubView(clubName: $clubNames[1], imageName: $imageNames[1])
                            
                            Button(action: {
                                print("New club")
                            }, label: {
                                HStack {
                                    Spacer()
                                    Text("Join Club")
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
                            
                        }
                        // Properties for song requests
                        .frame(width: 0.7 * geometry.size.width, alignment: .center)
                        .padding(.all, 25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.15), lineWidth: 4))
                        .padding(.all, 25)
                        
                        // MARK: Titan tag
                        HStack(spacing: 20) {
                            
                            Text("Titan tag")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(pColor)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.bottom, 10)
                            
                            Spacer()
                            
                            NavigationLink(destination: TitanTagView()) {
                                Image(systemName: "arrow.right")
                                    .foregroundColor(yColor)
                            }
                            
                        }
                        .frame(width: 0.7 * geometry.size.width, alignment: .center)
                        .padding(.all, 25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.15), lineWidth: 4))
                        .padding(.horizontal, 25)
                        
                    }
                }
            }
        }
        //.navigationBarTitle("")
        //.navigationBarHidden(true)
    }
}

struct SocialView_Previews: PreviewProvider {
    static var previews: some View {
        SocialView()
    }
}
