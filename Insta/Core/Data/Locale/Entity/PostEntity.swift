//
//  PostEntity.swift
//  Insta
//
//  Created by addin on 30/06/21.
//

import Foundation
import RealmSwift

class PostEntity: Object {
  
  @objc dynamic var id: String = ""
  @objc dynamic var caption: String = ""
  @objc dynamic var imageUrl: String = ""
  @objc dynamic var date: String = ""
  @objc dynamic var email: String = ""
  @objc dynamic var username: String = ""
  @objc dynamic var photoUrl: String? = nil
  
  override class func primaryKey() -> String? {
    return "id"
  }
  
}
