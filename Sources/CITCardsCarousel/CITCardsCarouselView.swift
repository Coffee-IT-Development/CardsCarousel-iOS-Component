//
//  CITCardsCarouselView.swift
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

public struct CITCardsCarouselView<Content> : View where Content : View {
    @Environment(\.presentationMode) var presentationMode
    
    @Binding private var selection: Int
    private var pageCount: Int
    private var config: CITCardsCarouselConfiguration
    private var content: () -> Content
    
    private var isOnFirstPage: Bool {
        selection == 0
    }
    
    private var isOnLastPage: Bool {
        selection + 1 == pageCount
    }
    
    private var leftButtonImage: Image {
        isOnFirstPage ? .init(systemName: "xmark") : .init(systemName: "arrow.left")
    }
    
    private var rightButtonImage: Image? {
        isOnLastPage ? nil : .init(systemName: "arrow.right")
    }
    
    private var rightButtonText: String? {
        isOnLastPage ? "Let's start" : nil
    }
    
    public init(
        selection: Binding<Int>,
        pageCount: Int, // As it is fiendishly hard to extract a view count from a ViewBuilder like Apple does, we can request developers to manually provide the amount.
        config: CITCardsCarouselConfiguration,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self._selection = selection
        self.pageCount = pageCount
        self.config = config
        self.content = content
    }
    
    public var body: some View {
        VStack {
            TabView(selection: $selection) {
                content()
                    .cornerRadius(config.cardCornerRadius)
                    .padding(24)
                    .padding(.bottom, 8)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            navigationButtons
                .padding([.bottom, .horizontal], 24)
        }
        .background(config.backgroundColor.ignoresSafeArea())
        .animation(.default)
    }
    
    private var navigationButtons: some View {
        HStack(spacing: 16) {
            Button(action: tappedLeftButton, label: {
                leftButtonImage
                    .frame(width: 20, height: 20)
                    .foregroundColor(config.tintColor)
                    .padding(16)
            })
            .background(config.primaryButtonTextColor)
            .cornerRadius(config.buttonCornerRadius)
            
            if !isOnLastPage {
                CITCardsCarouselPageControl(currentPage: selection, numberOfPages: pageCount)
            }
            
            Button(action: tappedRightButton, label: {
                rightButtonContent
                    .foregroundColor(config.primaryButtonTextColor)
                    .padding(16)
            })
            .background(config.tintColor)
            .cornerRadius(config.buttonCornerRadius)
        }
    }
    
    @ViewBuilder
    var rightButtonContent: some View {
        if let image = rightButtonImage {
            image
                .renderingMode(.template)
                .frame(width: 20, height: 20)
        }
        if let text = rightButtonText {
            Text(text)
                .font(config.buttonTextFont)
                .frame(maxWidth: .greatestFiniteMagnitude)
                .frame(height: nil)
        }
    }
    
    private func tappedLeftButton() {
        if isOnFirstPage {
            dismiss()
        } else {
            withAnimation {
                selection -= 1
            }
        }
    }
    
    private func tappedRightButton() {
        if isOnLastPage {
            dismiss()
        } else {
            withAnimation {
                selection += 1
            }
        }
    }
    
    private func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}
//
//struct CITCardsCarouselView_Previews: PreviewProvider {
//    static var previews: some View {
//        CITCardsCarouselView()
//    }
//}
