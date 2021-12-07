//
//  strings.extenstion.swift
//  Horimiya-swift
//
//  Created by Emmanuel Mclean on 20/11/2021.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
      return prefix(1).uppercased() + self.lowercased().dropFirst()
    }

    mutating func capitalizeFirstLetter() {
      self = self.capitalizingFirstLetter()
    }
}
