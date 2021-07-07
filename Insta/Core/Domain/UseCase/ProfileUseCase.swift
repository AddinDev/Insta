//
//  ProfileUseCase.swift
//  Insta
//
//  Created by addin on 07/07/21.
//

import Foundation
import Combine

protocol ProfileUseCaseProtocol {
  
}

class ProfileUseCase {
  
  private let repository: Repository
  
  init(repository: Repository) {
    self.repository = repository
  }
  
}

extension ProfileUseCase: ProfileUseCaseProtocol {
  
}
