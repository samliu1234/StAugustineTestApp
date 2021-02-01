//
//  HomePageView.swift
//  StAugustineTestApp
//
//  Created by Matthew Morelli on 2020-10-23.
//

import SwiftUI

struct HomePageView: View {
    
    // @EnvironmentObject var database: Database
    
    let pColor:Color = Color(red: 141/255, green: 18/255, blue: 48/255)
    let yColor:Color = Color(red: 216/255, green: 174/275, blue: 26/255)
    let tmpColor = Color(red: 211/255, green: 211/255, blue: 211/255, opacity: 0.7)
    
    @State var items = ["Pizza", "Burger", "Patty"]
    @State var costs = [3.75, 4.50, 2.00]
    @State var grades = [9, 10, 11, 12]
    @State var percentages:[Double] = [0.7, 0.6, 0.3, 1]
    
    var body: some View {
        
        //HomePageView().environmentObject(database)
        
        GeometryReader { geometry in
            
        
            ScrollView {
                HStack {
                    Spacer()
    
                    // Entire view
                    VStack(spacing: 30) {
                        
                        // MARK: Welcome block
                        HStack {

                            // Welcome text
                            VStack(alignment: .leading, spacing: 15) {
                                
                                Text("Welcome \nJohn Doe")
                                    .font(.title2)
                                    .bold()
                                    .foregroundColor(.white)
                                
                                Text("Saturday, November 12 \nCohort A")
                                    //.font(.body)
                                    .foregroundColor(.white)
                                    .font(.system(size: 13))
                                
                            }
                            
                            Spacer()
                            
                            // Sta logo
                            Image("stalogo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width * 0.2)
                                .padding(.leading)
                            
                        }
                        // Properties for welcome block
                        //.frame(width: geometry.size.width * 0.85)
                        .padding(.all, 25)
                        .frame(width: geometry.size.width * 0.85)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(yColor, lineWidth: 8)
                        )
                        .background(pColor)
                        .cornerRadius(20)
                        
                        
                        // MARK: Announcemnts board
                        VStack(alignment: .leading, spacing: 20) {
                            
                            Text("Announcements Board")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(pColor)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.bottom, 10)
                            
                            VStack(spacing: 10) {
                                Text("Yearbook")
                                    .bold()
                                    .foregroundColor(pColor)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Text("Hi there, yearbook club here. How are y'all doing?")
                                    .font(.body)
                                    .foregroundColor(pColor)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .frame(width: geometry.size.width * 0.62)
                            .padding(.all)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(pColor, lineWidth: 0.75))
                            
                            
                            VStack(spacing: 10) {
                                Text("Basketball team")
                                    .bold()
                                    .foregroundColor(pColor)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Text("Tryouts start tomorrow everyone! Come out and show us what you got!")
                                    .font(.body)
                                    .foregroundColor(pColor)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .frame(width: geometry.size.width * 0.62)
                            .padding(.all)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(pColor, lineWidth: 0.75))
                            
                            
                        }
                        
                        // Properties for announcement board
                        .padding(.all, 25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.15), lineWidth: 4))
                        .frame(width: geometry.size.width * 0.85)
                        
                        // MARK: Cafe items
                        VStack {
                        
                            Text("Featured Cafe Items")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(pColor)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.bottom, 10)
                            
                            HStack(spacing: 20) {
                                
                                /*
                                CafeItem(item: $items[0], price: $costs[0])
                                    //.frame(width: geometry.size.width * 0.3)
                                CafeItem(item: $items[1], price: $costs[1])
                                CafeItem(item: $items[2], price: $costs[2])
 */
                                // MARK: Item 1
                                ZStack {
                                    
                                    Image("rotini_pasta")
                                        .resizable()
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(pColor, lineWidth: 3)
                                                .foregroundColor(.clear)
                                                .background(LinearGradient(gradient: Gradient(colors: [Color.clear, tmpColor]), startPoint: .top, endPoint: .bottom))
                                                
                                            )
                                        .cornerRadius(10)
                                        .frame(width: geometry.size.width * 0.2, height: geometry.size.height * 0.2)
                                        
                                    
                                    Text("Rotini Pasta")
                                        .foregroundColor(.white)
                                        .bold()
                                        .offset(y: geometry.size.height * 0.08)
                                        .font(.system(size: 8))
                                        
                                }
                                
                                // MARK: Item 2
                                ZStack {
                                    
                                    Image("fish")
                                        .resizable()
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(pColor, lineWidth: 3)
                                                .foregroundColor(.clear)
                                                .background(LinearGradient(gradient: Gradient(colors: [Color.clear, tmpColor]), startPoint: .top, endPoint: .bottom))
                                                
                                            )
                                        .cornerRadius(10)
                                        .frame(width: geometry.size.width * 0.2, height: geometry.size.height * 0.2)
                                        
                                    
                                    Text("Fish")
                                        .foregroundColor(.white)
                                        .bold()
                                        .offset(y: geometry.size.height * 0.08)
                                        .font(.system(size: 8))
                                        
                                }
                                
                                // MARK: Item 3
                                ZStack {
                                    
                                    Image("chicken_legs")
                                        .resizable()
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(pColor, lineWidth: 3)
                                                .foregroundColor(.clear)
                                                .background(LinearGradient(gradient: Gradient(colors: [Color.clear, tmpColor]), startPoint: .top, endPoint: .bottom))
                                                
                                            )
                                        .cornerRadius(10)
                                        .frame(width: geometry.size.width * 0.2, height: geometry.size.height * 0.2)
                                        
                                    
                                    Text("Chicken Legs")
                                        .foregroundColor(.white)
                                        .bold()
                                        .offset(y: geometry.size.height * 0.08)
                                        .font(.system(size: 8))
                                        
                                }
                             
                            }
  
                        }
                        
                        // Properties for cafe items
                        .padding(.all, 25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.15), lineWidth: 4))
                        .frame(width: geometry.size.width * 0.85)
                        
                        // MARK: Spirit meter
                        VStack {
                            
                            Text("Spirit meter")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(pColor)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.bottom, 10)
                            
                            HStack() {
                                Text(String(9))
                                    .frame(idealWidth: 30, maxWidth: 30, alignment: .leading)
                                    .foregroundColor(pColor)
                                RoundedRectangle(cornerRadius: 30)
                                    .frame(width: geometry.size.width * 0.55 * 0.3, height: 10, alignment: .leading)
                                    .foregroundColor(yColor)
                                Spacer()
                            }
                            
                            HStack() {
                                Text(String(10))
                                    .frame(idealWidth: 30, maxWidth: 30, alignment: .leading)
                                    .foregroundColor(pColor)
                                RoundedRectangle(cornerRadius: 30)
                                    .frame(width: geometry.size.width * 0.55 * 0.6, height: 10, alignment: .leading)
                                    .foregroundColor(yColor)
                                Spacer()
                            }
                            
                            HStack() {
                                Text(String(11))
                                    .frame(idealWidth: 30, maxWidth: 30, alignment: .leading)
                                    .foregroundColor(pColor)
                                RoundedRectangle(cornerRadius: 30)
                                    .frame(width: geometry.size.width * 0.55 * 0.9, height: 10, alignment: .leading)
                                    .foregroundColor(yColor)
                                Spacer()
                            }
                            
                            HStack() {
                                Text(String(12))
                                    .frame(idealWidth: 30, maxWidth: 30, alignment: .leading)
                                    .foregroundColor(pColor)
                                RoundedRectangle(cornerRadius: 30)
                                    .frame(width: geometry.size.width * 0.55, height: 10, alignment: .leading)
                                    .foregroundColor(yColor)
                                Spacer()
                            }
                            
                        }
                        
                        // Properties for spirit meter
                        .padding(.all, 25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.15), lineWidth: 4))
                        .frame(width: geometry.size.width * 0.85)
                        
                        // MARK: Chaplaincy corner
                        VStack(alignment: .leading, spacing: 20) {
                            
                            Text("Chaplaincy Corner")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(pColor)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.bottom, 10)
                            
                            VStack(spacing: 20) {
                                Text("Verse of the Day")
                                    .bold()
                                    .foregroundColor(pColor)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Text("The Bible is cool!")
                                    .font(.body)
                                    .foregroundColor(pColor)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .frame(width: geometry.size.width * 0.6)
                            .padding(.all, 20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(pColor, lineWidth: 0.75))
                            
                        }
                
                        
                        // Properties for chaplaincy corner
                        .padding(.all, 25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.15), lineWidth: 4))
                        .frame(width: geometry.size.width * 0.85)
                        
                    }
                    Spacer()
                }
                .onAppear {
                    //self.database.getDayNumber()
                    //self.database.getCafeMenu()
                }
            
            }
            
        }
        
    }
    
}


struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}

struct HomePageView_Previews_2: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
