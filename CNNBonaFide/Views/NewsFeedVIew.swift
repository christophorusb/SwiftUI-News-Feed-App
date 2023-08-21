//
//  NewsFeedVIew.swift
//  CNNBonaFide
//
//  Created by Christophorus Beneditto Aditya Satrio on 15/08/23.
//

import SwiftUI
import Combine

struct NewsFeedView: View {
    
    @StateObject private var newsViewModel = NewsViewModel()
    @StateObject var navigationViewModel = NavigationViewModel()
    @State private var currentJumbotronSelection: Int = 0
    
    func checkIsStillPreviousContent(currentContent: NavigationViewModel.FeedContentToBeRendered) -> Bool{
        if currentContent == navigationViewModel.previousRenderedContent {
            return true
        }
        
        navigationViewModel.previousRenderedContent = currentContent
        return false
    }
    
    var body: some View {
        MyNavigationStack {
            ZStack{
                Color("PrimaryBG").edgesIgnoringSafeArea(.all)
                
                if newsViewModel.isLoading == true {
                    LoadingSpinner(scaleMultiplier: 1.7, isIncludeText: true)
                }
                else {
                    // Main content
                    ScrollView{
                        FeedContentView(newsResponseModel: newsViewModel.newsResponse)
                    }
                    .refreshable{
                        newsViewModel.getAll()
                    }
                    .padding(.top, 122)
                }
                // Top Nav
                TopNavBar(navigationViewModelInstance: navigationViewModel)
            }
        }
        .onReceive(navigationViewModel.$selectedContentTobeRendered) { val in
            print("TRIGGERED: \(val)")
            
            switch val {
            case .tech:
                print("Rendering Tech Content")
                
                let isStillPreviousContent = checkIsStillPreviousContent(currentContent: val)
                print("Is still the same content? \(isStillPreviousContent)")
                
                if isStillPreviousContent == false {
                    newsViewModel.getAll(byCategory: "TECHNOLOGY")
                }
                
            case .economy:
                print("Rendering Economy Content")
                
                let isStillPreviousContent = checkIsStillPreviousContent(currentContent: val)
                print("Is still the same content? \(isStillPreviousContent)")
                
                if isStillPreviousContent == false {
                    newsViewModel.getAll(byCategory: "ECONOMY")
                }
                
            case .international:
                print("Rendering International Content")
                
                let isStillPreviousContent = checkIsStillPreviousContent(currentContent: val)
                print("Is still the same content? \(isStillPreviousContent)")
                
                if isStillPreviousContent == false {
                    newsViewModel.getAll(byCategory: "INTERNATIONAL")
                }

            case .entertainment:
                print("Rendering Entertainment Content")
                
                let isStillPreviousContent = checkIsStillPreviousContent(currentContent: val)
                print("Is still the same content? \(isStillPreviousContent)")
                
                if isStillPreviousContent == false {
                    newsViewModel.getAll(byCategory: "ENTERTAINMENT")
                }
               
            default:
                print("Rendering Nothing")
                break
            }
        }
    }
}

struct NewsFeedView_Previews: PreviewProvider {
    static var previews: some View {
        NewsFeedView()
    }
}

//    .onReceive(navigationViewModel.$contentToBeRendered.removeDuplicates()) { newVal in
//        switch newVal {
//        case .tech:
//            print("Rendering Tech Content")
//            //newsViewModel.getAll(byCategory: "TECHNOLOGY")
//        case .economy:
//            print("Rendering Economy Content")
//            //newsViewModel.getAll(byCategory: "ECONOMY")
//        case .international:
//            print("Rendering International Content")
//            //newsViewModel.getAll(byCategory: "INTERNATIONAL")
//        case .entertainment:
//            print("Rendering Entertainment Content")
//            //newsViewModel.getAll(byCategory: "ENTERTAINMENT")
//        default:
//            print("Rendering Nothing")
//            break
//        }
//    }
