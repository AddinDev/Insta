//
//  ProfilePresenter.swift
//  Insta
//
//  Created by addin on 07/07/21.
//

import SwiftUI
import Combine

class ProfilePresenter: ObservableObject {
  
  private var useCase: ProfileUseCase
  
  @Published var isLoading = false
  @Published var isError = false
  
  @Published var errorMessage = ""
  private var cancellables: Set<AnyCancellable> = []
  
  
  init(useCase: ProfileUseCase) {
    self.useCase = useCase
  }
  
}
