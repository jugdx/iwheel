//
//  WheelOrEmptyView.swift
//  iWheel
//
//  Created by Julien Goudeaux on 08/07/2021.
//

import SwiftUI

struct WheelOrEmptyView: View {

    @State var items: [String]
    @State var minimumRotations: Int
    @State var duration: Double
    @State var width: CGFloat

    init(items: [String], minimumRotations: Int, duration: Double, width: CGFloat) {
        self.items = items
        self.minimumRotations = minimumRotations
        self.duration = duration
        self.width = width
    }

    var body: some View {
        if items.count < 2 {
            Text("Add at least 2 items to use iWheel")
                .navigationTitle("iWheel")
        } else {
            let data: WheelData = WheelData(data: items)
            let viewModel = WheelViewModel(
                wheelData: data,
                minimumRotations: minimumRotations,
                duration: duration,
                width: width
            )
            WheelView(viewModel: viewModel)
        }
    }
}

struct WheelOrEmptyView_Previews: PreviewProvider {
    static var previews: some View {
        WheelOrEmptyView(
            items: ["1", "2", "3"],
            minimumRotations: 10,
            duration: 2,
            width: UIScreen.main.bounds.width * 0.9
        )
        WheelOrEmptyView(
            items: ["1"],
            minimumRotations: 10,
            duration: 2,
            width: UIScreen.main.bounds.width * 0.9
        )
    }
}
