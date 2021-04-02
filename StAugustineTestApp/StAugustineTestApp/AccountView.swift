//
//  AccountView.swift
//  StAugustineTestApp
//
//  Created by Matthew Morelli on 2020-10-25.
//

import SwiftUI

struct AccountView: View {
    
    let pColor:Color = Color(red: 141/255, green: 18/255, blue: 48/255)
    let yColor:Color = Color(red: 216/255, green: 174/275, blue: 26/255)
    
    var body: some View {
        
        GeometryReader { geometry in
        
            NavigationView {
                
                ScrollView {
                    
                    VStack {
                        
                        // MARK: Navigation to settings page
                        HStack {
                            Spacer()
                                
                            // Button that leads to settings, need to program
                            NavigationLink(destination: SettingsView()) {
                                Image(systemName: "gearshape.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 20))
                            }
                        }
                        
                        // MARK: Profile picture
                        Image("profile_picture")
                            .resizable()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(yColor, lineWidth: 5))
                            .frame(width: geometry.size.width * 0.4, height: geometry.size.width * 0.4)

                        // MARK: User text
                        Text("John Doe")
                            .bold()
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(.top)
                            .padding(.bottom, 3)
                        
                        Text("john.doe21@ycdsbk12.ca")
                            .foregroundColor(.white)
                    
                    }
                    .padding(50)
                    .background(pColor)
                    .padding(.bottom, 20)
                    
                    VStack(alignment: .leading, spacing: 17) {
                        Text("Course Timetable")
                            .foregroundColor(pColor)
                            .font(.title3)
                            .bold()
                            .frame(width: geometry.size.width * 0.75, alignment: .leading)
                            .padding(.bottom, 10)
                        Text("English")
                            .foregroundColor(pColor)
                            .padding(10)
                            .padding(.leading, 15)
                            .frame(width: geometry.size.width * 0.75, alignment: .leading)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(pColor, lineWidth: 1)
                            )
                        Text("Math")
                            .foregroundColor(pColor)
                            .padding(10)
                            .padding(.leading, 15)
                            .frame(width: geometry.size.width * 0.75, alignment: .leading)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(pColor, lineWidth: 1)
                            )
                        Text("Law")
                            .foregroundColor(pColor)
                            .padding(10)
                            .padding(.leading, 15)
                            .frame(width: geometry.size.width * 0.75, alignment: .leading)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(pColor, lineWidth: 1)
                            )
                        Text("Dance")
                            .foregroundColor(pColor)
                            .padding(10)
                            .padding(.leading, 15)
                            .frame(width: geometry.size.width * 0.75, alignment: .leading)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(pColor, lineWidth: 1)
                            )
                            
                    }
                    .padding(.all, 25)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.15), lineWidth: 4))
                    .frame(width: geometry.size.width * 0.85)
                    .padding(.bottom, 20)
                    
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
                            Text("Cool Badge")
                                .foregroundColor(pColor)
                                .bold()
                                .padding(.leading, 10)
                        }
                            
                    }
                    .padding(.all, 25)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.15), lineWidth: 4))
                    .frame(width: geometry.size.width * 0.85)
                    
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
 
