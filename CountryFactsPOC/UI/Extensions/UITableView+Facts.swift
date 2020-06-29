//
//  UITableView+Facts.swift
//  CountryFactsPOC
//
//  Created by Biswas, Mahammad Sahnawaj on 29/06/20.
//  Copyright © 2020 Biswas, Mahammad Sahnawaj. All rights reserved.
//

import UIKit

extension UITableView {
  func showActivityIndicator() {
    DispatchQueue.main.async {
      let activityView = UIActivityIndicatorView(style: .whiteLarge)
      activityView.color = UIColor.navBarColor()
      self.backgroundView = activityView
      activityView.hidesWhenStopped = true
      activityView.startAnimating()
    }
  }

  func hideActivityIndicator() {
    DispatchQueue.main.async {
      self.backgroundView = nil
    }
  }
}
