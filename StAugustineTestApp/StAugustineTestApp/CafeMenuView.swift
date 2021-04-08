//
//  CafeMenuView.swift
//  StAugustineTestApp
//
//  Created by Matthew Morelli on 2020-10-25.
//

import Foundation
import SwiftUI

struct CafeMenuView: View {
    
    @EnvironmentObject var settings: Settings
    
    let pColor:Color = Color(red: 141/255, green: 18/255, blue: 48/255)
    let yColor:Color = Color(red: 216/255, green: 174/275, blue: 26/255)
    let tmpColor = Color(red: 211/255, green: 211/255, blue: 211/255, opacity: 0.7)
    
    var food = ["fish", "pasta", "chicken_legs"]
    
    @State var count = 0
    
    func inc() -> Int {
        count += 1
        if (count > 2) {
            return 0
        }
        return count
    }
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ScrollView(showsIndicators: false) {
            
                HStack {
                        
                    Text("Cafeteria Menu")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Spacer()
                    
                }
                .padding(.all, 25)
                .frame(width: geometry.size.width * 0.85)
                .background(pColor)
                .cornerRadius(20)
                .padding(.bottom, 20)
                
                
                VStack {
                    
                    Text("Today's Specials")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(pColor)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 15)
            
                    GridStack(rows: 4, columns: 2) { row, col in
                        
                            ZStack {
                                
                                Image(food[0])
                                    .resizable()
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(pColor, lineWidth: 3)
                                            .foregroundColor(.clear)
                                            .background(LinearGradient(gradient: Gradient(colors: [Color.clear, tmpColor]), startPoint: .top, endPoint: .bottom))
                                            
                                        )
                                    .cornerRadius(10)
                                    .frame(width: geometry.size.width * 0.325, height: geometry.size.height * 0.22)
                                    .padding(5)
                                    
                                
                                Text("Fish")
                                    .foregroundColor(.white)
                                    .bold()
                                    .offset(y: geometry.size.height * 0.07)
                                    .font(.system(size: 14))
                                    
                            }
                        
                    }
                    //.padding(.leading, geometry.size.width * 0.2)
                }
                .padding(.all, 25)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.15), lineWidth: 4))
                .frame(width: geometry.size.width * 0.85)
                .padding(.bottom, 25)
                
                VStack {
                    
                    Text("Menu")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(pColor)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 15)
            
                    GridStack(rows: 4, columns: 2) { row, col in
                        
                            ZStack {
                                
                                Image(food[0])
                                    .resizable()
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(pColor, lineWidth: 3)
                                            .foregroundColor(.clear)
                                            .background(LinearGradient(gradient: Gradient(colors: [Color.clear, tmpColor]), startPoint: .top, endPoint: .bottom))
                                            
                                        )
                                    .cornerRadius(10)
                                    .frame(width: geometry.size.width * 0.325, height: geometry.size.height * 0.22)
                                    .padding(5)
                                    
                                
                                Text("Fish")
                                    .foregroundColor(.white)
                                    .bold()
                                    .offset(y: geometry.size.height * 0.08)
                                    .font(.system(size: 16))
                                    
                            }
                        
                        
                        
                    }
                    //.padding(.leading, geometry.size.width * 0.2)
                }
                .padding(.all, 25)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.15), lineWidth: 4))
                .frame(width: geometry.size.width * 0.85)
            }
            .padding(.all, 25)
            
        }
    }
    
}

/*
struct ImageOverlay: View {
    var body: some View {
        HStack {
            Text("burger")
                .foregroundColor(.white)
        }
    }
}

struct CafeMenuView: View {
    
    let data = Array(1...6).map {"Item: \($0)"}
    let layout = [
        GridItem(.flexible(maximum: 100)),
        GridItem(.flexible(maximum: 100))
    ]
    let pColor:Color = Color(red: 141/255, green: 18/255, blue: 48/255)
    
    var body: some View {
        
        ScrollView {
            LazyVGrid(columns: layout, spacing: 20) {
                ForEach(data, id: \.self) { item in
                    Image("burger")
                        .resizable()
                        //.scaledToFit()
                        .frame(width: 120, height: 175)
                        .overlay(
                            Text("burger").foregroundColor(.white), alignment: .bottomTrailing)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(pColor, lineWidth: 0.75))
                        .padding(.all, 50)
                  
                }
            }
            .padding(.horizontal)
        }
        
    }
}
*/
struct CafeMenuView_Previews: PreviewProvider {
    static var previews: some View {
        CafeMenuView()
    }
}
