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
    var description: String
    
    static func allActivities()->[Activity]{
        return[
            Activity(id: "activeEnergyBurned", name: "Active Burned Calories", image: "activeEnergyBurned", color: "CustomRed", description:"As a busy Student you would want to see how many calories you've burned while walking between classes."),
            Activity(id: "appleExerciseTime", name: "Exercise Time", image: "appleExerciseTime", color: "CustomPurple", description: "Time for the gym, Track all the time you've been busy lifting weights to running on the threadmill."),
            Activity(id: "appleStandTime", name: "Stand Time", image: "appleStandTime", color: "CustomBlue", description: "Students sit infront of their laptop the whole day and studing so why not see how you can improve you sitting and standing times."),
            Activity(id: "distanceWalkingRunning", name: "Distance Walking/Running", image: "distanceWalkingRunning", color: "CustomDarkBlue", description: "Staying fit is hard so we made it easier to see the time you have walked or when you are late ran to class."),
            Activity(id: "stepCount", name: "Step Count", image: "stepCount", color: "CustomPurple", description: "Track your steps throughout your whole week on campus"),
        
        ]
    }
}
