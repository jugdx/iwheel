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
}
