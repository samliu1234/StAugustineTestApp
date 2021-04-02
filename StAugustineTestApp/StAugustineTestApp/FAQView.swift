//
//  FAQView.swift
//  StAugustineTestApp
//
//  Created by Sam Liu on 2021-02-22.
//

import SwiftUI

struct FAQView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let pColor:Color = Color(red: 141/255, green: 18/255, blue: 48/255)
    let yColor:Color = Color(red: 216/255, green: 174/275, blue: 26/255)
    
    
    var body: some View {
        ScrollView {
            VStack (spacing: 15) {
                // MARK: Title
                HStack {
                
                    Text("FAQ")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Spacer()
                    
                }
                .padding(.all, 25)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(pColor, lineWidth: 8)
                )
                .background(pColor)
                .cornerRadius(20)
                .padding([.horizontal, .bottom], 25)
                
                // MARK: FAQ
                FAQViewObject(
                    label: { Text("If I spend my spirit points, does it take away from the spirit points of my grade?") },
                    content: { Text("No. Although the spirit points you gain individually are added to your grades overall spirit meter, these points will not be taken away once you decide to spend them.") }
                )
                FAQViewObject(
                    label: { Text("How do I keep my school information private?") },
                    content: { Text("To ensure other students cannot see your courses or clubs, go to the home screen and click the three dots on the top left corner, and then go into settings. From there, turn on the toggle switch to keep classes and clubs private.") }
                )
                FAQViewObject(
                    label: { Text("How do you get more badges? Will each club have one?") },
                    content: { Text("You can get more badges by joining different clubs, however, badges can only be earned once you have been accepted into the club by your club administrator. No, not all clubs have badges. It is up to the club administrator if they wish to add them.") }
                )
                FAQViewObject(
                    label: { Text("What does “Clear Cache” do?") },
                    content: { Text("We store images on the app so that it runs smooth. By clearing cache, you will save storage on your device. The app will still be able to run, however, loading time may take a bit longer.") }
                )
                FAQViewObject(
                    label: { Text("Does the app update for snow days on the home page?") },
                    content: { Text("Yes. The app gets its information directly from School Bus City, therefore once updates have been posted on the website, the app will update as well by posting it on the home page as well as sending out a notification (if notifications are on).") }
                )
                FAQViewObject(
                    label: { Text("How do you earn points to spend on profile pics?") },
                    content: { Text("You can earn points by joining clubs which require approval from the administrator. From there you are free to use your points on whatever you wish (ie. song requests, new profile pictures, etc.)") }
                )
                FAQViewObject(
                    label: { Text("Will the caf menu be updated the night before or the morning of?") },
                    content: { Text("The cafeteria menu will be updated on the app the morning of, as this is when the cafeteria posts that day’s menu") }
                )
                FAQViewObject(
                    label: { Text("Is there a place in the app or somewhere we can put suggestions and report bugs?") },
                    content: { Text("Yes!") }
                )
                VStack {
                    FAQViewObject(
                        label: { Text("What is the difference between club announcements and school wide announcements?") },
                        content: { Text("Club announcements") }
                    )
                    FAQViewObject(
                        label: { Text("Can I log into my account on multiple devices?") },
                        content: { Text("Yes, however, the notifications will only appear on the last signed in device.") }
                    )
                } // Maximum VStack limit

            }
        }
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

struct FAQView_Previews: PreviewProvider {
    static var previews: some View {
        FAQView()
    }
}
