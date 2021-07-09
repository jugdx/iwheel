//
//  PieChartSlideView.swift
//  iWheel
//
//  Created by Fromont Thomas on 07/07/2021.
//

import SwiftUI

public struct PieChartSlideView: View {
    var width: CGFloat
    var slideData: SlideData

    var path: Path {
        let radius = width / 2
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
        path.closeSubpath()
        return path
    }

    var textAngle: Angle {
        return (slideData.startAngle + slideData.endAngle) / 2
    }

    var textPosition: CGPoint {
        let radius = width / 2
        let positionX = radius * 8 / 5
        let positionY = radius
        return .init(x: positionX, y: positionY)
    }

    public var body: some View {
        ZStack {
            path.fill(slideData.data.color)
                .overlay(path.stroke(Color(UIColor.systemBackground), lineWidth: 1))

            Text(slideData.data.name)
                .bold()
                .foregroundColor(slideData.data.textColor)
                .position(textPosition)
                .rotationEffect(textAngle)
        }
    }
}

struct PieChartSlide_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            PieChartSlideView(
                width: geometry.size.width,
                slideData: SlideData(
                    data: DataItem(name: "Christophe"),
                    startAngle: .degrees(-70),
                    endAngle: .degrees(30)
                )
            )
        }
    }
}
