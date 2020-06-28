//
//  UIColor+Facts.swift
//  CountryFactsPOC
//
//  Created by Biswas, Mahammad Sahnawaj on 28/06/20.
//  Copyright © 2020 Biswas, Mahammad Sahnawaj. All rights reserved.
//

import UIKit

extension UIColor {
    class func factTitleColor() -> UIColor { //R215 G218 B221
        return UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
    }
    class func descriptionColor() -> UIColor { //R146 G146 B147
        return UIColor(red: 0.572, green: 0.572, blue: 0.576, alpha: 1.0)
    }
    class func viewBackground() -> UIColor {
        return UIColor(red: 0.110, green: 0.169, blue: 0.50, alpha: 1)
    }
    class func navBarColor() -> UIColor {
        return UIColor(red: 0.110, green: 0.169, blue: 0.50, alpha: 1)
    }
}
