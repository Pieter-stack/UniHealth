//
//  Activity.swift
//  UniHealth
//
//  Created by Pieter Venter on 2022/10/19.
//

import Foundation

struct Activity: Identifiable{
    var id: String
    var name: String
    var image: String
    var color: String
    
    static func allActivities()->[Activity]{
        return[
            Activity(id: "activeEnergyBurned", name: "Active Burned Calories", image: "activeEnergyBurned", color: "CustomRed"),
            Activity(id: "appleExerciseTime", name: "Exercise Time", image: "appleExerciseTime", color: "CustomPurple"),
            Activity(id: "appleStandTime", name: "Stand Time", image: "appleStandTime", color: "CustomBlue"),
            Activity(id: "distanceWalkingRunning", name: "Distance Walking/Running", image: "distanceWalkingRunning", color: "CustomDarkBlue"),
            Activity(id: "stepCount", name: "Step Count", image: "stepCount", color: "CustomPurple"),
        
        ]
    }
}
