//
//  Database.swift
//  StAugustineTestApp
//
//  Created by Matthew Morelli on 2020-11-14.
//

import Foundation
import Firebase
import os.log

class Database: ObservableObject {
    
    // Database Variables
    var db: Firestore!
    var docRef: DocumentReference!
    
    // live data from apple's servers
    var theDate: Date! = Date()
    
    // Cohort / Day
    var dayNumber = ""
    var snowDayLabel = ""
    
    @Published var showSnowDayLabel = false
    @Published var showDayNumber = false
    
    // Menu
    var menu = [(String, Double)]()
    var regularMenu = [(String, Double)]()
    var images = [String]()
    
    init() {
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
    }
    
    // MARK: Get day number function
    func getDayNumber() {
        db.collection("info").document("dayNumber").getDocument { (snap, err) in
            if let err = err {
                self.dayNumber = "Error123: \(err.localizedDescription)"
            }
            if let snap = snap {
                let data = snap.data() ?? ["dayNumber": "0", "haveFun": false, "snowDay": false]
                let theDayNumber = data["dayNumber"] as? String ?? "0"
                let haveFun = data["haveFun"] as? Bool ?? false
                let snowDay = data["snowDay"] as? Bool ?? false
                
                self.showSnowDayLabel = snowDay
                
                if (theDayNumber == "A" || theDayNumber == "B") {
                    self.showDayNumber = true
                    
                    let theDay = DateFormatter.localizedString(from: self.theDate, dateStyle: DateFormatter.Style.full, timeStyle: DateFormatter.Style.none)
                    
                    // If its a weekend set up the "Monday will be message"
                    if (theDay.range(of: "Sunday") != nil) || (theDay.range(of: "Saturday") != nil) {
                        self.dayNumber = theDayNumber == "A" ? "Monday will be Cohort B" : "Monday will be Cohort A"
                    }
                    
                    // Otherwise just display the normal day number
                    else {
                        self.dayNumber = "Cohort \(theDayNumber)"
                    }
                }
                // lol what on earth does haveFun do
                else {
                    if haveFun {
                        // Directly show the text entered in db
                        self.dayNumber = theDayNumber
                        self.showDayNumber = true
                    } else {
                        // Any other values like "O" or anything just dont show the label
                        self.showDayNumber = false
                    }
                }

            }
        }
    }
    
    func getCafeMenu() {
        db.collection("info").document("cafMenu").getDocument { (snap, err) in
            if let err = err {
                let alert = UIAlertController(title: "Error in getting cafe menu", message: "Error: \(err.localizedDescription)", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(okAction)
            }
            if let snap = snap {
                var tempMenu = [String: Double]()
                
                for (food, cost) in snap.data()! {
                    tempMenu[food] = cost as? Double
                }
                self.menu = tempMenu.sorted( by: { $0.0 < $1.0 } )
            }
        }
    }
    
    func getRegularMenu() {
        db.collection("info").document("cafMenuRegular").getDocument { (snap, err) in
            if let err = err {
                let alert = UIAlertController(title: "Error in getting cafe menu", message: "Error: \(err.localizedDescription)", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(okAction)
            }
            if let snap = snap {
                var tempMenu = [String: Double]()
                
                for (food,cost) in snap.data()! {
                    tempMenu[food] = cost as? Double
                }
                self.regularMenu = tempMenu.sorted( by: { $0.0 < $1.0 } )
            }
        }
    }

}
 
