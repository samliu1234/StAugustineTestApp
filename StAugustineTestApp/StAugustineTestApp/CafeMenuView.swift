//
//  CafeMenuView.swift
//  StAugustineTestApp
//
//  Created by Matthew Morelli on 2020-10-25.
//

import Foundation
import SwiftUI

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
                ForEach(data, id: \.self) {item in
                    VStack {
                        Image("burger")
                            .resizable()
                            .scaledToFit()
                            .overlay(
                                Text("burger").foregroundColor(.white), alignment: .bottomTrailing)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(pColor, lineWidth: 0.75))
                    }
                    .padding(.all)
                    //.frame(width: 150, height: 350)
                }
            }
            .padding(.horizontal)
        }
        
    }
}

struct CafeMenuView_Previews: PreviewProvider {
    static var previews: some View {
        CafeMenuView()
    }
}
