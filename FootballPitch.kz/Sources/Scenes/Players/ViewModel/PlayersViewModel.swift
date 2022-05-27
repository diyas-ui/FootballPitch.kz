//
//  PlayersViewModel.swift
//  FootballPitch.kz
//
//  Created by 123456 on 26.05.2022.
//

import Foundation
import FirebaseFirestore

class PlayersViewModel {
    var allPlayers: [PlayersModel] = []
    var players: [PlayersModel] = []
    
    func getAllPlayers(_ update: @escaping () -> Void) {
        let db = Firestore.firestore()
        db.collection("users").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    if let data = document.data() as? [String: Any] {
                        let email = data["email"] as? String
                        let name = data["name"] as? String
                        let phone = data["phone"] as? String
                        let icon = data["icon"] as? String
                        let positions = data["positions"] as? [String]
                        let skillLevel = data["skillLevel"] as? String
                        let strongFoot = data["strongFoot"] as? String
                        let weight = data["weight"] as? Int
                        let height = data["height"] as? Int
                        self.players.append(PlayersModel(name: name, positions: positions, email: email, phone: phone, skillLevel: skillLevel, strongFoot: strongFoot, weight: weight, height: height))
                    }
                }
                
                self.allPlayers = self.players
                update()
            }
        }
    }
}
