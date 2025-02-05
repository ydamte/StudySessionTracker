//
//  AddSessionView.swift
//  studySessionTracker
//
//  Created by Yeabsera Damte on 11/1/24.
//

import SwiftUI

struct AddSessionView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: studySessionVM
    
    @State private var studySubject = ""
    @State private var studyGoal = ""
    @State private var studyTime = 0
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Details")){
                    TextField("Subject", text: $studySubject)
                    TextField("Goal", text: $studyGoal)
                    Stepper("Length: \(studyTime) mins", value: $studyTime, in: 0...150)
                }
                
                Button(action: {
                    viewModel.addSession(subject: studySubject, goal: studyGoal, duration: studyTime)
                    dismiss()
                }){
                    Text("Add Session")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .disabled(studySubject.isEmpty || studyGoal.isEmpty)
            }
            .navigationTitle("Add New Study Session")
            .toolbar {
                ToolbarItem(placement: ToolbarItemPlacement.cancellationAction){
                    Button("Cancel"){
                        dismiss()
                    }
                }
            }
        }
    }
}
