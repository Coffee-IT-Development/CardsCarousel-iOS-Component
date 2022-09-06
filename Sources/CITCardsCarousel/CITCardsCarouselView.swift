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

public struct CITCardsCarouselView<SelectionValue, Content> : View where SelectionValue : Hashable, Content : View {
    @Environment(\.presentationMode) var presentationMode
    @State private var currentIndex = 0
    
    @Binding private var selection: Binding<SelectionValue>?
    private var config: CITCardsCarouselView.Configuration
    private var content: () -> Content
    
//    private let tutorialItems = TutorialItemData.all
    
    private var isOnFirstPage: Bool {
        currentIndex == 0
    }
    
    private var isOnLastPage: Bool {
        currentIndex + 1 == tutorialItems.count
    }
    
    private var leftButtonImage: UIImage {
        isOnFirstPage ? CITAsset.Images.icClose.image : CITAsset.Images.icBack.image
    }
    
    private var rightButtonImage: UIImage? {
        isOnLastPage ? nil : CITAsset.Images.icNext.image
    }
    
    private var rightButtonText: String? {
        isOnLastPage ? CITLocalizable.tutorialFinishButton : nil
    }
    
    public init(
        selection: Binding<SelectionValue>? = nil,
        config: CITCardsCarouselView.Configuration,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.selection = selection
        self.config = config
        self.content = content
    }
    
    public var body: some View {
        VStack {
            PaginationView(axis: .horizontal, showsIndicators: false) {
                ForEach(Array(tutorialItems.enumerated()), id: \.offset) { index, tutorialCardItem in
                    TutorialCard(tutorialCardItem: tutorialCardItem, showLogo: index == 0)
                        .padding(.horizontal, 24)
                }
            }
            .currentPageIndex($currentIndex.animation())
            .padding(.bottom, UIDevice.deviceSize == .small ? CGFloat(24) : CGFloat(32))
            
            HStack {
                Button(action: tappedLeftButton, label: {
                    Image(uiImage: leftButtonImage)
                })
                .buttonStyle(palette: .secondary, layout: .standard)
                .frame(width: Size.controlHeight)
                .cornerRadius(CornerRadius.medium)
                .transition(.opacity)
                
                if !isOnLastPage {
                    CustomPageControl(currentPage: currentIndex, numberOfPages: tutorialItems.count)
                        .transition(.scale)
                }
                
                Button(action: tappedRightButton, label: {
                    if let image = rightButtonImage {
                        Image(uiImage: image)
                            .renderingMode(.template)
                    }
                    if let text = rightButtonText {
                        Text(text)
                            .font(.buttonTextLarge)
                    }
                })
                .buttonStyle(palette: .primary, layout: .standard)
                .frame(maxWidth: isOnLastPage ? .greatestFiniteMagnitude : Size.controlHeight)
                .cornerRadius(CornerRadius.medium)
                .animation(.default)
            }
            .padding([.bottom, .horizontal], 24)
        }
        .padding(.top, 24)
        .background(Color.backgroundPrimary.ignoresSafeArea())
    }
    
    private func tappedLeftButton() {
        if isOnFirstPage {
            dismiss()
        } else {
            withAnimation {
                currentIndex -= 1
            }
        }
    }
    
    private func tappedRightButton() {
        if isOnLastPage {
            dismiss()
        } else {
            withAnimation {
                currentIndex += 1
            }
        }
    }
    
    private func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct CITCardsCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CITCardsCarouselView()
    }
}
