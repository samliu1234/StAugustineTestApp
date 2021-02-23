//
//  FAQView.swift
//  StAugustineTestApp
//
//  Created by Sam Liu on 2021-02-22.
//

import SwiftUI

struct FAQViewObject<Content: View>: View {
    @State var label: () -> Text
    @State var content: () -> Content
    
    @State private var collapsed: Bool = true
    
    var body: some View {
        VStack {

            Button(
                action: {
                    withAnimation {
                        self.collapsed.toggle()
                    }
                },
                label: {
                    self.label()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            )
            .buttonStyle(PlainButtonStyle())
            
            VStack {
                Divider()
                    .background(Color.white)
                self.content()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: collapsed ? 0 : .none)
            .clipped()
            //.animation(.linear)
            // .transition(.slide)
        }
        .padding()
        .background(Color(red: 49/255, green: 49/255, blue: 49/255))
        .cornerRadius(10)
        .padding(.horizontal, 25)
        
        
    }
}

