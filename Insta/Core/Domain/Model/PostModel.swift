//
//  PostModel.swift
//  Insta
//
//  Created by addin on 30/06/21.
//

import Foundation

struct PostModel: Identifiable, Equatable {
  
  let id: String
  let caption: String
  let imageUrl: String
  let date: String
  let user: UserModel
  
}
