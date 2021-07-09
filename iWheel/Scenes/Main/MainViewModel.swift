//
//  MainViewModel.swift
//  iWheel
//
//  Created by Julien Goudeaux on 07/07/2021.
//

import SwiftUI
import Combine

final class MainViewModel: ObservableObject {

    private var cancellables = Set<AnyCancellable>()

    @Published var items: [String] = []
    @Published var numberOfRotations: Int
    @Published var rotationDuration: Double

    init(items: AnyPublisher<[String], Never>, numberOfRotations: Int, rotationDuration: Double) {
        self.rotationDuration = rotationDuration
        self.numberOfRotations = numberOfRotations

        items
            .assign(to: \.items, on: self)
            .store(in: &cancellables)
    }

//    func computeWinner(angle: Published<Double>.Publisher, dataWith: @escaping ((Double) -> SlideData?))  {
//        angle
//            .dropFirst()
//            .delay(for: RunLoop.SchedulerTimeType.Stride(rotationDuration), scheduler: RunLoop.main)
//            .sink { finalAngle in
//                let winnerAngle = 360 - finalAngle.truncatingRemainder(dividingBy: 360)
//                let winnerData = dataWith(winnerAngle)
//                print(winnerData?.data.name ?? "NOT FOUND")
//            }
//            .store(in: &cancellables)
//    }
}
