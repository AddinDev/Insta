//
//  SignInPresenter.swift
//  Insta
//
//  Created by addin on 05/07/21.
//

import SwiftUI
import Combine

class SignInPresenter: ObservableObject {
  
  private var router = SignInRouter()
  private var useCase: SignerUseCase
  
  @Published var isLoading = false
  @Published var isError = false
  
  @Published var errorMessage = ""
  @Published var searchText = String()
  
  private var cancellables: Set<AnyCancellable> = []
  
  
  init(useCase: SignerUseCase) {
    self.useCase = useCase
  }
  
  func signIn(_ email: String, _ password: String, action: @escaping () -> Void) {
    self.isLoading = true
    self.isError = false
    self.errorMessage = ""
    useCase.signIn(email: email, password: password)
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
  
  func makeSignUpView() -> some View {
    router.makeSignUpView()
  }
  
}
