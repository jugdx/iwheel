//
//  WheelOrEmptyView.swift
//  iWheel
//
//  Created by Julien Goudeaux on 08/07/2021.
//

import SwiftUI

struct WheelOrEmptyView: View {

    @ObservedObject var viewModel: WheelOrEmptyViewModel

    init(viewModel: WheelOrEmptyViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        if viewModel.items.count < 2 {
            Text("Add at least 2 items to use iWheel")
                .navigationTitle("iWheel")
        } else {
            let data: WheelData = WheelData(data: viewModel.items)
            let viewModel = WheelViewModel(
                wheelData: data,
                minimumRotations: viewModel.minimumRotations,
                duration: viewModel.duration,
                width: viewModel.width
            )
            WheelView(viewModel: viewModel)
        }
    }
}

struct WheelOrEmptyView_Previews: PreviewProvider {
    static var previews: some View {
        WheelOrEmptyView(
            viewModel: .init(
                items: ["1", "2", "3"],
                minimumRotations: 10,
                duration: 2,
                width: UIScreen.main.bounds.width * 0.9
            )
        )
        WheelOrEmptyView(
            viewModel: .init(
                items: ["1"],
                minimumRotations: 10,
                duration: 2,
                width: UIScreen.main.bounds.width * 0.9
            )
        )
    }
}
