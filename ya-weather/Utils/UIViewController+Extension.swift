//
//  UIViewController+Extension.swift
//  ya-weather
//
//  Created by Nurbolat Yerdikul on 20.04.2021.
//

import UIKit

extension UIViewController {
    
    func showError(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(
            title: "Ok",
            style: .cancel,
            handler: nil
        )
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
}
