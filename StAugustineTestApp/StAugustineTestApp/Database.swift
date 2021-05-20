//
//  Database.swift
//  StAugustineTestApp
//
//  Created by Matthew Morelli on 2020-11-14.
//

import Foundation
import Firebase
import SwiftSoup
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
    
    // Prayer
    var dailyPrayer = ["b", "b"]
    
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
    
    // MARK: Get Cafe Menu
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
    
    // MARK: Get Regular Menu
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
    
    // MARK: Get Prayer Request
    func getPrayerRequest() {
        guard let prayerURL = URL(string: "https://www.biblegateway.com/") else { return }
        print("Just before open")
        //URLSession.shared.dataTask(with: prayerURL) { (data, response, error) in
            // THIS PRINT STATEMENT DOESN'T WORK, LIKELY MEANING A URL ERROR
          /*
             init(urlString:String) {
                 guard let url = URL(string: urlString) else { return }
                 let task = URLSession.shared.dataTask(with: url) { data, response, error in
                     guard let data = data else { return }
                     DispatchQueue.main.async {
                         self.data = data
                     }
                 }
                 task.resume()
             }
             */
            
        let task = URLSession.shared.dataTask(with: prayerURL) { data, response, error in
            
            // ERROR: Connection 3: received failure notification
            print("Hello2")
            if let error = error {
                print("Error1: "+error.localizedDescription)
                self.dailyPrayer = ["No internet connection", "Cannot find daily prayer"]
                /*
                let alert = UIAlertController(title: "Error in retrieving prayer", message: "Please try again later", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
 */
            }
            else {
                print("Hello, world! SAM!")
                let htmlContent = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)!
                self.dailyPrayer = self.parsePrayer(html: htmlContent as String)
            }
        }
        task.resume()
        print("Hello, world! CADAWAS!")
    }
    
    func parsePrayer(html: String) -> [String] {
        var prayer = ["a", "a"]
        do {
            let doc = try SwiftSoup.parse(html)
            let p = try doc.select("p")
            let a = try doc.select("a")
            prayer[0] = try p[0].text()
            prayer[1] = try "\(a[37].text()) \(a[38].text())"
            print("Case1")
        } catch Exception.Error(type: let type, Message: let message) {
            print(type)
            print(message)
            print("Case2")
            prayer = ["Error", "Error"]
        } catch {
            print("Error")
            print("Case3")
            prayer = ["Error", "Error"]
        }
        return prayer
    }

}
 
