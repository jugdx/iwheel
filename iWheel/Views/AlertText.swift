//
//  AlertText.swift
//  iWheel
//
//  Created by Thomas Fromont on 07/07/2020.
//  Copyright © 2020 Fromont. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit

extension UIAlertController {
    convenience init(alert: AlertTextField) {
        self.init(title: alert.title, message: nil, preferredStyle: .alert)
        addTextField { $0.placeholder = alert.placeholder }
        addAction(UIAlertAction(title: alert.cancel, style: .cancel) { _ in
            alert.action(nil)
        })
        let textField = self.textFields?.first
        addAction(UIAlertAction(title: alert.accept, style: .default) { _ in
            alert.action(textField?.text)
        })
    }
}

struct AlertWrapper<Content: View>: UIViewControllerRepresentable {
    @Binding var isPresented: Bool
    let alert: AlertTextField
    let content: Content

    func makeUIViewController(context: UIViewControllerRepresentableContext<AlertWrapper>) -> UIHostingController<Content> {
        UIHostingController(rootView: content)
    }

    final class Coordinator {
        var alertController: UIAlertController?
        init(_ controller: UIAlertController? = nil) {
            self.alertController = controller
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }

    func updateUIViewController(_ uiViewController: UIHostingController<Content>, context: UIViewControllerRepresentableContext<AlertWrapper>) {
        uiViewController.rootView = content
        if isPresented
            && uiViewController.presentedViewController == nil {
            var alert = self.alert
            alert.action = {
                self.isPresented = false
                self.alert.action($0)
            }
            let alertController = UIAlertController(alert: alert)
            context.coordinator.alertController = alertController
            uiViewController.present(alertController, animated: true)
        }
        if !isPresented
            && uiViewController.presentedViewController != nil
            && uiViewController.presentedViewController == context.coordinator.alertController {
            uiViewController.dismiss(animated: true)
        }
    }
}

public struct AlertTextField {
    public var title: String
    public var placeholder: String = ""
    public var accept: String = "Done"
    public var cancel: String = "Cancel"
    public var action: (String?) -> Void
}

extension View {
    public func alert(isPresented: Binding<Bool>, _ alert: AlertTextField) -> some View {
        AlertWrapper(isPresented: isPresented, alert: alert, content: self)
    }
}
