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
    
    @State var songNumber = 3
    @State var songNames = ["What Makes You Beautiful", "Wrecking Ball", "Heart Attack"]
    @State var songAuthors = ["One Direction", "Miley Cyrus", "Demi Lovato"]
    @State var votes = [55, 43, 21]
    @State var clicked = [false, true, false]
    
    var body: some View {
        // If it says failed to produce diagnostic, that probably means there's a problem with passing state parameters as bindings
        
        NavigationView {
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
                        NavigationLink(destination: AddSongView(songNumber: $songNumber, songNames: $songNames, songAuthors: $songAuthors, votes: $votes, clicked: $clicked)) {
                            
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
                            
                        }
                        
                        // MARK: Individual song requests
                        ForEach(0..<songNumber, id: \.self) { i in
                            SongRequestObject(songName: $songNames[i], songAuthor: $songAuthors[i], votes: $votes[i], highlight: $clicked[i])
                        }

                    }
                    
                    // Properties for song requests
                    .padding(.all, 25)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.15), lineWidth: 4))
                    .padding(.all, 25)
                    
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)
                // MOVE WITHIN NAVIGATION VIEW BRACKETS TO REMOVE SPACE AT THE TOP
                
            }
            
        }
        
    }

    
}

struct SongRequestView_Previews: PreviewProvider {
    static var previews: some View {
        SongRequestView()
    }
}
