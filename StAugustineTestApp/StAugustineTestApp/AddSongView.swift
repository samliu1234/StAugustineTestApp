//
//  AddSongView.swift
//  StAugustineTestApp
//
//  Created by Sam Liu on 2021-03-08.
//

import SwiftUI

struct AddSongView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let pColor:Color = Color(red: 141/255, green: 18/255, blue: 48/255)
    let yColor:Color = Color(red: 216/255, green: 174/275, blue: 26/255)
    
    @State var songSelection: String = ""
    @State var artistSelection: String = ""
    @Binding var songNumber: Int 
    @Binding var songNames: [String]
    @Binding var songAuthors: [String]
    @Binding var votes: [Int]
    @Binding var clicked: [Bool]
    
    var body: some View {
        VStack {
            Text("Song")
                .foregroundColor(pColor)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("Song", text: $songSelection)
                .padding(10)
                .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                .cornerRadius(10)
            
            Text("Artist")
                .foregroundColor(pColor)
                .padding(.top, 20)
                .frame(maxWidth: .infinity, alignment: .leading)
                
            TextField("Artist", text: $artistSelection)
                .padding(10)
                .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                .cornerRadius(10)
            
            Button(action: {
                if songSelection != "" && artistSelection != "" {
                    songNames.append(songSelection)
                    songAuthors.append(artistSelection)
                    votes.append(1)
                    clicked.append(false)
                    songNumber += 1
                    songSelection = ""
                    artistSelection = ""
                }
            }, label: {
                Text("Request")
                    .foregroundColor(yColor)
                    .font(.system(size: 20))
                    .frame(maxWidth: .infinity, alignment: .trailing)
            })
            .padding()
            
            Spacer()
            
        }
        .padding(25)
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

struct AddSongView_Previews: PreviewProvider {
    static var previews: some View {
        AddSongView(songNumber: Binding.constant(0), songNames: Binding.constant([""]), songAuthors: Binding.constant([""]), votes: Binding.constant([0]), clicked: Binding.constant([false]))
    }
}
