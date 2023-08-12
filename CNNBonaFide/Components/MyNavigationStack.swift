//
//  MyNavigationStack.swift
//  CNNBonaFide
//
//  Created by laptop MCO on 12/08/23.
//

/*
    MARK: REF: https://stackoverflow.com/questions/73700850/swiftui-navigationview-vs-navigationstack-for-ios-15-16
 */

import SwiftUI
struct MyNavigationStack<Content>: View where Content: View{
    
    @ViewBuilder var content: () -> Content
    var body: some View {
        if #available(iOS 16, *) {
            NavigationStack(root: content)
        } else {
            NavigationView(content: content)
        }
    }
}

