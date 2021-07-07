//
//  WheelView.swift
//  iWheel
//
//  Created by Fromont Thomas on 07/07/2021.
//

import SwiftUI
import Combine

struct WheelView: View {

    @ObservedObject var viewModel: WheelViewModel
    @State private var width: CGFloat

    init(viewModel: WheelViewModel, width: CGFloat) {
        self.viewModel = viewModel
        self.width = width
    }

    var body: some View {
        makeWheel(
            width,
            wheelData: viewModel.wheelData.data
        )
        .frame(width: width, height: width)
        .onTapGesture {
            withAnimation(.easeOut(duration: viewModel.duration)) {
                self.viewModel.rotate()
            }
        }
        .rotationEffect(.degrees(viewModel.angle))
    }

    func makeWheel(
        _ width: CGFloat,
        wheelData: [SlideData]
    ) -> some View {
        return ZStack {
            ForEach(0..<viewModel.wheelData.data.count, id: \.self) { index in
                WheelSlideView(
                    width: width,
                    slideData: wheelData[index]
                )
            }
        }
    }
}

struct WheelView_Previews: PreviewProvider {
    static var previews: some View {
        let data = WheelData(data: ["Charlotte", "Julien", "Thomas F", "Thomas D", "Christophe", "Raphael"])
        let viewModel = WheelViewModel(wheelData: data, minimumRotations: 10, duration: 4)
        return WheelView(viewModel: viewModel, width: 250)
    }
}
