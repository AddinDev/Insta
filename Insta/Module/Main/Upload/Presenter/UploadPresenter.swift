//
//  UploadPresenter.swift
//  Insta
//
//  Created by addin on 07/07/21.
//

import SwiftUI
import Combine

class UploadPresenter: ObservableObject {
  
  private var useCase: UploadUseCase
  
  @Published var isLoading = false
  @Published var isError = false
  
  @Published var errorMessage = ""
  private var cancellables: Set<AnyCancellable> = []
  
  
  init(useCase: UploadUseCase) {
    self.useCase = useCase
  }
  
  func upload(post: UploadPostModel, action: @escaping () -> Void) {
    self.isLoading = true
    useCase.uploadPost(post: post)
      .receive(on: RunLoop.main)
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
      }.store(in: &cancellables)
  }
  
}
