//
//  Repository.swift
//  Insta
//
//  Created by addin on 30/06/21.
//

import Foundation
import Combine

protocol RepositoryProtocol {
  
}

class Repository {
  
  typealias Repo = (LocaleDataSource, RemoteDataSource) -> Repository
  fileprivate let locale: LocaleDataSource
  fileprivate let remote: RemoteDataSource
  
  init(locale: LocaleDataSource, remote: RemoteDataSource) {
    self.locale = locale
    self.remote = remote
  }
  
  static let sharedInstance: Repo = { locale, remote in
    return Repository(locale: locale, remote: remote)
  }
  
}

extension Repository: RepositoryProtocol {
  
  
  
}
