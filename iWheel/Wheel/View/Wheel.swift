//
//  Wheel.swift
//  iWheel
//
//  Created by Fromont Thomas on 07/07/2021.
//

import SwiftUI
import Combine

struct Wheel: View {
    var wheelData: WheelData

    var body: some View {
        GeometryReader { geometry in
            self.makeWheel(
                geometry,
                wheelData: self.wheelData.data
            )
        }
    }

    func makeWheel(
        _ geometry: GeometryProxy,
        wheelData: [SlideData]
    ) -> some View {
        return ZStack {
            ForEach(0..<wheelData.count, id: \.self) { index in
                WheelSlide(
                    geometry: geometry,
                    slideData: wheelData[index]
                )
            }
        }
    }
}

struct PieChart_Previews: PreviewProvider {
    static var previews: some View {
        let data = ["Charlotte", "Julien", "Thomas"]
        Wheel(wheelData: WheelData(data: data))
    }
}
