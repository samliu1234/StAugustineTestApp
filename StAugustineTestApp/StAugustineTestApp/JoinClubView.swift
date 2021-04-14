//
//  JoinClubView.swift
//  StAugustineTestApp
//
//  Created by Sam Liu on 2021-04-14.
//

import SwiftUI

struct JoinClubView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let pColor:Color = Color(red: 141/255, green: 18/255, blue: 48/255)
    let yColor:Color = Color(red: 216/255, green: 174/275, blue: 26/255)
    @State var announcements = [["Yearbook", "Yearbook photos are going to be taken tomorrow. Remember to show up with a smile!"]]
    
    var body: some View {
        
        
        GeometryReader { geometry in
            
            VStack(spacing: 30) {
                
                // MARK: Photo at the top
                ZStack {
                    
                    Image("engineering")
                        .resizable()
                        // .scaledToFit()
                        // .ignoresSafeArea(edges: .top)
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.4)
                        .overlay(
                            Rectangle()
                                .opacity(0.4)
                                .foregroundColor(pColor)
                                // .ignoresSafeArea(edges: .top)
                        )
                    
                    Text("Engineering Club")
                        .foregroundColor(.white)
                        .font(.title)
                        .bold()
                    
                }

                
                // MARK: Announcemnts board
                VStack(spacing: 10) {
                    
                    Text("Announcement Board")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(pColor)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 10)
                    
                    AnnouncementObject(title: $announcements[0][0], text: $announcements[0][1])
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.bottom, 10)

                }
                // Properties for announcement board
                .padding(.all, 25)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.15), lineWidth: 3))
                .frame(width: geometry.size.width * 0.85)
                
                // MARK: Badges
                VStack(alignment: .leading, spacing: 20) {
                    Text("Badges")
                        .foregroundColor(pColor)
                        .font(.title3)
                        .bold()
                        .frame(width: geometry.size.width * 0.75, alignment: .leading)
                    
                    HStack {
                        Image("badge")
                            .resizable()
                            //.background(Circle().stroke(yColor, lineWidth: 5))
                            .frame(width: geometry.size.width * 0.1, height: geometry.size.width * 0.1)
                        Text("Club Badge")
                            .foregroundColor(pColor)
                            .bold()
                            .padding(.leading, 10)
                    }
                        
                }
                .padding(.all, 25)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.15), lineWidth: 3))
                .frame(width: geometry.size.width * 0.85)
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

struct JoinClubView_Previews: PreviewProvider {
    static var previews: some View {
        JoinClubView()
    }
}
