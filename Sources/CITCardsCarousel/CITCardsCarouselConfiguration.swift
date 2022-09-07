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
    
    /// The padding around the card container. Defaults to `.init(top: 24, leading: 24, bottom: 32, trailing: 24)`.
    public var cardPadding: EdgeInsets
    
    /// The padding around the navigation buttons. Defaults to `.init(top: 0, leading: 24, bottom: 24, trailing: 24)`.
    public var navigationButtonsPadding: EdgeInsets
    
    /// The spacing between the navigation buttons. Defaults to `16`.
    public var navigationButtonsSpacing: CGFloat
    
    
//                            public var buttonSize: CGSize // Force a certain size?
    
    /// The padding around the navigation button content. Defaults to `init(top: 16, leading: 16, bottom: 16, trailing: 16)`.
    public var navigationButtonContentPadding: EdgeInsets
    
    /// The squared size of navigation button icons, i.e. 􀆄, 􀄪 and 􀄫. Defaults to `20`.
    public var navigationButtonIconSize: CGFloat
    
    /// The dismiss icon used in the navigation buttons. Defaults to `􀆄`.
    public var navigationButtonDismissIcon: Image
    
    /// The previous icon used in the navigation buttons. Defaults to `􀄪`.
    public var navigationButtonPreviousIcon: Image
    
    /// The next icon used in the navigation buttons. Defaults to `􀄫`.
    public var navigationButtonNextIcon: Image
    
    /// The finish text used in the right navigation button on the last page. Defaults to `Let's start`.
    public var navigationButtonFinishText: String
    
    /// The tint color of all carousel elements if not overidden. Including primary button background color, secondary button text color and indicator color.
    public var tintColor: Color
    
    /// The backgroundColor of the carousel view, i.e. the area arround the card.
    public var backgroundColor: Color
    
    /// The text color of content within the primary buttons, i.e. the right navigation button. Defaults to `.white`.
    public var primaryButtonForegroundColor: Color
    
    /// The background color of primary buttons, i.e. the right navigation button. Defaults to `tintColor`.
    public var primaryButtonBackgroundColor: Color?
    
    /// The text color of content within the secondary buttons, i.e. the left navigation button. If `nil`, defaults to `tintColor`.
    public var secondaryButtonForegroundColor: Color?
    
    /// The background color of primary buttons, i.e. the left navigation button. Defaults to `primaryButtonTextColor`, which defaults to `white`.
    public var secondaryButtonBackgroundColor: Color?
    
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
        cardPadding: EdgeInsets                         = .init(top: 24, leading: 24, bottom: 32, trailing: 24),
        navigationButtonsPadding: EdgeInsets            = .init(top: 0, leading: 24, bottom: 24, trailing: 24),
        navigationButtonsSpacing: CGFloat               = 16,
        navigationButtonContentPadding: EdgeInsets      = .init(top: 16, leading: 16, bottom: 16, trailing: 16),
        navigationButtonIconSize: CGFloat               = 20,
        navigationButtonDismissIcon: Image              = .init(systemName: "xmark"),
        navigationButtonPreviousIcon: Image             = .init(systemName: "arrow.left"),
        navigationButtonNextIcon: Image                 = .init(systemName: "arrow.right"),
        navigationButtonFinishText: String              = "Let's start",
        tintColor: Color                                = .blue,
        backgroundColor: Color                          = .gray,
        primaryButtonForegroundColor: Color             = .white,
        primaryButtonBackgroundColor: Color?            = nil,
        secondaryButtonForegroundColor: Color?          = nil,
        secondaryButtonBackgroundColor: Color?          = nil,
        activeIndicatorColor: Color?                    = nil,
        inactiveIndicatorColor: Color?                  = nil,
        buttonTextFont: Font                            = .system(size: 16),
        cardCornerRadius: CGFloat                       = 24,
        buttonCornerRadius: CGFloat                     = 16,
        indicatorCornerRadius: CGFloat                  = .infinity,
        indicatorSpacing: CGFloat                       = 6,
        indicatorSize: CGFloat                          = 6
    ) {
        self.cardPadding = cardPadding
        self.navigationButtonsPadding = navigationButtonsPadding
        self.navigationButtonsSpacing = navigationButtonsSpacing
        self.navigationButtonContentPadding = navigationButtonContentPadding
        self.navigationButtonIconSize = navigationButtonIconSize
        self.navigationButtonDismissIcon = navigationButtonDismissIcon
        self.navigationButtonPreviousIcon = navigationButtonPreviousIcon
        self.navigationButtonNextIcon = navigationButtonNextIcon
        self.navigationButtonFinishText = navigationButtonFinishText
        self.tintColor = tintColor
        self.backgroundColor = backgroundColor
        self.primaryButtonForegroundColor = primaryButtonForegroundColor
        self.primaryButtonBackgroundColor = primaryButtonBackgroundColor ?? tintColor
        self.secondaryButtonForegroundColor = secondaryButtonForegroundColor ?? tintColor
        self.secondaryButtonBackgroundColor = secondaryButtonBackgroundColor ?? primaryButtonForegroundColor
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