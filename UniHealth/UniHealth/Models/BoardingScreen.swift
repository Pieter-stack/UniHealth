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
    BoardingScreen(image: "OnboardingImgOne", title: "Title1", description: "Desc1Desc1Desc1Desc1Desc1Desc1Desc1Desc1Desc1Desc1Desc1Desc1"),
    BoardingScreen(image: "OnboardingImgTwo", title: "Title2", description: "Desc2Desc1Desc1Desc1Desc1Desc1Desc1Desc1Desc1Desc1Desc1Desc1Desc1Desc1Desc1Desc1Desc1Desc1Desc1Desc1Desc1Desc1Desc1Desc1Desc1"),
    BoardingScreen(image: "OnboardingImgThree", title: "Title3", description: "Desc3Desc1Desc1Desc1Desc1Desc1Desc1Desc1Desc1Desc1Desc1Desc1Desc1")
]



