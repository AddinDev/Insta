//
//  UploadUseCase.swift
//  Insta
//
//  Created by addin on 07/07/21.
//

import Foundation
import Combine

protocol UploadUseCaseProtocol {
  func uploadPost(post: UploadPostModel) -> AnyPublisher<Bool, Error>
}

class UploadUseCase {
  
  private let repository: Repository
  
  init(repository: Repository) {
    self.repository = repository
  }
  
}

extension UploadUseCase: UploadUseCaseProtocol {
  
  func uploadPost(post: UploadPostModel) -> AnyPublisher<Bool, Error> {
    self.repository.uploadPost(post: post)
  }
  
}
