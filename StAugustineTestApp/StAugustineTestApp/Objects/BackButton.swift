//
//  BackButton.swift
//  StAugustineTestApp
//
//  Created by Sam Liu on 2021-03-01.
//

import SwiftUI

struct BackButton: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let yColor:Color = Color(red: 216/255, green: 174/275, blue: 26/255)

    var body: some View {

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

    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton()
    }
}
