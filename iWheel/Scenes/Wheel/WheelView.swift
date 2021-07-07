//
//  WheelView.swift
//  iWheel
//
//  Created by Julien Goudeaux on 07/07/2021.
//

import SwiftUI

struct WheelView: View {

    @ObservedObject var viewModel: WheelViewModel

    init(viewModel: WheelViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            Button("Rotate") {
                viewModel.rotate()
            }
            .padding()
            Rectangle()
                .frame(width: 150, height: 150)
                .foregroundColor(.red)
                .rotationEffect(.degrees(viewModel.angle))
                .animation(.easeInOut(duration: 2), value: viewModel.angle)
        }
        .padding()
    }
}

struct WheelView_Previews: PreviewProvider {
    static var previews: some View {
        WheelView(viewModel: .init())
    }
}
