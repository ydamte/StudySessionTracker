//
//  studySession.swift
//  studySessionTracker
//
//  Created by Yeabsera Damte on 11/1/24.
//

import Foundation

struct StudySession: Identifiable {
    let id = UUID()
    var subject: String
    var goal: String
    var duration: Int
    var date: Date
    var isComplete: Bool
}
