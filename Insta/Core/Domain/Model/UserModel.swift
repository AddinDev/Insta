//
//  UserModel.swift
//  Insta
//
//  Created by addin on 30/06/21.
//

import Foundation

struct UserModel: Identifiable, Equatable {
  
  var id: String = UUID().uuidString
  var email: String = ""
  var username: String = ""
  var photoUrl: String?
  
}
