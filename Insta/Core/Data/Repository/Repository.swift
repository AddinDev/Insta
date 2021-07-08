//
//  Repository.swift
//  Insta
//
//  Created by addin on 30/06/21.
//

import Foundation
import Combine

protocol RepositoryProtocol {
  func signUp(email: String, password: String, username: String) -> AnyPublisher<Bool, Error>
  func signIn(email: String, password: String) -> AnyPublisher<Bool, Error>
  func logout() -> AnyPublisher<Bool, Error>
  
  func uploadPost(post: UploadPostModel) -> AnyPublisher<Bool, Error>

}

class Repository {
  
  typealias Repo = (LocaleDataSource, RemoteDataSource) -> Repository
  fileprivate let locale: LocaleDataSource
  fileprivate let remote: RemoteDataSource
  
  init(locale: LocaleDataSource, remote: RemoteDataSource) {
    self.locale = locale
    self.remote = remote
  }
  
  static let sharedInstance: Repo = { locale, remote in
    return Repository(locale: locale, remote: remote)
  }
  
}

extension Repository: RepositoryProtocol {
  
  func signUp(email: String, password: String, username: String) -> AnyPublisher<Bool, Error> {
    self.remote.signUp(email: email, password: password, username: username)
  }
  
  func signIn(email: String, password: String) -> AnyPublisher<Bool, Error> {
    self.remote.signIn(email: email, password: password)
  }
  
  func logout() -> AnyPublisher<Bool, Error> {
    self.remote.logout()
  }
  
  
  func uploadPost(post: UploadPostModel) -> AnyPublisher<Bool, Error> {
    self.remote.uploadPost(post: post)
  }
  
}
