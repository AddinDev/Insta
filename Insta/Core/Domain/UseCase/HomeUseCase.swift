//
//  HomeUseCase.swift
//  Insta
//
//  Created by addin on 07/07/21.
//

import Foundation
import Combine

protocol HomeUseCaseProtocol {
  
}

class HomeUseCase {
  
  private let repository: Repository
  
  init(repository: Repository) {
    self.repository = repository
  }
  
}

extension HomeUseCase: HomeUseCaseProtocol {
  
}
