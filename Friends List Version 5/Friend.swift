//
//  Friend.swift
//  Friends List Version 5
//
//  Created by Soon Yin Jie on 13/7/19.
//  Copyright © 2019 Tinkercademy. All rights reserved.
//

import Foundation

class Friend: Codable {
    
    var name: String
    var school: String
    var profileImageName: String
    var amusingness: Float
    var instagramLink: String
    
    init(name: String, school: String, profileImageName: String, instagramLink: String ) {
        self.name = name
        self.school = school
        self.profileImageName = profileImageName
        self.instagramLink = instagramLink
        self.amusingness = Float.random(in: 1...15)
    }
    
    static func loadSampleData() -> [Friend] {
        let friends = [
            Friend(name: "Alice", school: "Pokemon Training School", profileImageName: "hugface", instagramLink: "https://instagram.com/instagram"),
            Friend(name: "Bob", school: "Pokemon Training School", profileImageName: "nerdface", instagramLink: "https://instagram.com/instagram"),
            Friend(name: "Charles", school: "Pokemon Training School", profileImageName: "rolleyes", instagramLink: "https://instagram.com/instagram")
        ]
        return friends
    }
    
    static func getArchiveURL() -> URL {
        let plistName = "friends"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDirectory.appendingPathComponent(plistName).appendingPathExtension("plist")
    }
    
    static func saveToFile(friends: [Friend]) {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedFriends = try? propertyListEncoder.encode(friends)
        try? encodedFriends?.write(to: archiveURL, options: .noFileProtection)
    }
    
    static func loadFromFile() -> [Friend]? {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        guard let retrievedFriendsData = try? Data(contentsOf: archiveURL) else { return nil }
        guard let decodedFriends = try? propertyListDecoder.decode(Array<Friend>.self, from: retrievedFriendsData) else { return nil }
        return decodedFriends
    }
    
}
