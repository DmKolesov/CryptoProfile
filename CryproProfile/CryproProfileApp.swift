//
//  CryproProfileApp.swift
//  CryproProfile
//
//  Created by dmitri kolesov on 12.04.2024.
//

import SwiftUI

@main
struct CryproProfileApp: App {
    
    @StateObject var viewModel = HomeViewModel()
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .toolbar(.hidden, for: .navigationBar)
            }
            .environmentObject(viewModel)
        }
    }
}
