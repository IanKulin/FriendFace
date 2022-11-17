//
//  User.swift
//  FriendFace
//
//  Created by Ian Bailey on 6/11/2022.
//

import Foundation

struct User: Codable, Identifiable {
    var id: String
    var isActive: Bool
    var name: String
    var age: Int16
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [Friend]
}
