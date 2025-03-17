//
//  CustomModifiers.swift
//  PracticeTestSwiftUI
//
//  Created by Vidisha on 17/03/25.
//

import Foundation
import SwiftUI

struct CustomTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.primary)
            .padding()
    }
}
struct Watermark: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundStyle(.black)
                .padding(5)
        }
    }
}
