//
//  CachedUser+CoreDataProperties.swift
//  FriendFace
//
//  Created by Ian Bailey on 15/11/2022.
//
//
// swiftlint:disable extension_access_modifier attributes missing_docs type_contents_order legacy_objc_type colon implicit_return


import CoreData
import Foundation


extension CachedUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedUser> {
        return NSFetchRequest<CachedUser>(entityName: "CachedUser")
    }

    @NSManaged public var about: String?
    @NSManaged public var address: String?
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var id: UUID?
    @NSManaged public var isActive: Bool
    @NSManaged public var name: String?
    @NSManaged public var registered: Date?
    @NSManaged public var friends: NSSet?

    var wrappedAbout: String {
        about ?? "Unknown"
    }

    var wrappedAddress: String {
        address ?? "Unknown"
    }

    var wrappedAge: Int16 {
        age
    }

    var wrappedCompany: String {
        company ?? "Unknown"
    }

    var wrappedEmail: String {
        email ?? "Unknown"
    }

    func fromUser(_ user: User) {
        about = user.about
        address = user.address
        age = user.age
        company = user.company
        email = user.email
        isActive = user.isActive
        name = user.name
        registered = user.registered
    }

//    func loadFriends(_ friends: [Friend], moc: ) {
//        for friend in friends {
//            let cachedFriend = CachedFriend(context: moc)
//            cachedFriend.name = friend.name
//        }
//    }

}

// MARK: Generated accessors for friends
extension CachedUser {

    @objc(addFriendsObject:)
    @NSManaged public func addToFriends(_ value: CachedFriend)

    @objc(removeFriendsObject:)
    @NSManaged public func removeFromFriends(_ value: CachedFriend)

    @objc(addFriends:)
    @NSManaged public func addToFriends(_ values: NSSet)

    @objc(removeFriends:)
    @NSManaged public func removeFromFriends(_ values: NSSet)

}

extension CachedUser : Identifiable {

}
