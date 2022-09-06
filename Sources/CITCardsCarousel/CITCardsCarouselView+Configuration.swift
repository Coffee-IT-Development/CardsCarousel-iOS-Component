//
//  CITCardsCarouselView+Configuration.swift
//
//  MIT License
//
//  Copyright (c) 2022 Coffee IT
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import SwiftUI

extension CITCardsCarouselView {
    public struct Configuration: Equatable {
        /// The tint color of all carousel elements if not overidden. Including primary button background color, secondary button text color and indicator color.
        public var tintColor: Color
        
        /// The backgroundColor of the carousel view, i.e. the area arround the card.
        public var backgroundColor: Color
        
        /// The text color of content within the primary buttons. Defaults to `.white`.
        public var primaryButtonTextColor: Color
        
        /// The text color of content within the primary buttons. If `nil`, defaults to `tintColor`.
        public var secondaryButtonTextColor: Color?
        
        /// The color of active indicators. If `nil`, defaults to `tintColor`.
        public var activeIndicatorColor: Color?
        
        /// The color of inactive indicators. If `nil`, defaults to `tintColor` with `0.5 opacity`.
        public var inactiveIndicatorColor: Color?
        
        /// The corner radius of the card. Defaults to `24`.
        public var cardCornerRadius: CGFloat
        
        /// The corner radius of the buttons. Defaults to `16`.
        public var buttonCornerRadius: CGFloat
        
        /// The corner radius of the indicators. Defaults to `.infinity` to make them round.
        public var indicatorCornerRadius: CGFloat
        
        public init(
            tintColor: Color                      = .blue,
            backgroundColor: Color                = .gray,
            primaryButtonTextColor: Color         = .white,
            secondaryButtonTextColor: Color?      = nil,
            activeIndicatorColor: Color?          = nil,
            inactiveIndicatorColor: Color?        = nil,
            cardCornerRadius: CGFloat             = 24,
            buttonCornerRadius: CGFloat           = 16,
            indicatorCornerRadius: CGFloat        = .infinity
        ) {
            self.tintColor = tintColor
            self.backgroundColor = backgroundColor
            self.primaryButtonTextColor = primaryButtonTextColor
            self.secondaryButtonTextColor = secondaryButtonTextColor ?? tintColor
            self.activeIndicatorColor = activeIndicatorColor ?? tintColor
            self.inactiveIndicatorColor = inactiveIndicatorColor ?? tintColor.opacity(0.5)
            self.cardCornerRadius = cardCornerRadius
            self.buttonCornerRadius = buttonCornerRadius
            self.indicatorCornerRadius = indicatorCornerRadius
        }
    }
}
