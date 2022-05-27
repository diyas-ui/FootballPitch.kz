//
//  EditProfileViewModel.swift
//  FootballPitch.kz
//
//  Created by 123456 on 26.05.2022.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class EditProfileViewModel {
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
    
    func setProfileData(name: String?, phone: String?, positions: [String]?, skillLevel: String?, strongFoot: String?, weight: String?, height: String?) {
        if let user = getCurrentUser() {
            let db = Firestore.firestore()
            var data: [String: Any] = [:]
            
            if let name = name {
                data["name"] = name
            }
            
            if let phone = phone {
                data["phone"] = phone
            }
            
            if let positions = positions {
                data["positions"] = positions
            }
            
            if let skillLevel = skillLevel {
                data["skillLevel"] = skillLevel
            }
            
            if let strongFoot = strongFoot {
                data["strongFoot"] = strongFoot
            }
            
            if let weight = weight {
                data["weight"] = Int(weight)
            }
            
            if let height = height {
                data["height"] = Int(height)
            }
            
            db.collection("users").document(user.uid).updateData(data)
        }
    }
    
    private func getCurrentUser() -> User? {
        let currentUser = FirebaseAuth.Auth.auth().currentUser
        return currentUser
    }
}
