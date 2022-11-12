//
//  UserDetail.swift
//  FriendFace
//
//  Created by Ian Bailey on 7/11/2022.
//

import SwiftUI


extension View {
    func snapshot() -> UIImage {
        let controller = UIHostingController(rootView: self)
        let view = controller.view

        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear

        let renderer = UIGraphicsImageRenderer(size: targetSize)

        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
}

struct UserDetail: View {

    let user: User

    var body: some View {
        Form {
            Section {
                HStack {
                    Text(user.name)
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
                Text("Company: \(user.company)")
                Text("email: \(user.email)")
                Text("Address: \(user.address)")
                Text("Registered: \(user.registered, style: .date)")

            }
            Section(header: Text("Friends")) {
                List(user.friends, id: \.id) { friend in
                    Text(friend.name)
                }
            }
        }
    }

    var nameHash: Int {
        user.name.utf8.reduce(0) { $0 + Int($1) } % 100
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
            registered: Date(),
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
