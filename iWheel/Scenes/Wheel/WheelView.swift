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

    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            self.makeWheel(
                width,
                wheelData: viewModel.wheelData.data
            )
            .frame(width: width, height: width)
            .onTapGesture {
                viewModel.rotate()
            }
            .rotationEffect(.degrees(viewModel.angle))
            .animation(.easeInOut(duration: 4))
        }
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

struct PieChart_Previews: PreviewProvider {
    static var previews: some View {
        let data = ["Charlotte", "Julien", "Thomas F", "Thomas D", "Christophe", "Raphael"]
        WheelView(viewModel: .init(wheelData: .init(data: data)))
    }
}
