//
//  WheelView.swift
//  iWheel
//
//  Created by Julien Goudeaux on 07/07/2021.
//

import SwiftUI

struct MainView: View {

    @ObservedObject private var viewModel: MainViewModel

    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        let data = WheelData(data:viewModel.items)
        let viewModel = WheelViewModel(wheelData: data, minimumRotations: viewModel.numberOfRotations)
        return GeometryReader { geo in
            NavigationView {
                NavigationWheel(viewModel: viewModel, width: geo.size.width * 0.9)
            }
        }
    }
}

private struct NavigationWheel: View {
    @ObservedObject private var viewModel: WheelViewModel
    @State private var width: CGFloat

    init(viewModel: WheelViewModel, width: CGFloat) {
        self.viewModel = viewModel
        self.width = width
    }

    var body: some View {
        WheelView(viewModel: viewModel, width: width)
            .padding()
            .navigationTitle("iWheel (survive)")
            .toolbar {
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                    Button("Seetings") {
                        // GO TO SEETINGS !
                    }
                }
            }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(
            viewModel: .init(
                items: ["Charlotte", "Arnaud", "Julien", "Thomas F", "Thomas D", "Christophe", "Raphael", "Olivier", "Jeremy", "Lionel"],
                numberOfRotations: 10
            )
        )
        .preferredColorScheme(.dark)
    }
}
