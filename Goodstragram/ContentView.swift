//
//  ContentView.swift
//  Goodstragram
//
//  Created by Bagus Triyanto on 04/07/20.
//  Copyright © 2020 Bagus Triyanto. All rights reserved.
//

import SwiftUI

struct NavBarButton: View {
    var button: String
    
    var body: some View {
        Image(systemName: button)
        .resizable()
        .frame(width: 30, height: 24)
    }
}

struct StatusCard: View {
    let userName: String
    let userImage: String
    
    var body: some View {
        VStack (spacing: 2) {
            Image(systemName: userImage)
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
            Text(userName)
                .font(.footnote)
                .fontWeight(.light)
        }
        .padding(.horizontal)
        .padding(.top, 12)
    }
}

struct StatusScrollView: View {
    var userId = [1456, 1678, 1940, 2647, 4782, 1904, 1638, 3216, 8743, 6811, 0567, 6517, 6586, 1538, 7879, 2091, 3761, 5390, 5908, 9815, 0914, 2043]
    
    var body: some View {
        ScrollView (.horizontal, showsIndicators: false) {
            HStack {
                ForEach (0..<20) { item in
                    StatusCard(userName: item == 0 ? "my_status" : "user_\(self.userId.randomElement() ?? 1234)", userImage: "person.crop.circle.fill")
                }
                .animation(.spring())

            }
        }
    }
}

struct PostCardHeader: View {
    let userName: String
    let userImage: String
    let postLocation: String
    
    var body: some View {
        HStack {
            Image(systemName: userImage)
                .resizable()
                .frame(width: 30, height: 30)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text(userName)
                    .bold()
                Text(postLocation)
                    .foregroundColor(.secondary)
                    .font(.footnote)
            }
            
            Spacer()
            
            Button(action: {}) {
                Text("...")
            }.foregroundColor(.primary)
        }
        .padding(.horizontal, 10)
    }
}

struct PostCardImage: View {
    let postImage: String
    
    var body: some View {
        Image(postImage)
        .resizable()
        .frame(height: 300)
        .scaledToFit()
        .padding(.horizontal, -12)
    }
}

struct PostCardButton: View {
    var buttonName: String
    
    var body: some View {
        Button(action: {}) {
            Image(systemName: buttonName)
            .resizable()
                .frame(width: 24, height: 24)
        }
        .foregroundColor(.primary)
    }
}

struct PostCardButtonGroup: View {
    
    var body: some View {
        HStack (spacing: 20) {
            PostCardButton(buttonName: "heart")
            PostCardButton(buttonName: "message")
            PostCardButton(buttonName: "paperplane")
            
            Spacer()
            
            PostCardButton(buttonName: "bookmark")
            
        }
            .padding(10)
    }
}

struct PostCardLikes: View {
    var numberOfLikes: Int
    
    var body: some View {
        Text("\(numberOfLikes) likes")
        .font(.subheadline)
        .bold()
    }
}

struct PostCardComments: View {
    var userName: String
    var userComment: String
    
    var body: some View {
        HStack {
            Text(userName)
                .font(.subheadline)
                .bold()
            Text(userComment)
                .font(.subheadline)
                .lineLimit(1)
        }
    }
}

struct PostCardTotalComments: View {
    let totalComments: Int
    
    var body: some View {
        Text("View all \(totalComments) comments")
        .font(.footnote)
        .foregroundColor(.secondary)
    }
}

struct PostCard: View {
    var userName: String
    var userImage: String
    var postLocation = "Big Sur"
    var postImage: String
    var numberOfLikes = 0
    var userFriend1: String
    var userComment1: String
    var userFriend2: String
    var userComment2: String
    var userFriend3: String
    var userComment3: String
    var totalComments = 0
    
    var body: some View {
        VStack (alignment: .leading) {
            PostCardHeader(userName: userName, userImage: userImage, postLocation: postLocation)
            
            PostCardImage(postImage: postImage)
            
            PostCardButtonGroup()
                
            VStack (alignment: .leading){
                PostCardLikes(numberOfLikes: numberOfLikes)
                
                PostCardComments(userName: userFriend1, userComment: userComment1)
                PostCardComments(userName: userFriend2, userComment: userComment2)
                PostCardComments(userName: userFriend3, userComment: userComment3)

                PostCardTotalComments(totalComments: totalComments)
                
            }
                .padding(.horizontal, 10)
                .padding(.bottom, 10)
            
        }
    }
}

struct GoodstagramHome: View {
    var userId = [1456, 1678, 1940, 2647, 4782, 1904, 1638, 3216, 8743, 6811, 0567, 6517, 6586, 1538, 7879, 2091, 3761, 5390, 5908, 9815, 0914, 2043]
    var postImage = ["bigsur", "bigsurdark", "gots8", "wws1", "wws2", "wws3"]
    var numberOfLikesComments = [13, 269, 167, 47, 14, 20, 96, 132, 94, 129, 64, 903, 694, 21, 509, 40, 94]
    var userComments = ["That's cool pic!", "Amazing photo!", "Wish I were there", "Is this real?", "Goodstagram is lit!", "Hello?", "How did you take these?", "Can't say a thing!", "Jaw-dropping!", "WOW!!!", "Hi there?"]
    var locations = ["Apple Park", "Big Sur", "Catalina", "High Sierra", "Mojave", "NASA", "HBO"]
    
    var body: some View {
        NavigationView {
            ScrollView (.vertical, showsIndicators: false) {
                VStack {
                    StatusScrollView()
                    
                    Divider()
                    
                    ForEach (0..<20) { _ in
                        PostCard(
                            userName: "user_\(self.userId.randomElement() ?? 1234)",
                            userImage: "person.crop.circle.fill",
                            postLocation: "\(self.locations.randomElement() ?? "Undisclosed Location")",
                            postImage: "\(self.postImage.randomElement() ?? "bigsur")",
                            numberOfLikes: self.numberOfLikesComments.randomElement() ?? 100 ,
                            userFriend1: "user_\(self.userId.randomElement() ?? 1234)", userComment1: "\(self.userComments.randomElement() ?? "Pretty Basic.")",
                            userFriend2: "user_\(self.userId.randomElement() ?? 1234)", userComment2: "\(self.userComments.randomElement() ?? "Pretty Basic.")",
                            userFriend3: "user_\(self.userId.randomElement() ?? 1234)", userComment3: "\(self.userComments.randomElement() ?? "Pretty Basic.")",
                            totalComments: self.numberOfLikesComments.randomElement() ?? 100)
                    }
                    .animation(.spring())
                    
                }
            }
            .navigationBarTitle("Goodstagram", displayMode: .inline)
            .navigationBarItems(leading:
                NavBarButton(button: "camera"),
                                trailing:
                NavBarButton(button: "paperplane")
                
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
            
            Text("Search").tabItem {
                Image(systemName: "magnifyingglass")
            }
            
            Text("New Post").tabItem {
                Image(systemName: "plus.square")
            }
            
            Text("Activities").tabItem {
                Image(systemName: "heart")
            }
            
            Text("Profile").tabItem {
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
