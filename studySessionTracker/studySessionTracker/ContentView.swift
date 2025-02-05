//
//  ContentView.swift
//  studySessionTracker
//
//  Created by Yeabsera Damte on 11/1/24.
//

//Programmer: Yeabsera Damte
//Date: 11/01/2024
//Xcode (Version 16.0)
//macOS Sequoia 15.0.1
//Description: This app is an interactive application, that helps the user track their study sessions for school.
//The user can add study sessions to a list and edit details including the subject, goal, and duration of the session.
//Furthermore, there is a map functionality to show the avaiable study spots on campus

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            
            /*Image("backgroundImage")
                .resizable()
                .scaledToFit()
                .ignoresSafeArea()*/
            
            HomeView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
