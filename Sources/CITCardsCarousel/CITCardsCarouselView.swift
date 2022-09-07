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
    
    @State private var offset: CGFloat
    
    private var isOnFirstPage: Bool {
        selection == 0
    }
    
    private var isOnLastPage: Bool {
        selection + 1 == pageCount
    }
    
    private var pageBaseOffsetMultiplier: CGFloat {
        (CGFloat(pageCount) / 2.0) - 0.5
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
        self._offset = State(initialValue: CGFloat(pageCount - 1) * UIScreen.main.bounds.width)
    }
    
    public var body: some View {
        VStack {
//            TabView(selection: $selection) {
////                ScrollViewReader { proxy in
//                content()
//                    .cornerRadius(config.cardCornerRadius)
//                    .padding(config.cardPadding)
//            }
//            .tabViewStyle(.page(indexDisplayMode: .never))

            
            HStack(spacing: 0) {
                content()
                    .frame(width: UIScreen.main.bounds.width)
                    .offset(x: -UIScreen.main.bounds.width * pageBaseOffsetMultiplier + offset)
            }
            .frame(width: UIScreen.main.bounds.width * CGFloat(pageCount))
//            .offset(x: offset)
            
//                GeometryReader { proxy in
////                    ScrollView(.horizontal) {
//                    content()
//                        .cornerRadius(config.cardCornerRadius)
//                        .padding(config.cardPadding)
//                        .gesture(DragGesture())
////                        .frame(width: UIScreen.main.bounds.width, height: proxy.size.height)
//                        .offset(x: offset)
////                    }
//                }
////            }
            
            navigationButtons
                .padding(config.navigationButtonsPadding)
        }
        .background(config.backgroundColor.ignoresSafeArea())
        .animation(.default)
    }
    
    private var navigationButtons: some View {
        HStack(spacing: 16) {
            Button(action: tappedLeftButton, label: {
                leftButtonContent
                    .frame(width: config.navigationButtonIconSize, height: config.navigationButtonIconSize)
                    .foregroundColor(config.secondaryButtonForegroundColor)
                    .padding(config.navigationButtonContentPadding)
            })
            .background(config.secondaryButtonBackgroundColor)
            .cornerRadius(config.buttonCornerRadius)
            
            if !isOnLastPage {
                CITCardsCarouselPageControl(currentPage: selection, numberOfPages: pageCount)
            }
            
            Button(action: tappedRightButton, label: {
                rightButtonContent
                    .foregroundColor(config.primaryButtonForegroundColor)
                    .padding(config.navigationButtonContentPadding)
            })
            .background(config.tintColor)
            .cornerRadius(config.buttonCornerRadius)
        }
    }
    
    private var leftButtonContent: some View {
        isOnFirstPage ? config.navigationButtonDismissIcon : config.navigationButtonPreviousIcon
    }
    
    @ViewBuilder
    private var rightButtonContent: some View {
        if isOnLastPage {
            finishText
        } else {
            config.navigationButtonNextIcon
                .renderingMode(.template)
                .frame(width: config.navigationButtonIconSize, height: config.navigationButtonIconSize)
        }
    }
    
    private var finishText: some View {
        Text(config.navigationButtonFinishText)
            .font(config.buttonTextFont)
            .frame(maxWidth: .greatestFiniteMagnitude)
    }
    
    private func tappedLeftButton() {
        if isOnFirstPage {
            dismiss()
        } else {
            withAnimation {
                offset += UIScreen.main.bounds.width
                selection -= 1
            }
        }
    }
    
    private func tappedRightButton() {
        if isOnLastPage {
            dismiss()
        } else {
            withAnimation {
                offset -= UIScreen.main.bounds.width
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
