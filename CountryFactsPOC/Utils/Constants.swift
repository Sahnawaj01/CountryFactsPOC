//
//  Constants.swift
//  CountryFactsPOC
//
//  Created by Biswas, Mahammad Sahnawaj on 28/06/20.
//  Copyright © 2020 Biswas, Mahammad Sahnawaj. All rights reserved.
//

import Foundation
// For Application Message

enum Message: String {
    case networkNotReachable
    case header

    var value: String {
        switch self {
        case .networkNotReachable:
            return "Network Not Available, Please check your connection."
        case .header:
            return "Alert"
        }
    }
}
