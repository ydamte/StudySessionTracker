//
//  SessionDetailView.swift
//  studySessionTracker
//
//  Created by Yeabsera Damte on 11/1/24.
//

import SwiftUI

struct SessionDetailView: View {
    var session: StudySession
    @ObservedObject var viewModel: studySessionVM
    @State private var isEdit = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Session Details")
                .font(.title)
                .padding()
            
            HStack{
                Image(systemName: "book.fill")
                    .foregroundColor(.blue)
                
                Text("Subject: \(session.subject)")
                    .font(.headline)
            }
            
            HStack{
                Image(systemName: "target")
                    .foregroundColor(.orange)
                
                Text("Goal: \(session.goal)")
                    .font(.headline)
            }
            
            HStack{
                Image(systemName: "clock")
                    .foregroundColor(.purple)
                
                Text("Duration: \(session.duration) mins")
                    .font(.headline)
            }
            
            HStack{
                Image(systemName: "calender")
                    .foregroundColor(.green)
                
                Text("Date: \(session.date.formatted())")
                    .font(.headline)
            }
            
            HStack {
                Button("Edit"){
                    isEdit = true
                }
                .padding()
                .background(Color.blue.opacity(0.2))
                .cornerRadius(10)
                
                Button("Delete"){
                    viewModel.removeSession(id: session.id)
                    dismiss()
                }
                .padding()
                .background(Color.red.opacity(0.2))
                .cornerRadius(10)
            }
            .sheet(isPresented: $isEdit){
                EditSessionView(viewModel: viewModel, session: session)
            }
            
           
            
            Spacer()
            
        }
        
        .padding()
    }
    
}
