//
//  HomeView.swift
//  studySessionTracker
//
//  Created by Yeabsera Damte on 11/1/24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = studySessionVM()
    @State private var isShowingAddSessionView = false
    
    var body: some View {
        /*ZStack {
            //Image("backgroundImage")
            Image("newimage2")
                .resizable()
                .scaledToFit()
                .ignoresSafeArea()*/
            
            NavigationStack{
                VStack {
                    Text("Study Schedule")
                        .font(.largeTitle)
                        .padding()
                        .foregroundColor(.white)
                    
                    List(viewModel.sessions) { session in
                        NavigationLink(destination: SessionDetailView(session: session, viewModel: viewModel)) {
                            
                            HStack {
                                Image(systemName: "book.fill")
                                    .foregroundColor(.blue)
                                Text("\(session.subject)")
                                    .font(.headline)
                                
                                Spacer()
                                
                                Image(systemName: "target")
                                    .foregroundColor(.orange)
                                
                                Text(session.goal)
                                
                            }
                            
                            //Text("\(session.subject) - \(session.goal)")
                        }
                    }
                    
                    .scrollContentBackground(.hidden)
                    .background(Color.clear)
                    
                    Spacer()
                    
                    HStack {
                        Button(action: {
                            //viewModel.addSession(subject: "CS", goal: "Review OS", duration: 60)
                            isShowingAddSessionView = true
                        }) {
                            Text("New Session")
                                .padding()
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        
                        .sheet(isPresented: $isShowingAddSessionView){
                            AddSessionView(viewModel: viewModel)
                        }
                        
                        NavigationLink(destination: StudyLocationMapView()){
                            Text("Study Locations")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        
                    }
                    
                    
                }
                
                
                .background(
                    Image("newimage2")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                )
            }
        }
    

}

