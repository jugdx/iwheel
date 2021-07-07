//
//  ItemsView.swift
//  iWheel
//
//  Created by Charlotte Martin on 07/07/2021.
//

import SwiftUI

struct ItemsView: View {
    @ObservedObject var viewModel: ItemsViewModel

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.itemsViewModel) { itemViewModel in
                    ItemCell(viewModel: itemViewModel)
                }
            }
            .navigationBarTitle("Items")
        }
    }
}

struct ItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ItemsView(viewModel: ItemsViewModel(items: ["Charlotte", "Julien", "Thomas"]))
    }
}
