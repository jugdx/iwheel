//
//  PieChartView.swift
//  iWheel
//
//  Created by Fromont Thomas on 07/07/2021.
//

import SwiftUI
import Combine

struct PieChartView: View {

    @ObservedObject var viewModel: PieChartViewModel

    init(viewModel: PieChartViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        ZStack {
            ForEach(0..<viewModel.wheelData.data.count, id: \.self) { index in
                PieChartSlideView(
                    width: viewModel.width,
                    slideData: viewModel.wheelData.data[index]
                )
            }
        }
        .frame(width: viewModel.width, height: viewModel.width)
    }
}

struct PieChartView_Previews: PreviewProvider {
    static var previews: some View {
        let data = WheelData(data: ["Charlotte", "Julien", "Thomas F", "Thomas D", "Christophe", "Raphael"])
        let viewModel = PieChartViewModel(wheelData: data, width: 350)
        return PieChartView(viewModel: viewModel)
    }
}
