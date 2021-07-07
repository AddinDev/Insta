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
  
}
