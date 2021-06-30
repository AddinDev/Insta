//
//  LocaleDataSource.swift
//  Insta
//
//  Created by addin on 30/06/21.
//

import Foundation
import Combine
import RealmSwift

protocol LocaleDataSourceProtocol {
  func savePost(_ post: PostEntity) -> AnyPublisher<Bool, Error>
}

class LocaleDataSource {
  
  let realm: Realm?
  
  init(realm: Realm?) {
    self.realm = realm
  }
  
  static let sharedInstance: (Realm?) -> LocaleDataSource = { realm in
    return LocaleDataSource(realm: realm)
  }
  
}

extension LocaleDataSource: LocaleDataSourceProtocol {
  
  func savePost(_ post: PostEntity) -> AnyPublisher<Bool, Error> {
    return Future<Bool, Error> { completion in
      if let realm = self.realm {
        do {
          try realm.write {
            realm.add(post)
            completion(.success(true))
          }
        } catch let error {
          completion(.failure(error))
        }
      } else {
        completion(.failure(CustomError.invalidInstance))
      }
    }
    .eraseToAnyPublisher()
  }
  
}
