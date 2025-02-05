//
//  studySessionVM.swift
//  studySessionTracker
//
//  Created by Yeabsera Damte on 11/1/24.
//

import Foundation

class studySessionVM: ObservableObject {
    @Published var sessions: [StudySession] = []
    
    func addSession(subject: String, goal: String, duration: Int) {
        let newSession = StudySession(subject: subject, goal: goal, duration: duration, date: Date(), isComplete: false)
        sessions.append(newSession)
    }
    
    func updateSession(id: UUID, subject: String, goal: String, duration: Int){
        if let idx = sessions.firstIndex(where: { $0.id == id }) {
            sessions[idx].subject = subject
            sessions[idx].goal = goal
            sessions[idx].duration = duration
        }
    }
    
    func removeSession(id: UUID){
        sessions.removeAll { $0.id == id }
    }
    
    func markCompleted(id: UUID){
        if let idx = sessions.firstIndex(where: { $0.id == id }) {
            sessions[idx].isComplete = true
        }
    }
                                              
    func getTotalTime() -> Int {
            sessions.filter { $0.isComplete }.reduce(0) { $0 + $1.duration }
        }
}
