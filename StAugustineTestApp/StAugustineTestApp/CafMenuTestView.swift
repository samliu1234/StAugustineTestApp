//
//  CafMenuTestView.swift
//  StAugustineTestApp
//
//  Created by Matthew Morelli on 2021-01-31.
//

import Foundation
import SwiftUI

struct Row: Identifiable {
    let id = UUID()
    let cells: [Cell]
}

extension Row {
    
}

extension Row {
    
    static func all() -> [Row] {
        
        return [
            
            Row(cells: [Cell(imageURL: "pasta"), Cell(imageURL: "pasta")]),
            Row(cells: [Cell(imageURL: "pasta"), Cell(imageURL: "pasta")]),
            Row(cells: [Cell(imageURL: "pasta"), Cell(imageURL: "pasta")])
            
        
        ]
        
    }
    
}

struct Cell: Identifiable {
    let id = UUID()
    let imageURL: String
}

struct CafMenuTestView: View {
    let rows = Row.all()
    let pColor:Color = Color(red: 141/255, green: 18/255, blue: 48/255)
    let yColor:Color = Color(red: 216/255, green: 174/275, blue: 26/255)
        
    var body: some View {
        
        GeometryReader { geometry in
        
            HStack {
                Text("Cafeteria Menu")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
            }
            .padding(.all, 25)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(yColor, lineWidth: 8)
            )
            .background(pColor)
            .cornerRadius(20)
            .frame(width: geometry.size.width * 0.8)
            
            VStack(spacing: 20) {
                
                Text("Today's Specials")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(pColor)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 10)
                
                List {
                
                    ForEach(rows) { row in
                        HStack(alignment: .center) {
                            ForEach(row.cells) { cell in
                                Spacer()
                                VStack {
                                    Image(cell.imageURL)
                                        .resizable()
                                        //.scaledToFit()
                                        .frame(width: 150, height: 175)
                                        .cornerRadius(10)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(pColor, lineWidth: 0.75))
                                }
                                Spacer()
                                
                            }
                        }
                    }
                
                }.padding(EdgeInsets.init(top: 0, leading: -20, bottom: 0, trailing: -20))
            }
            .padding(.all, 100)
            //.padding(.leading, 25)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.15), lineWidth: 4))
            .frame(width: geometry.size.width * 0.9)
            
        }
    }
}

struct CafMenuTestView_Previews: PreviewProvider {
    static var previews: some View {
        CafMenuTestView()
    }
}
