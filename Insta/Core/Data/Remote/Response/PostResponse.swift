//
//  PostResponse.swift
//  Insta
//
//  Created by addin on 08/07/21.
//

import Foundation

struct PostResponse {
  
  let id: String = UUID().uuidString
  let caption: String?
  let imageUrl: String
  let date: String
  let user: UserModel
  
}
