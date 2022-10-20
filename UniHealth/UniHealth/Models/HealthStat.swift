//
//  HealthStat.swift
//  UniHealth
//
//  Created by Pieter Venter on 2022/10/19.
//

import Foundation
import HealthKit

struct HealthStat: Identifiable{
    var id = UUID()
    var stat: HKQuantity?
    let date: Date
}
