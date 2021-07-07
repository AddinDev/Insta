//
//  HomeView.swift
//  Insta
//
//  Created by addin on 30/06/21.
//

import SwiftUI

struct HomeView: View {
  
  @ObservedObject var presenter: HomePresenter
  
  var body: some View {
    content
  }
  
}

extension HomeView {
  
  var content: some View {
    Text("A")
  }
  
}
