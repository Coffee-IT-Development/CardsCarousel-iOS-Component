//
//  CITCardsCarouselPageControl.swift
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

struct CITCardsCarouselPageControl: View {
    let currentPage: Int
    let numberOfPages: Int
    let config: CITCardsCarouselConfiguration = .example

    var body: some View {
        HStack(spacing: config.indicatorSpacing) {
            Spacer()
            
            ForEach(0 ..< numberOfPages, id: \.self) { index in
                Circle()
                    .foregroundColor(index <= currentPage ? config.activeIndicatorColor : config.inactiveIndicatorColor)
                    .frame(width: config.indicatorSize, height: config.indicatorSize)
            }
            
            Spacer()
        }
    }
}

struct CustomPageView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CITCardsCarouselPageControl(currentPage: 3, numberOfPages: 10)
            CITCardsCarouselPageControl(currentPage: 2, numberOfPages: 5)
            CITCardsCarouselPageControl(currentPage: 1, numberOfPages: 3)
            CITCardsCarouselPageControl(currentPage: 0, numberOfPages: 5)
        }
    }
}
