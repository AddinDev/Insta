//
//  SignInRouter.swift
//  Insta
//
//  Created by addin on 05/07/21.
//

import SwiftUI

class SignInRouter {
  
  func makeSignUpView() -> some View {
    let useCase = Injection.init().provideSigner()
    let presenter = SignUpPresenter(useCase: useCase)
    return SignUpView(presenter: presenter)
  }
  
}
