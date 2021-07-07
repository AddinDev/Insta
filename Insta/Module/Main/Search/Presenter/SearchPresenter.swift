//
//  SearchPresenter.swift
//  Insta
//
//  Created by addin on 07/07/21.
//

import SwiftUI
import Combine

class SearchPresenter: ObservableObject {
  
  private var useCase: SearchUseCase
  
  @Published var isLoading = false
  @Published var isError = false
  
  @Published var errorMessage = ""
  private var cancellables: Set<AnyCancellable> = []
  
  
    init(useCase: SearchUseCase) {
      self.useCase = useCase
    }
  
}
