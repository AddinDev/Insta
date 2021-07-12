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
  
  // auth
  func signUp(email: String, password: String, username: String) -> AnyPublisher<Bool, Error>
  func signIn(email: String, password: String) -> AnyPublisher<Bool, Error>
  func logout() -> AnyPublisher<Bool, Error>
  
//  // post
  func uploadPost(post: UploadPostModel) -> AnyPublisher<Bool, Error>
//  func getFollowedPosts() -> AnyPublisher<[PostResponse], Error>
//  func getAllPosts() -> AnyPublisher<[PostResponse], Error>
//  
//  // user
//  func getUserDetail(email: String) -> AnyPublisher<UserModel, Error>
  
}

class RemoteDataSource {
  
  private let db = Firestore.firestore()
  
  private let storage = Storage.storage().reference()
  
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
      Auth.auth().signIn(withEmail: email, password: password) { result, error in
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
  
  func uploadPost(post: UploadPostModel) -> AnyPublisher<Bool, Error> {
    return Future<Bool, Error> { completion in
      if let userEmail = Auth.auth().currentUser?.email {
        let ref = self.storage.child("images/\(userEmail)/test.png")
//        self.storage.child("images")
        guard let compressedImage = post.image.jpegData(compressionQuality: 0.6) else { return }
        ref
          .putData(compressedImage, metadata: nil) { _, error in
            if let error = error {
              completion(.failure(error))
              print("error: \(error.localizedDescription)")
            } else {
//              self.storage.child("images")
              ref
                .downloadURL { url, error in
                  if let error = error {
                    completion(.failure(error))
                    print("error: \(error.localizedDescription)")
                  } else {
                    if let imageUrl = url?.absoluteString {
                      print("test imageurl: \(imageUrl)")
                      self.db.collection("Posts")
                        .addDocument(data: [
                          "photoUrl": imageUrl,
                          "caption": post.caption ?? "",
                          "date": post.date,
                          "email": post.user.email,
                          "username": post.user.username,
                          "userPhotoUrl": post.user.photoUrl ?? ""
                        ]) { error in
                          if let error = error {
                            completion(.failure(error))
                            print("error: \(error.localizedDescription)")
                          } else {
                            completion(.success(true))
                          }
                        }
                    }
                  }
                }
            }
          }
      }
    }
    .eraseToAnyPublisher()
  }
//
//  func getFollowedPosts() -> AnyPublisher<[PostResponse], Error>
//
//  func getAllPosts() -> AnyPublisher<[PostResponse], Error>
//
//  func getUserDetail(email: String) -> AnyPublisher<UserModel, Error>
  
}
