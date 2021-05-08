//
//  AppDelegate.swift
//  StAugustineTestApp
//
//  Created by Sam Liu on 2021-05-08.
//

import Foundation
import Firebase
import GoogleSignIn

class AppDelegate: NSObject, GIDSignInDelegate, ObservableObject, UIApplicationDelegate {
    
    @Published var email = ""
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        // Configures a default Firebase app
        FirebaseApp.configure()
        
        // Initialize GoogleSignIn
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        
        return true
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        guard let user = user else {
            return
        }
        
        let credential = GoogleAuthProvider.credential(withIDToken: user.authentication.idToken, accessToken: user.authentication.accessToken)
        
        Auth.auth().signIn(with: credential) { (result, error) in
            
            if error != nil {
                print((error?.localizedDescription)!)
                return
            }
            
            self.email = (result?.user.email)!
            print(self.email)
            
        }
        
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        if error != nil {
            print(error.localizedDescription)
        }
    }
    
}
