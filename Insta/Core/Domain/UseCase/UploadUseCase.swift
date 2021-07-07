//
//  UploadUseCase.swift
//  Insta
//
//  Created by addin on 07/07/21.
//

import Foundation
import Combine

protocol UploadUseCaseProtocol {
  
}

class UploadUseCase {
  
  private let repository: Repository
  
  init(repository: Repository) {
    self.repository = repository
  }
  
}

extension UploadUseCase: UploadUseCaseProtocol {
  
}
