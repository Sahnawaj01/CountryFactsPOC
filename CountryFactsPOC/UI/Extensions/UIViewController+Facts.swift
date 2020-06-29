//
//  UIViewController+Facts.swift
//  CountryFactsPOC
//
//  Created by Biswas, Mahammad Sahnawaj on 29/06/20.
//  Copyright © 2020 Biswas, Mahammad Sahnawaj. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlert(message: String?, title: String = Message.header.value, delay: Double = 0.0) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay) {
            let alertController = UIAlertController(title: title, message: message ?? "", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
}
