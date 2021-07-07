//
//  ContentView.swift
//  Insta
//
//  Created by addin on 28/06/21.
//

import SwiftUI

struct ContentView: View {
  
  @EnvironmentObject var auth: Authentication
  
  @EnvironmentObject var signInPresenter: SignInPresenter
  
  @EnvironmentObject var homePresenter: HomePresenter
  @EnvironmentObject var searchPresenter: SearchPresenter
  @EnvironmentObject var uploadPresenter: UploadPresenter
  @EnvironmentObject var profilePresenter: ProfilePresenter
  @EnvironmentObject var settingsPresenter: SettingsPresenter

  @State private var selected = 0
  
    var body: some View {
      
      Group {
        if auth.hasSignedIn {
          main
        } else {
          signer
        }
      }
      
    }
  
}

extension ContentView {
  
  var signer: some View {
    SignInView(presenter: signInPresenter)
  }
  
  var main: some View {
    TabView(selection: $selected) {
      
      HomeView(presenter: homePresenter)
        .tabItem {
          Image(systemName: "house")
        }
        .tag(0)
      
      SearchView(presenter: searchPresenter)
        .tabItem {
          Image(systemName: "magnifyingglass")
        }
        .tag(1)
      
      UploadView(presenter: uploadPresenter)
        .tabItem {
          Image(systemName: "square.and.arrow.up")
        }
        .tag(2)
            
      ProfileView(presenter: profilePresenter)
        .tabItem {
          Image(systemName: "person")
        }
        .tag(3)
      
    }
//    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
  }
  
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
