//
//  Date.swift
//  Insta
//
//  Created by addin on 08/07/21.
//

import Foundation

extension Date {
  func getFormattedDate(format: String) -> String {
    let dateformat = DateFormatter()
    dateformat.dateFormat = format
    return dateformat.string(from: self)
  }
}
