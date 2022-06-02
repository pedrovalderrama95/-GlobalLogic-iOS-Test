//
//  UIViewController+GlobalLogic.swift
//  GlobalLogicTest
//
//  Created by Pedro Valderrama on 01/06/2022.
//

import UIKit

extension UIViewController {
    func showAlert(title: String, message: String, callback: ((UIAlertAction) -> Void)? = nil ) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: callback))
        present(alertController, animated: true, completion: nil)
    }
}
