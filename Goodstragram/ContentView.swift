//
//  ContentView.swift
//  Goodstragram
//
//  Created by Bagus Triyanto on 04/07/20.
//  Copyright © 2020 Bagus Triyanto. All rights reserved.
//

import SwiftUI

struct StatusCard: View {
    var body: some View {
        VStack (spacing: 2) {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
            Text("user")
                .font(.footnote)
                .fontWeight(.light)
        }
        .padding(.horizontal)
        .padding(.top, 12)
    }
}

struct PostCard: View {
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                
                VStack(alignment: .leading) {
                    Text("instagram_user")
                        .bold()
                    Text("Location")
                        .foregroundColor(.secondary)
                        .font(.footnote)
                }
                
                Spacer()
                
                Button(action: {}) {
                    Text("...")
                }.foregroundColor(.primary)
            }
            .padding(.horizontal, 10)
            
            Image("bigsur")
                .resizable()
                .frame(height: 350)
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, -12)
            
            HStack (spacing: 20) {
                Button(action: {}) {
                    Image(systemName: "heart")
                    .resizable()
                        .frame(width: 24, height: 24)
                }
                .foregroundColor(.primary)
                
                Button(action: {}) {
                    Image(systemName: "message")
                    .resizable()
                        .frame(width: 24, height: 24)
                }
                .foregroundColor(.primary)
                
                Button(action: {}) {
                    Image(systemName: "paperplane")
                    .resizable()
                        .frame(width: 24, height: 24)
                }
                .foregroundColor(.primary)
                
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "bookmark")
                    .resizable()
                        .frame(width: 20, height: 24)
                }
                .foregroundColor(.primary)
                
            }
                .padding(10)
                
            VStack (alignment: .leading){
                Text("102 likes")
                    .font(.subheadline)
                    .bold()
                HStack {
                    Text("instagram_user1")
                        .font(.subheadline)
                        .bold()
                    Text("Instagram is a cool, huh? I never believe it before!")
                        .font(.subheadline)
                        .lineLimit(1)
                }
                
                HStack {
                    Text("instagram_user2")
                        .font(.subheadline)
                        .bold()
                    Text("Wow, lit!")
                        .font(.subheadline)
                        .lineLimit(1)
                }
                
                Text("View all 699 comments")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                
            }
                .padding(.horizontal, 10)
                .padding(.bottom, 10)
            
        }
    }
}

struct GoodstagramHome: View {
    var body: some View {
        NavigationView {
            ScrollView (.vertical, showsIndicators: false) {
                VStack {
                    ScrollView (.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach (0..<20) { _ in
                                StatusCard()
                            }
                            .animation(.spring())

                        }
                    }
                    
                    Divider()
                    
                    ForEach (0..<20) { _ in
                        PostCard()
                    }
                    .animation(.spring())
                    
                }
            }
            .navigationBarTitle("Goodstagram", displayMode: .inline)
            .navigationBarItems(leading:
                Image(systemName: "camera")
                    .resizable()
                    .frame(width: 30, height: 24),
                                trailing:
                Image(systemName: "paperplane")
                    .resizable()
                    .frame(width: 30, height: 24)
            )
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView: View {
    var body: some View {
        TabView {
            GoodstagramHome().tabItem {
                Image(systemName: "house.fill")
            }
            
            Text("Goodstagram").tabItem {
                Image(systemName: "magnifyingglass")
            }
            
            Text("Goodstagram").tabItem {
                Image(systemName: "plus.square")
            }
            
            Text("Goodstagram").tabItem {
                Image(systemName: "heart")
            }
            
            Text("Goodstagram").tabItem {
                Image(systemName: "person")
            }
        }
        .accentColor(.primary)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
