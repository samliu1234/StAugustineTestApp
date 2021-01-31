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
                    HStack {
                        
                        Text("Toggle Dark Mode")
                        
                        Toggle(isOn: $isDarkMode) {
                            Text("Toggle")
                        }.padding()
                        
                        if isDarkMode {
                            Text("Dark mode is on")
                        }
                        
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

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
