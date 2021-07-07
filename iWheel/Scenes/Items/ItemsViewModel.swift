//
//  ItemsViewModel.swift
//  iWheel
//
//  Created by Charlotte Martin on 07/07/2021.
//

import Foundation
import Combine

class ItemsViewModel: ObservableObject {

    @Published var itemsViewModel = [ItemCellViewModel]()

    init(items: [String]) {
        itemsViewModel = items.map { item in
            ItemCellViewModel(name: item)
        }
    }

    func removeItem(atOffsets indexSet: IndexSet) {
        itemsViewModel.remove(atOffsets: indexSet)
    }

    func addItem(name: String?) {
        guard let name = name,
              !itemsViewModel.contains(where: { $0.name.uppercased() == name.uppercased() }) else {
            return
        }
        itemsViewModel.append(ItemCellViewModel(name: name))
    }
}
