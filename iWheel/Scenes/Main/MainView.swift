//
//  WheelView.swift
//  iWheel
//
//  Created by Julien Goudeaux on 07/07/2021.
//

import SwiftUI

struct MainView: View {
    @State private var isPresented: Bool = false
    @ObservedObject private var viewModel: MainViewModel

    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        GeometryReader { geo in
            NavigationView {
                MainWheelView(viewModel: viewModel, geo: geo)
                    .padding()
                    .navigationTitle("iWheel (survive)")
                    .toolbar {
                        ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                            Button("Settings") {
                                isPresented.toggle()
                            }
                            .sheet(isPresented: $isPresented, content: {
                                let viewModel = ItemsViewModel()
                                ItemsView(viewModel: viewModel)
                            })
                        }
                    }
            }
        }
    }
}

private struct MainWheelView: View {
    @ObservedObject var viewModel: MainViewModel
    @State var geo: GeometryProxy

    init(viewModel: MainViewModel, geo: GeometryProxy) {
        self.viewModel = viewModel
        self.geo = geo
    }

    var body: some View {
        if viewModel.items.count < 2 {
            return Text("viewModel: viewModel, width: width")
        } else {
            let data: WheelData = WheelData(data: viewModel.items)
            let wheelViewModel: WheelViewModel = WheelViewModel(wheelData: data, minimumRotations: viewModel.numberOfRotations)
            return NavigationWheel(viewModel: wheelViewModel, width: geo.size.width * 0.9)
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
        ZStack {
            WheelView(viewModel: viewModel, width: width)
                .padding()
            HStack {
                Spacer()
                ArrowView()
                    .frame(width: 50, height: 50)
                    .padding(.trailing, 8)
            }
        }
    }
}

private struct ArrowView: View {

    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        Triangle()
            .fill(colorScheme == .dark ? Color.white : Color.black)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(
            viewModel: .init(numberOfRotations: 10)
        )
        .preferredColorScheme(.dark)
    }
}
