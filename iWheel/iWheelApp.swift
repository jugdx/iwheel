//
//  iWheelApp.swift
//  iWheel
//
//  Created by Charlotte Martin on 07/07/2021.
//

import SwiftUI

@main
struct iWheelApp: App {
    var body: some Scene {
        WindowGroup {
            MainView(viewModel: .init(numberOfRotations: 10))
        }
    }
}
