//
//  SettingsUseCase.swift
//  Insta
//
//  Created by addin on 07/07/21.
//

import Foundation
import Combine

protocol SettingsUseCaseProtocol {
  
}

class SettingsUseCase {
  
  private let repository: Repository
  
  init(repository: Repository) {
    self.repository = repository
  }
  
}

extension SettingsUseCase: SettingsUseCaseProtocol {
  
}
