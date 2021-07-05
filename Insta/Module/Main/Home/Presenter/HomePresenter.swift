//
//  HomePresenter.swift
//  Insta
//
//  Created by addin on 05/07/21.
//

import SwiftUI
import Combine

class HomePresenter: ObservableObject {
  
//  private var router = HomeRouter()
//  private var useCase: HomeUseCase
  
//  @Published var posts: [PostModel] = []
//  @Published var users: [UserModel] = []
  
  @Published var isLoading = false
  @Published var isError = false
  
  @Published var errorMessage = ""
  private var cancellables: Set<AnyCancellable> = []
  
  
//  init(useCase: SearchUseCase) {
//    self.useCase = useCase
//  }

//  func getAllPosts() {
//    self.isLoading = true
//    self.isError = false
//    self.errorMessage = ""
//    useCase.getAllPosts()
//      .sink { completion in
//        switch completion {
//          case .failure(let error):
//            self.errorMessage = error.localizedDescription
//            self.isError = true
//            self.isLoading = false
//          case .finished:
//            self.isLoading = false
//        }
//      } receiveValue: { posts in
//        self.posts = posts
//      }
//      .store(in: &cancellables)
//  }
  
//  func linkToDetail<Content: View>(post: PostModel, @ViewBuilder content: () -> Content) -> some View {
//    NavigationLink(destination: router.makeDetailView(post: post)) { content() }
//  }
  
}
