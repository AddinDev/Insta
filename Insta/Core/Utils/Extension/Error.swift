//
//  Error.swift
//  Insta
//
//  Created by addin on 30/06/21.
//

import Foundation

enum CustomError: LocalizedError {
  
  case invalidInstance
  case requestFailed
  case test
  
  var errorDescription: String? {
    switch self {
      case .invalidInstance: return "Database can't instance."
      case .requestFailed: return "Your request failed."
      case .test: return "test"
    }
  }
  
}
