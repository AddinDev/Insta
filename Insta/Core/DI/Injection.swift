//
//  Injection.swift
//  Insta
//
//  Created by addin on 30/06/21.
//

import Foundation
import RealmSwift

final class Injection {
  
  private func provideRepo() -> Repository {
    let realm = try? Realm()

    let locale = LocaleDataSource.sharedInstance(realm)
    let remote = RemoteDataSource.sharedInstance
    
    return Repository(locale: locale, remote: remote)
  }
  
  func provideSigner() -> SignerUseCase {
    return SignerUseCase(repository: provideRepo())
  }
  
  func provideHome() -> HomeUseCase {
    return HomeUseCase(repository: provideRepo())
  }
  
  func provideSearch() -> SearchUseCase {
    return SearchUseCase(repository: provideRepo())
  }
  
  func provideUpload() -> UploadUseCase {
    return UploadUseCase(repository: provideRepo())
  }
  
  func provideProfile() -> ProfileUseCase {
    return ProfileUseCase(repository: provideRepo())
  }
  
  func provideSettings() -> SettingsUseCase {
    return SettingsUseCase(repository: provideRepo())
  }
  
}
