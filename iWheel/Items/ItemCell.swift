//
//  ItemCell.swift
//  iWheel
//
//  Created by Charlotte Martin on 07/07/2021.
//

import SwiftUI

struct ItemCell: View {
    @ObservedObject var viewModel: ItemCellViewModel

    var body: some View {
        Text(viewModel.name)
    }
}
