//
//  WheelView.swift
//  iWheel
//
//  Created by Julien Goudeaux on 07/07/2021.
//

import SwiftUI
import Combine

struct MainView: View {
    @ObservedObject private var viewModel: MainViewModel
    @State private var isPresented: Bool = false

    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        GeometryReader { geo in
            NavigationView {
                WheelOrEmpty(viewModel: viewModel, width: geo.size.width)
                    .navigationTitle("iWheel (survive)")
                    .toolbar {
                        ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                            Button(
                                action: { isPresented.toggle() },
                                label: { Image(systemName: "person.fill")
                                    .renderingMode(.template)
                                    .foregroundColor(.black)
                                }
                            )
                            .sheet(isPresented: $isPresented) {
                                let viewModel = ItemsViewModel()
                                ItemsView(viewModel: viewModel)
                            }
                        }
                    }
            }
        }
    }
}

private struct WheelOrEmpty: View {

    @ObservedObject private var viewModel: MainViewModel
    private let width: CGFloat

    init(viewModel: MainViewModel, width: CGFloat) {
        self.viewModel = viewModel
        self.width = width
    }

    var body: some View {
        if viewModel.items.count < 2 {
            Text("Add at least 2 items to use iWheel")
                .navigationTitle("iWheel (survive)")
        } else {
            let data: WheelData = WheelData(data: viewModel.items)
            let wheelViewModel = WheelViewModel(
                wheelData: data,
                minimumRotations: viewModel.numberOfRotations,
                duration: viewModel.rotationDuration
            )
            NavigationWheel(
                mainViewModel: viewModel,
                wheelViewModel: wheelViewModel,
                width: width * 0.9
            )
        }
    }
}

private struct NavigationWheel: View {

    @ObservedObject private var mainViewModel: MainViewModel
    @ObservedObject private var wheelViewModel: WheelViewModel
    @State private var width: CGFloat


    init(mainViewModel: MainViewModel, wheelViewModel: WheelViewModel, width: CGFloat) {
        self.mainViewModel = mainViewModel
        self.wheelViewModel = wheelViewModel
        self.width = width
        subscribeToWinner()
    }

    private func subscribeToWinner() {
        mainViewModel.computeWinner(angle: wheelViewModel.$angle, dataWith: wheelViewModel.wheelData.data(with:))
    }

    var body: some View {
        ZStack {
            WheelView(viewModel: wheelViewModel, width: width)
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
            viewModel: .init(numberOfRotations: 10, rotationDuration: 4)
        )
        .preferredColorScheme(.dark)
    }
}
