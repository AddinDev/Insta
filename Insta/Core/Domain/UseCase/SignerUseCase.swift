//
//  SignerUseCase.swift
//  Insta
//
//  Created by addin on 05/07/21.
//

import Foundation
import Combine

protocol SignerUseCaseProtocol {
  func signUp(email: String, password: String, username: String) -> AnyPublisher<Bool, Error>
  func signIn(email: String, password: String) -> AnyPublisher<Bool, Error>
  func logout() -> AnyPublisher<Bool, Error>
}

class SignerUseCase {
  
  let repository: Repository
  
  init(repository: Repository) {
    self.repository = repository
  }
  
}

extension SignerUseCase {
  
  func signUp(email: String, password: String, username: String) -> AnyPublisher<Bool, Error> {
    self.repository.signUp(email: email, password: password, username: username)
  }
  
  func signIn(email: String, password: String) -> AnyPublisher<Bool, Error> {
    self.repository.signIn(email: email, password: password)
  }
  
  func logout() -> AnyPublisher<Bool, Error> {
    self.repository.logout()
  }
  
}
