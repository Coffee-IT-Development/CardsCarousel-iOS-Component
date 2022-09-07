//
//  CITCardsCarouselExampleView.swift
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

import CITCardsCarousel
import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    @State private var isShowingInSheet = false
    @State private var isShowingFullscreen = false
    
    var body: some View {
        VStack {
            exampleButton("Show cards carousel fullscreen", action: showCardsCarouselFullscreen)
            exampleButton("Show cards carousel in sheet", action: showCardsCarouselInSheet)
        }
        .fullScreenCover(isPresented: $isShowingFullscreen) {
            cardsCarousel
        }
        .sheet(isPresented: $isShowingInSheet) {
            cardsCarousel
        }
    }
    
    var cardsCarousel: some View {
        CITCardsCarouselView(selection: $selectedTab, pageCount: 4, config: .coloredExample) {
            card("A").tag(0)
            card("B").tag(1)
            card("C").tag(2)
            card("D").tag(3)
        }
    }
    
    private func card(_ name: String) -> some View {
        ZStack {
            Color.white
            Text(name)
        }
    }
    
    private func exampleButton(_ text: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(text)
                .padding()
                .foregroundColor(.carouselButtonTextColor)
                .background(Color.coffeeItColor)
                .cornerRadius(20)
        }
    }
    
    private func showCardsCarouselFullscreen() {
        selectedTab = 0
        isShowingFullscreen = true
    }
    
    private func showCardsCarouselInSheet() {
        selectedTab = 0
        isShowingInSheet = true
    }
}

extension CITCardsCarouselConfiguration {
    public static let coloredExample = CITCardsCarouselConfiguration(
        tintColor: .coffeeItColor,
        backgroundColor: .carouselBackgroundColor,
        primaryButtonForegroundColor: .carouselButtonTextColor
    )
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
