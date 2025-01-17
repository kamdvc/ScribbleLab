//
//  CircleCheckboxModel.swift
//  ScribbleLab
//
//  Copyright (c) 2023 - 2024 ScribbleLabApp.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import UIKit
import SwiftUI
import Foundation

enum ThemeState: Equatable {
    case alwaysDark
    case alwaysLight
    case systemSettings
}

class CircleCheckboxModel: ObservableObject {
    @Published var useSystemColor: Bool = true
    
    @Published var selectedTheme: ThemeState = .alwaysLight
    @Published var currentAppTheme: ColorScheme = .light
    
    func switchTheme() {
        switch selectedTheme {
        case .alwaysDark:
            currentAppTheme = .dark
        case .alwaysLight:
            currentAppTheme = .light
        case .systemSettings:
//            currentAppTheme = ColorScheme.current
            if let colorScheme = UIApplication.shared.windows.first?.traitCollection.userInterfaceStyle {
                currentAppTheme = colorScheme == .dark ? .dark : .light
            }
        }
    }
}
