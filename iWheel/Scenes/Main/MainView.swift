//
//  WheelView.swift
//  iWheel
//
//  Created by Julien Goudeaux on 07/07/2021.
//

import SwiftUI

struct Mainiew: View {

    var body: some View {
        WheelView(viewModel: .init(wheelData: .init(data: ["Julien", "Charlotte", "Thomas"])))
    }
}

struct WheelView_Previews: PreviewProvider {
    static var previews: some View {
        Mainiew()
    }
}
