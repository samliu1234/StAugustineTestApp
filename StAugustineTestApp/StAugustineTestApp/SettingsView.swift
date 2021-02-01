//
//  SettingsView.swift
//  StAugustineTestApp
//
//  Created by Sam Liu on 2021-01-31.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var isDarkMode = true
    
    let pColor:Color = Color(red: 141/255, green: 18/255, blue: 48/255)
    let yColor:Color = Color(red: 216/255, green: 174/275, blue: 26/255)
    
    // var activeDarkColour:Color
    
    var body: some View {
        
        GeometryReader { geometry in
        
            VStack(spacing: 30) {
            
                // MARK: Title
                HStack {
                
                    Text("Settings")
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
                
                // MARK: Settings panel
                VStack(alignment: .leading, spacing: 20) {
                    
                    // MARK: Toggle dark mode
                        
                    Toggle(isOn: $isDarkMode, label: {
                        
                        Text("Toggle Dark Mode")
                            .foregroundColor(pColor)
                            .bold()
                            .font(.subheadline)
                            //.font(.custom("Source Sans Pro", size: 14))
                        
                        //.onReceive([self.isDarkMode].publisher.first()) { (value) in
                                //print("Toggled")
                           //}
                        
                    })
                    .toggleStyle(SwitchToggleStyle(tint: pColor))
                    
                    Toggle(isOn: $isDarkMode, label: {
                        
                        Text("Enable General Notifications")
                            .foregroundColor(pColor)
                            .bold()
                            .font(.subheadline)
                        
                    })
                    .toggleStyle(SwitchToggleStyle(tint: pColor))
                    
                    Text("Send Feedback")
                        .foregroundColor(pColor)
                        .bold()
                        .font(.subheadline)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top, 20)
                    
                    Text("Logout")
                        .foregroundColor(pColor)
                        .bold()
                        .font(.subheadline)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    
                }
                .frame(width: 0.7 * geometry.size.width, alignment: .center)
                .padding(.all, 25)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.15), lineWidth: 4))
                .padding(.horizontal, 25)
                
                // MARK: FAQ
                HStack(spacing: 20) {
                    
                    Text("FAQ")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(pColor)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 10)
                    
                    Spacer()
                    
                    Button(action: {
                        print("hi")
                    }, label: {
                        Image(systemName: "arrow.right")
                            .foregroundColor(yColor)
                    })
                    
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

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
