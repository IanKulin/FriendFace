//
//  ContentView.swift
//  FriendFace
//
//  Created by Ian Bailey on 6/11/2022.
//

import SwiftUI

struct ContentView: View {

    @State private var users = [User]()

    var body: some View {
        NavigationView {
            List(users, id: \.id) { user in
                NavigationLink(destination: UserDetail(user: user)) {
                    VStack(alignment: .leading) {
                        Text(user.name)
                            .font(.headline)
                        Text(user.isActive ? "Active" : "Not active")
                    }
                }
            }
            .task {
                if users.isEmpty {
                    await fetchUsers()
                }
            }
            .navigationBarTitle("FriendFace")
        }
    }


    func fetchUsers() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }

        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601

            let (data, _) = try await URLSession.shared.data(from: url)
            do {
                let decodedUsers = try decoder.decode([User].self, from: data)
                users = decodedUsers
            } catch {
                print(error)
                return
            }

        } catch {
            print(error)
            return
        }

    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
