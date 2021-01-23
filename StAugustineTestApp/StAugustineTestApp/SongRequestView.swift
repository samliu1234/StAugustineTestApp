//
//  SongRequestView.swift
//  StAugustineTestApp
//
//  Created by Matthew Morelli on 2020-10-25.
//

import SwiftUI


struct SongRequestView: View {
    
    let pColor:Color = Color(red: 141/255, green: 18/255, blue: 48/255)
    let yColor:Color = Color(red: 216/255, green: 174/275, blue: 26/255)
    @State var songNames = ["What Makes You Beautiful", "Wrecking Ball", "Heart Attack"]
    @State var songAuthors = ["One Direction", "Miley Cyrus", "Demi Lovato"]
    @State var votes = [55, 43, 21]
    @State var clicked = [false, true, false]
    
    var body: some View {
        // If it says failed to produce diagnostic, that probably means there's a problem with passing state parameters as bindings
        
        ScrollView {
            VStack {
                
                // MARK: Title
                HStack {
                
                    Text("Song Requests")
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
                
                
                // MARK: Song requests
                VStack(alignment: .leading, spacing: 20) {
                    
                    // MARK: Add song button
                    Button(action: {
                        print("Add song")
                    }, label: {
                        
                        HStack {
                            Spacer()
                            Text("Add Song")
                                .foregroundColor(.white)
                                .bold()
                            Spacer()
                        }
                        .padding(.all, 10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(yColor, lineWidth: 0.75)
                        )
                        .background(yColor)
                        .cornerRadius(25)
                        
                    })
                    
                    // MARK: Individual song requests
                    SongRequestObject(songName: $songNames[0], songAuthor: $songAuthors[0], votes: $votes[0], highlight: $clicked[0])

                    SongRequestObject(songName: $songNames[1], songAuthor: $songAuthors[1], votes: $votes[1], highlight: $clicked[1])
                    
                    SongRequestObject(songName: $songNames[2], songAuthor: $songAuthors[2], votes: $votes[2], highlight: $clicked[2])
                    

                }
                
                // Properties for song requests
                .padding(.all, 25)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.15), lineWidth: 4))
                .padding(.all, 25)
                
            }
        }
        
    }
}

struct SongRequestView_Previews: PreviewProvider {
    static var previews: some View {
        SongRequestView()
    }
}
