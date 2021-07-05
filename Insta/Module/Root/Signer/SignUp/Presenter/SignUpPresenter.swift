//
//  SignUpPresenter.swift
//  Insta
//
//  Created by addin on 05/07/21.
//

import Foundation

import SwiftUI
import Combine

class SignUpPresenter: ObservableObject {
  
  //  private var router = SearchRouter()
  private var useCase: SignerUseCase
  
  @Published var isLoading = false
  @Published var isError = false
  
  @Published var errorMessage = ""
  @Published var searchText = String()
  
  private var cancellables: Set<AnyCancellable> = []
  
  
  init(useCase: SignerUseCase) {
    self.useCase = useCase
  }
  
  func signUp(_ email: String, _ password: String, _ username: String, action: @escaping () -> Void) {
    self.isLoading = true
    self.isError = false
    self.errorMessage = ""
    useCase.signUp(email: email, password: password, username: username)
      .sink { completion in
        switch completion {
          case .failure(let error):
            self.errorMessage = error.localizedDescription
            self.isError = true
            self.isLoading = false
          case .finished:
            self.isLoading = false
            action()
        }
      } receiveValue: { _ in
      }
      .store(in: &cancellables)
  }
  
}
