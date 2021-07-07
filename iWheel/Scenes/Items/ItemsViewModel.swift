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
    private let itemsRepository = ItemsRepository()
    private var cancellables = Set<AnyCancellable>()

    init() {
        itemsRepository.$items
            .map { items in
                return items.map { item in
                    return ItemCellViewModel(name: item)
                }
            }
            .assign(to: \.itemsViewModel, on: self)
            .store(in: &cancellables)
    }

    func removeItem(atOffsets indexSet: IndexSet) {
        self.itemsRepository.removeItem(atOffsets: indexSet)
    }

    func addItem(name: String?) {
        guard let name = name,
              !itemsViewModel.contains(where: { $0.name.uppercased() == name.uppercased() }) else {
            return
        }
        itemsRepository.addItem(name)
    }
}
