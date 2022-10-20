//
//  Date+Ext.swift
//  UniHealth
//
//  Created by Pieter Venter on 2022/10/19.
//

import Foundation

extension Date{
    static func firstDayOfWeek() -> Date{
        return Calendar(identifier: .iso8601).date(from: Calendar(identifier: .iso8601).dateComponents([.yearForWeekOfYear, .weekOfYear], from: Date())) ?? Date()
    }
}
