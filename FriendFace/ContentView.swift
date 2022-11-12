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
                    HStack {
                        Circle()
                            .fill(user.isActive ? .green : .red)
                            .frame(width: 10)
                        Text(user.name)
                            .font(.headline)
                    }
                }
            }
            .task {
                await fetchUsers()
            }
            .navigationBarTitle("FriendFace")
        }
    }


    func fetchUsers() async {
        // Don't re-fetch data if we already have it
        guard users.isEmpty else {
            print("Unneeded refetch attempt")
            return
        }
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            users = try decoder.decode([User].self, from: data)
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
