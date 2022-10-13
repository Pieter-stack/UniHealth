//
//  BoardingScreen.swift
//  UniHealth
//
//  Created by Pieter Venter on 2022/10/02.
//

import SwiftUI

struct BoardingScreen: Identifiable {
    var id = UUID().uuidString
    var image: String
    var title: String
    var description: String
}

//onbaording Model Screen
var boardingScreens: [BoardingScreen] = [
    BoardingScreen(image: "OnboardingImgOne", title: "Track your health", description: "University is hard and is easy to lose track of your health with all the deadlines!"),
    BoardingScreen(image: "OnboardingImgTwo", title: "Enjoy without worry", description: "Let us track your health for you and help you stay healthier."),
    BoardingScreen(image: "OnboardingImgThree", title: "Feel healthy again", description: "With UniHealth we will track your health and give a short summary at your fingertips!")
]



