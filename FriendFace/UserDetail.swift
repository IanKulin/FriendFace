//
//  UserDetail.swift
//  FriendFace
//
//  Created by Ian Bailey on 7/11/2022.
//

import SwiftUI


struct UserDetail: View {

    let user: User

    var body: some View {
        Form {
            Section {
                Text(user.name)
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            Section {
                Text(user.isActive ? "Active" : "Not active")
                Text("Age: \(user.age)")
                Text("Company: \(user.company)")
                Text("email: \(user.email)")
                Text("Address: \(user.address)")
            }
            Section(header: Text("Friends")) {
                List(user.friends, id: \.id) { friend in
                    Text(friend.name)
                }
            }
        }
    }
}


struct UserDetail_Previews: PreviewProvider {
    static var previews: some View {
        let user = User(
            id: "50a48fa3-2c0f-4397-ac50-64da464f9954",
            isActive: false,
            name: "Alford Rodriguez",
            age: 21,
            company: "Imkan",
            email: "alfordrodriguez@imkan.com",
            address: "907 Nelson Street, Cotopaxi, South Dakota, 5913",
            about: "Occaecat consequat elit …ion irure est deserunt.",
            registered: "2015-11-10T01:47:18-00:00",
            tags: [],
            friends: [
                Friend(id: "1", name: "Gale Prescot"),
                Friend(id: "2", name: "Fred Flinstone"),
                Friend(id: "3", name: "Bela Goth"),
                Friend(id: "4", name: "Abraham Lincon"),
                Friend(id: "5", name: "Flood Waters")
            ]
        )
        UserDetail(user: user)
    }
}
