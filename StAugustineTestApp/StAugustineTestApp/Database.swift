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
        let task = URLSession.shared.dataTask(with: prayerURL) { data, response, error in
            if let error = error {
                print("Error1: "+error.localizedDescription)
                self.dailyPrayer = ["No internet connection", "Cannot find daily prayer"]
            }
            else {
                let htmlContent = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)!
                self.dailyPrayer = self.parsePrayer(html: htmlContent as String)
            }
        }
        task.resume()
    }
    
    // MARK: Parse Prayer from Website
    private func parsePrayer(html: String) -> [String] {
        var prayer = ["a", "a"]
        do {
            let doc = try SwiftSoup.parse(html)
            let verse: Element = try doc.getElementById("verse-text")!
            let ref: Element = try doc.getElementsByClass("citation").first()!
            prayer[0] = try verse.text()
            prayer[1] = try ref.text()
        } catch Exception.Error(type: let type, Message: let message) {
            print(type)
            print(message)
            prayer = ["Error", "Error"]
        } catch {
            print("Error")
            prayer = ["Error", "Error"]
        }
        return prayer
    }
    
    // MARK: Parse News
    func getNewsRequest() {
        guard let news = URL(string: "https://staugustinechs.ca/printable/") else { return }
        let task = URLSession.shared.dataTask(with: news) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            else {
                let htmlContent = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)! as String
                self.parseNews(html: htmlContent)
            }
        }
        task.resume()
    }
    
    private func parseNews(html: String) {
        do {
            print("Start")
            let doc: Document = try SwiftSoup.parse(html)
            print(try doc.body())
            let div = try doc.getElementById("ancmnt")
            print(div!.children().count)
            
            let tr = try doc.getElementsByTag("table")
            print(tr.count)
           
        } catch Exception.Error(type: let type, Message: let message) {
            print(type)
            print(message)
        } catch {
            print("Error")
        }
    }

}
 
