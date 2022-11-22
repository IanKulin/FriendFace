//
//  UserDetail.swift
//  FriendFace
//
//  Created by Ian Bailey on 7/11/2022.
//
// swiftlint:disable vertical_parameter_alignment_on_call indentation_width

import SwiftUI

struct UserDetail: View {

    let user: CachedUser

    var body: some View {
        Form {
            Section {
                HStack {
                    Text(user.wrappedName)
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            AsyncImage(
                url: URL(string: "https://randomuser.me/api/portraits/men/\(nameHash).jpg"),
                scale: 3
            ) { image in image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }

            Section {
                Text("Age: \(user.age)")
                Text("Company: \(user.wrappedCompany)")
                Text("email: \(user.wrappedEmail)")
                Text("Address: \(user.wrappedAddress)")
                Text("Registered: \(user.wrappedRegistered, style: .date)")

            }
            Section(header: Text("Friends")) {
                List(user.friendsArray, id: \.wrappedName) { friend in
                    Text(friend.wrappedName)
                }
            }
        }
    }

    var nameHash: Int {
        user.wrappedName.utf8.reduce(0) { $0 + Int($1) } % 100
    }
}
