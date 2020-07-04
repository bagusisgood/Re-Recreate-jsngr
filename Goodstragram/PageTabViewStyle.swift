//
//  PageTabViewStyle.swift
//  Goodstragram
//
//  Created by Bagus Triyanto on 05/07/20.
//  Copyright © 2020 Bagus Triyanto. All rights reserved.
//
//  Learning PageTabViewStyle

import SwiftUI

struct TopPageView: View {
    var postImage = ["bigsur", "bigsurdark", "gots8", "wws1", "wws2", "wws3"]
    
    var body: some View {
        TabView {
            ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { _ in
                VStack (alignment: .leading) {
                    HStack {
                        VStack (alignment: .leading) {
                            Text("Some App")
                                .bold()
                            Text("Details & Stuffs")
                                .foregroundColor(.secondary)
                        }
                    }
                    
                    Image("\(self.postImage.randomElement() ?? "bigsur")")
                        .resizable()
                        .frame(height: 300)
                        .scaledToFit()
                }
            }
            .padding()
        }
        .frame(width: UIScreen.main.bounds.width, height: 350, alignment: .center)
        // .tabViewStyle(PageTabViewStyle()) iOS14!!!
    }
}

struct PageTabViewStyle: View {
    var body: some View {
        NavigationView {
            ScrollView {
                TopPageView()
                HStack {
                    Text("Popular Apps")
                        .font(.title)
                        .bold()
                        .padding(.leading)
                    
                    Spacer()
                    
                }
            }
            .navigationBarTitle("Good Apps")
            
        }
    }
}

struct PageTabViewStyle_Previews: PreviewProvider {
    static var previews: some View {
        PageTabViewStyle()
    }
}
