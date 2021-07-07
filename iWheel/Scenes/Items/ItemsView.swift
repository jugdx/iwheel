//
//  ItemsView.swift
//  iWheel
//
//  Created by Charlotte Martin on 07/07/2021.
//

import SwiftUI

struct ItemsView: View {
    @ObservedObject var viewModel: ItemsViewModel

    @State private var isShowingAlert = false

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.itemsViewModel) { itemViewModel in
                    ItemCell(viewModel: itemViewModel)
                }
                .onDelete { indexSet in
                    self.viewModel.removeItem(atOffsets: indexSet)
                }
            }
            .navigationBarTitle("Items")
            .navigationBarItems(leading: HStack {
                Button(
                    action: { self.isShowingAlert.toggle() },
                    label: {
                        Image(systemName: "plus")
                            .renderingMode(.template)
                            .foregroundColor(Color(UIColor.label))
                    }
                )
            })
        }
        .alert(isPresented: $isShowingAlert,
            AlertTextField(
                title: "Create a new Item",
                placeholder: "Enter name here",
                action: { name in self.viewModel.addItem(name: name) }
            )
        )
    }
}

struct ItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ItemsView(viewModel: ItemsViewModel())
    }
}
