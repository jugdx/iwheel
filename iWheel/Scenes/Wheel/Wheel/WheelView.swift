//
//  WheelView.swift
//  iWheel
//
//  Created by Julien Goudeaux on 08/07/2021.
//

import SwiftUI

struct WheelView: View {

    @ObservedObject var viewModel: WheelViewModel

    init(viewModel: WheelViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        ZStack {
            PieChartView(
                viewModel: .init(
                    wheelData: viewModel.wheelData,
                    width: viewModel.width
                )
            )
            .onTapGesture {
                withAnimation(.easeOut(duration: viewModel.duration)) {
                    self.viewModel.rotate()
                }
            }
            .rotationEffect(.degrees(viewModel.angle))
            HStack {
                Spacer()
                ArrowView()
                    .frame(width: 50, height: 50)
            }
        }
    }
}

private struct ArrowView: View {
    var body: some View {
        Triangle()
            .fill(Color(UIColor.label))
    }
}

struct WheelView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = WheelViewModel(wheelData: .init(data: ["1","2","3"]), minimumRotations: 10, duration: 3, width: 350)
        WheelView(viewModel: viewModel)
    }
}
