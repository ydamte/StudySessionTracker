//
//  EditSessionView.swift
//  studySessionTracker
//
//  Created by Yeabsera Damte on 11/2/24.
//

import SwiftUI

struct EditSessionView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: studySessionVM
    var session: StudySession
    
    @State private var studySubject: String
    @State private var studyGoal: String
    @State private var studyTime: Int
    
    init(viewModel: studySessionVM, session: StudySession) {
        self.viewModel = viewModel
        self.session = session
        _studySubject = State(initialValue: session.subject)
        _studyGoal = State(initialValue: session.goal)
        _studyTime = State(initialValue: session.duration)
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Edit Session Details")){
                    TextField("Subject", text: $studySubject)
                    TextField("Goal", text: $studyGoal)
                    Stepper("Length: \(studyTime) mins", value: $studyTime, in: 0...150)
                }
                
                Button(action: {
                    viewModel.updateSession(id:session.id, subject: studySubject, goal: studyGoal, duration: studyTime)
                    dismiss()
                }){
                    Text("Save Changes")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                
                .disabled(studySubject.isEmpty || studyGoal.isEmpty)
                
            }
            .navigationTitle("Edit Session Details")
            .toolbar{
                ToolbarItem(placement: .cancellationAction){
                    Button("Cancel"){
                        dismiss()
                    }
                }
            }
        }
    }
}
