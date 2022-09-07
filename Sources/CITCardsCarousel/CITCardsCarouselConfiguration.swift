//
//  CITCardsCarouselConfiguration.swift
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

/// Normally we add Configuration as an extension to the core view, like CITCardsCarouselView+Configuration, however, due to CITCardsCarouselView's generic constraints, that would complicate internal code.
public struct CITCardsCarouselConfiguration: Equatable {
    
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
    
    /// The font used for all button texts, i.e. the skip and continue button below the center card.
    public var buttonTextFont: Font
    
    /// The corner radius of the card. Defaults to `24`.
    public var cardCornerRadius: CGFloat
    
    /// The corner radius of the buttons. Defaults to `16`.
    public var buttonCornerRadius: CGFloat
    
    /// The corner radius of the indicators. Defaults to `.infinity` to make them round.
    public var indicatorCornerRadius: CGFloat
    
    /// The spacing between indicators. Defaults to `6`.
    public var indicatorSpacing: CGFloat
    
    /// The size of each indicator, determines both width and height of circle. Defaults to `6`.
    public var indicatorSize: CGFloat
    
    public init(
        tintColor: Color                        = .blue,
        backgroundColor: Color                  = .gray,
        primaryButtonTextColor: Color           = .white,
        secondaryButtonTextColor: Color?        = nil,
        activeIndicatorColor: Color?            = nil,
        inactiveIndicatorColor: Color?          = nil,
        buttonTextFont: Font                    = .system(size: 16),
        cardCornerRadius: CGFloat               = 24,
        buttonCornerRadius: CGFloat             = 16,
        indicatorCornerRadius: CGFloat          = .infinity,
        indicatorSpacing: CGFloat               = 6,
        indicatorSize: CGFloat                  = 6
    ) {
        self.tintColor = tintColor
        self.backgroundColor = backgroundColor
        self.primaryButtonTextColor = primaryButtonTextColor
        self.secondaryButtonTextColor = secondaryButtonTextColor ?? tintColor
        self.activeIndicatorColor = activeIndicatorColor ?? tintColor
        self.inactiveIndicatorColor = inactiveIndicatorColor ?? tintColor.opacity(0.5)
        self.buttonTextFont = buttonTextFont
        self.cardCornerRadius = cardCornerRadius
        self.buttonCornerRadius = buttonCornerRadius
        self.indicatorCornerRadius = indicatorCornerRadius
        self.indicatorSpacing = indicatorSpacing
        self.indicatorSize = indicatorSize
    }
    
    public static var example = CITCardsCarouselConfiguration()
}
