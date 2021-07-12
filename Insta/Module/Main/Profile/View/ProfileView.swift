//
//  ProfileView.swift
//  Insta
//
//  Created by addin on 07/07/21.
//

import SwiftUI

struct ProfileView: View {
  
  @EnvironmentObject var auth: Authentication

  @ObservedObject var presenter: ProfilePresenter

    var body: some View {
      VStack {
      Text(auth.user.email)
      Text(auth.user.username)
        logoutButton
      }
    }
  
}

extension ProfileView {
  
  var logoutButton: some View {
    Button("Logout") {
      auth.signOut()
    }
  }
  
}

