//
//  ContentView.swift
//  Insta
//
//  Created by addin on 28/06/21.
//

import SwiftUI
import Combine

struct ContentView: View {
  
  @EnvironmentObject var auth: Authentication
  
  @EnvironmentObject var signInPresenter: SignInPresenter
  
  @EnvironmentObject var homePresenter: HomePresenter
  @EnvironmentObject var searchPresenter: SearchPresenter
  @EnvironmentObject var uploadPresenter: UploadPresenter
  @EnvironmentObject var profilePresenter: ProfilePresenter
  @EnvironmentObject var settingsPresenter: SettingsPresenter
  
  @State private var selected = 0
  
  @State private var showUploadView = false
  
  @State private var hasSignedIn = false
  
  var body: some View {
    
    Group {
      if hasSignedIn {
        main
      } else {
        signer
      }
    }
    .animation(.linear)
    .onReceive(Just(auth.hasSignedIn)) { value in
      if hasSignedIn != value {
        hasSignedIn = value
      }
    }
    
  }
  
}

extension ContentView {
  
  var signer: some View {
    SignInView(presenter: signInPresenter)
      .animation(.none)
  }
  
  var main: some View {
    TabView(selection: $selected) {
      
      NavigationView {
        HomeView(presenter: homePresenter)
          .animation(.none)
          .navigationBarItems(trailing: uploadButton)
      }
      .tabItem {
        Image(systemName: "house")
      }
      .tag(0)
      
      SearchView(presenter: searchPresenter)
        .animation(.none)
        .tabItem {
          Image(systemName: "magnifyingglass")
        }
        .tag(1)
      
      ProfileView(presenter: profilePresenter)
        .animation(.none)
        .tabItem {
          Image(systemName: "person")
        }
        .tag(3)
      
    }
    .sheet(isPresented: $showUploadView) {
      UploadView(presenter: uploadPresenter)
    }
    //    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
  }
  
  var uploadButton: some View {
    Button(action: {
      showUploadView = true
    }) {
      Image(systemName: "square.and.arrow.up")
    }
  }
  
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
