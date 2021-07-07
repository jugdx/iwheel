//
//  WheelSlide.swift
//  iWheel
//
//  Created by Fromont Thomas on 07/07/2021.
//

import SwiftUI

public struct WheelSlide: View {
    var geometry: GeometryProxy
    var slideData: SlideData

    var path: Path {
        let chartSize = geometry.size.width
        let radius = chartSize / 2
        let centerX = radius
        let centerY = radius

        var path = Path()
        path.move(to: CGPoint(x: centerX, y: centerY))
        path.addArc(
            center: CGPoint(x: centerX, y: centerY),
            radius: radius,
            startAngle: slideData.startAngle,
            endAngle: slideData.endAngle,
            clockwise: false
        )
        return path
    }

    public var body: some View {
        path.fill(slideData.data.color)
            .overlay(path.stroke(Color.white, lineWidth: 1))
    }
}

struct PieChartSlide_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            WheelSlide(
                geometry: geometry,
                slideData: SlideData(
                    data: DataItem(name: "Christophe"),
                    startAngle: .degrees(-70),
                    endAngle: .degrees(30)
                )
            )
        }
    }
}
