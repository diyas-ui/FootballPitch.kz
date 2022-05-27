//
//  ProfileViewModel.swift
//  FootballPitch.kz
//
//  Created by 123456 on 26.05.2022.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ProfileViewModel {
    var player: PlayersModel?
    
    func getPlayer(_ update: @escaping () -> Void) {
        let db = Firestore.firestore()
        db.collection("users").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                if let user = self.getCurrentUser() {
                    for document in querySnapshot!.documents where document.documentID == user.uid {
                        print("\(document.documentID) => \(document.data())")
                        let data = document.data() as [String: Any]
                        
                        let email = data["email"] as? String
                        let name = data["name"] as? String
                        let phone = data["phone"] as? String
                        let positions = data["positions"] as? [String]
                        let skillLevel = data["skillLevel"] as? String
                        let strongFoot = data["strongFoot"] as? String
                        let weight = data["weight"] as? Int
                        let height = data["height"] as? Int
                        self.player = PlayersModel(name: name, positions: positions, email: email, phone: phone, skillLevel: skillLevel, strongFoot: strongFoot, weight: weight, height: height)
                    }
                    
                    update()
                }
            }
        }
    }
    
    private func getCurrentUser() -> User? {
        let currentUser = FirebaseAuth.Auth.auth().currentUser
        return currentUser
    }
}
