//
//  RemoteDataSource.swift
//  Insta
//
//  Created by addin on 30/06/21.
//

import Foundation
import Combine
import Firebase

protocol RemoteDataSourceProtocol {
  func signUp(email: String, password: String, username: String) -> AnyPublisher<Bool, Error>
  func signIn(email: String, password: String) -> AnyPublisher<Bool, Error>
  func logout() -> AnyPublisher<Bool, Error>
}

class RemoteDataSource {
  
  private let db = Firestore.firestore()
  
  init() { }
  
  static let sharedInstance = RemoteDataSource()
  
}

extension RemoteDataSource: RemoteDataSourceProtocol {
  
  func signUp(email: String, password: String, username: String) -> AnyPublisher<Bool, Error> {
    return Future<Bool, Error> { completion in
      Auth.auth().createUser(withEmail: email, password: password) { result, error in
        if let error = error {
          completion(.failure(error))
          print("error: \(error)")
        } else {
          self.db.collection("Users")
            .document(email)
            .setData([
              "email": email,
              "username": username
            ]) { error in
              if let error = error {
                completion(.failure(error))
                print("error: \(error)")
              } else {
                completion(.success(true))
              }
            }
        }
      }
    }
    .eraseToAnyPublisher()
  }
  
  func signIn(email: String, password: String) -> AnyPublisher<Bool, Error> {
    return Future<Bool, Error > { completion in
      Auth.auth().createUser(withEmail: email, password: password) { result, error in
        if let error = error {
          completion(.failure(error))
          print("error: \(error)")
        } else {
          completion(.success(true))
        }
      }
    }
    .eraseToAnyPublisher()
  }
  
  func logout() -> AnyPublisher<Bool, Error> {
    return Future<Bool, Error > { completion in
      if Auth.auth().currentUser != nil {
        do {
          try Auth.auth().signOut()
          completion(.success(true))
        } catch let error {
          completion(.failure(error))
        }
      }
    }
    .eraseToAnyPublisher()
  }
  
}
