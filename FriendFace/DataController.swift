//
//  DataController.swift
//  FriendFace
//
//  Created by Ian Bailey on 12/11/2022.
//

import CoreData
import Foundation


class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "FriendFace")

    init() {
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }

    deinit {
    }

}
