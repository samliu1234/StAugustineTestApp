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
    @ObservedObject var db: Database
    
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
    
    func log(_ val: Int) -> EmptyView {
        print(self.db.menu[val])
        return EmptyView()
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
            
                    GridStack(rows: self.db.menu.count / 2, columns: 2) { row, col in
                        
                        let val = 2 * row + col
                        
                        if val < self.db.menu.count {
                            CafeItem(imageName: "fish", item: self.db.menu[val].0, price: self.db.menu[val].1, size: 13)
                                .padding(.leading, col == 1 ? 5 : 0)
                                .padding(.trailing, col == 0 ? 5 : 0)
                                .padding(.top, row != 0 ? 5 : 0)
                                .padding(.bottom, row != self.db.menu.count / 2 ? 5 : 0)
                        }
                       
                    }
                    
                }
                .padding(.all, 25)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.15), lineWidth: 3))
                .frame(width: geometry.size.width * 0.85)
                .padding(.bottom, 25)
                
                VStack {
                    
                    Text("Menu")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(pColor)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 15)
            
                    GridStack(rows: self.db.regularMenu.count / 2, columns: 2) { row, col in
                        
                        let val = 2 * row + col
                        
                        if val < self.db.regularMenu.count {
                            CafeItem(imageName: "fish", item: self.db.regularMenu[val].0.capitalized, price: self.db.regularMenu[val].1, size: 13)
                                .padding(.leading, col == 1 ? 5 : 0)
                                .padding(.trailing, col == 0 ? 5 : 0)
                                .padding(.top, row != 0 ? 5 : 0)
                                .padding(.bottom, row != self.db.regularMenu.count / 2 ? 5 : 0)
                        }
                        
                    }
                    //.padding(.leading, geometry.size.width * 0.2)
                }
                .padding(.all, 25)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.15), lineWidth: 3))
                .frame(width: geometry.size.width * 0.85)
            }
            .padding(.all, 25)
            
        }
    }
    
}
