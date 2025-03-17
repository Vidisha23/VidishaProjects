//
//  Extensions.swift
//  PracticeTestSwiftUI
//
//  Created by Vidisha on 17/03/25.
//

import Foundation
import SwiftUI

extension View {
    func titleStyle() -> some View {
        modifier(CustomTitle())
    }
    
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}
