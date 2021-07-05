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
      HomeView()
    }
    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
  }
  
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
