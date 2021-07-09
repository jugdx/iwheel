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
                WheelOrEmptyView(
                    items: viewModel.items,
                    minimumRotations: viewModel.numberOfRotations,
                    duration: viewModel.rotationDuration,
                    width: geo.size.width * 0.9
                )
                .navigationBarTitle("iWheel")
                .navigationBarItems(trailing: HStack {
                    Button(
                        action: { self.isPresented.toggle() },
                        label: {
                            Image(systemName: "square.and.pencil")
                                .renderingMode(.template)
                                .foregroundColor(Color(UIColor.label))
                        }
                    )
                    .sheet(isPresented: $isPresented, content: {
                        let viewModel = ItemsViewModel()
                        ItemsView(viewModel: viewModel)
                    })
                })
            }
        }
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
