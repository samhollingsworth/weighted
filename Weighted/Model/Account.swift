//
//  Account.swift
//  Weighted
//
//  Created by Sam Hollingsworth on 4/15/21.
//

import Foundation

struct Account: Decodable {
    
    let name: String
    let todayPerformance: Double
    let pastPerformance: [TimePeriod: Double]
    
    enum TimePeriod: Double, Decodable {
        case sixMonths = 0.5
        case oneYear = 1
        case threeYears = 3
        case fiveYear = 5
        case tenYear = 10
    }
    
}
