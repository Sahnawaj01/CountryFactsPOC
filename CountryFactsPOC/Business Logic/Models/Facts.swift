//
//  Facts.swift
//  CountryFactsPOC
//
//  Created by Biswas, Mahammad Sahnawaj on 29/06/20.
//  Copyright © 2020 Biswas, Mahammad Sahnawaj. All rights reserved.
//

import Foundation

// Api Response Structure
struct Facts: Codable {
    let title: String?
    let rows: [Row]?
}

// MARK: - Row
struct Row: Codable {
    let title: String?
    let description: String?
    let imageHref: String?
}
