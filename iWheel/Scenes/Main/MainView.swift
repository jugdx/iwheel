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
                MainWheelView(geo: geo, items: viewModel.items)
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

private struct MainWheelView {
    let geo: GeometryProxy
    let items: [String]

    init(geo: GeometryProxy, items: [String]) {
        self.geo = geo
        self.items = items
    }

    @ViewBuilder
    var body: some View {
        if items.count < 2 {
            Text("viewModel: viewModel, width: width")
        } else {
            Text("viewModel: viewModel, width: width")
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
