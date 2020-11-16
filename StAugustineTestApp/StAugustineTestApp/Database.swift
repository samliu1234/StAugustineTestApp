//
//  Database.swift
//  StAugustineTestApp
//
//  Created by Matthew Morelli on 2020-11-14.
//

import Foundation
import Firebase

class Database: ObservableObject {
    
    // Database Variables
    var db: Firestore!
    var docRef: DocumentReference!
    
    // live data from apple's servers
    var theDate: Date! = Date()
    
    var theActualMenu = [[Any]]()
    
    init() {
        FirebaseApp.configure()
        //Set Up
        // [START setup]
        let settings = FirestoreSettings()
        ////settings.areTimestampsInSnapshotsEnabled = true
        Firestore.firestore().settings = settings
        // [END setup]
        db = Firestore.firestore()
    }
    
    func getCafeMenu(){
        
        db.collection("info").document("cafMenu").getDocument { (snap, err) in
            if let err = err {
                let alert = UIAlertController(title: "Error in getting cafe menu", message: "Error: \(err.localizedDescription)", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(okAction)
                //self.present(alert, animated: true, completion: nil)
            }
            if let snap = snap {
                for (food,cost) in snap.data()! {
                    self.theActualMenu.append([food,cost])
                }
                self.sortAlphaOrder()
                print(self.theActualMenu)
            }
        }
    }
    
    func sortAlphaOrder(){
        if self.theActualMenu.count > 1 {
            var thereWasASwap = true
            while thereWasASwap {
                thereWasASwap = false
                for i in 0...self.theActualMenu.count-2 {
                    let name1: String = self.theActualMenu[i][0] as! String
                    let name2: String = self.theActualMenu[i+1][0] as! String
                    
                    let shortestLength: Int
                    if name1.count < name2.count {
                        //print("\(name1) is shorter")
                        shortestLength = name1.count
                    } else {
                        //print("\(name2) is shorter")
                        shortestLength = name2.count
                    }
                    
                    for j in 0...shortestLength-1 {
                        //Compare Alphabetically
                        let index1 = name1.index(name1.startIndex, offsetBy: j)
                        let index2 = name2.index(name2.startIndex, offsetBy: j)
                        let character1 = Character((String(name1[index1]).lowercased()))
                        let character2 = Character((String(name2[index2]).lowercased()))
                        
                        if character2 < character1 {
                            //print("done swap")
                            thereWasASwap = true
                            let temp = self.theActualMenu[i]
                            self.theActualMenu[i] = self.theActualMenu[i+1]
                            self.theActualMenu[i+1] = temp
                            break
                        } else if character1 == character2 {
                            //print("equal so they need to go one higher")
                        } else {
                            //print("not equal")
                            break
                        }
                    }
                }
            }
            //self.menuCollectionView.reloadData()
        } else {
            //self.menuCollectionView.reloadData()
        }
    }
    
    var dayNumber = ""
    var snowDayLabel = ""
    
    @Published var showSnowDayLabel = false
    @Published var showDayNumber = false
    /*
    func getDayNumber() {
        db.collection("info").document("dayNumber").getDocument { (snap, err) in
            if let err = err {
                self.dayNumber = "Error: \(err.localizedDescription)"
            }
            if let snap = snap {
                let data = snap.data() ?? ["dayNumber": "0", "haveFun": false, "snowDay": false]
                let theDayNumber = data["dayNumber"] as? String ?? "0"
                let haveFun = data["haveFun"] as? Bool ?? false
                let snowDay = data["snowDay"] as? Bool ?? false
                
                if snowDay {
                    self.showSnowDayLabel = true
                } else {
                    self.showSnowDayLabel = false
                }
                
                //Only display the day number if the day is 1 or 2
                // change value from "A" and "B" to "1" and "2" when the school switches back to day 1 and 2 instead of cohort a and b
                // also a and b must be capitals
                if (theDayNumber == "A" || theDayNumber == "B") {
                    self.showDayNumber = true
                    
                    let theDay = DateFormatter.localizedString(from: self.theDate, dateStyle: DateFormatter.Style.full, timeStyle: DateFormatter.Style.none)
                    //If its a weekend set up the "monday will be message"
                    if (theDay.range(of:"Sunday") != nil) || (theDay.range(of:"Saturday") != nil){
                        if theDayNumber == "A" {
                            self.dayNumber = "Monday will be Cohort B"
                        } else if theDayNumber == "B" {
                            self.dayNumber = "Monday will be Cohort A"
                        }
                    }
                    
                    //Otherwise just display the normal day number
                    else {
                        self.dayNumber = "Cohort \(theDayNumber)"
                    }
                } else {
                    if haveFun {
                        //directly show the text entered in db
                        self.dayNumber = theDayNumber
                        self.showDayNumber = true
                    } else {
                        //Any other values like "O" or anything just dont show the label
                        self.showDayNumber = false
                    }
                }

            }
        }
    }*/
}

