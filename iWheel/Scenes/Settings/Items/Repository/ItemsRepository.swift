//
//  ItemsRepository.swift
//  iWheel
//
//  Created by Charlotte Martin on 07/07/2021.
//

import Foundation
import Combine

final class ItemsRepository: ObservableObject {

    private enum Constant {
        static let itemsKey = "items"
    }

    static let shared = ItemsRepository()

    @Published var items: [String]

    init() {
        if let fetchedItems = UserDefaults.standard.array(forKey: Constant.itemsKey) as? [String] {
            items = fetchedItems
        } else {
            items = []
        }
    }
    
    func addItem(_ name: String) {
        items.append(name)
        UserDefaults.standard.set(items, forKey: Constant.itemsKey)
    }

    func removeItem(atOffsets indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
        UserDefaults.standard.set(items, forKey: Constant.itemsKey)
    }
}
