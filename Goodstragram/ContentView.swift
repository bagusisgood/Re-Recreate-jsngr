//
//  ContentView.swift
//  Goodstragram
//
//  Created by Bagus Triyanto on 04/07/20.
//  Copyright © 2020 Bagus Triyanto. All rights reserved.
//

import SwiftUI

// New Elements
struct SectionTitle: View {
    let section: String
    var body: some View {
        Text(section)
            .font(.headline)
            .bold()
            .foregroundColor(.primary)
            .multilineTextAlignment(.leading)
    }
}

struct GMTextElement: View {
    let element: String
    
    var body: some View {
        Text(element)
            .font(.subheadline)
            .bold()
            .foregroundColor(.white)
    }
}

struct GoodMorning: View {
    let userName: String
    let userImage: String
    let followers: Int
    let following: Int
    let dM: Int
    let tagPost: Int
    let tagStories: Int
    
    let specialColor = LinearGradient(gradient: Gradient(colors: [.blue, .purple, .pink, .yellow]), startPoint: .topLeading, endPoint: .bottomTrailing)
    
    var body: some View {
        HStack {
            StatusCard(userName: userName, userImage: userImage)
            
            Divider()
            
            VStack (alignment: .leading, spacing: 5) {
                HStack {
                    GMTextElement(element: "\(followers) followers")
                    Spacer()
                    GMTextElement(element: "\(following) following")
                }
                Spacer()
                VStack (alignment: .leading, spacing: 5) {
                    GMTextElement(element: "\(dM) - new DM")
                    
                    GMTextElement(element: "\(tagPost) - new tagged in Post")
                    
                    GMTextElement(element: "\(tagStories) - new tagged in Stories")
                }
                
            }
            
        }
        .frame(width: 350, height: 85)
        .padding(20)
        .background(specialColor)
        .cornerRadius(20)
        .foregroundColor(.white)
        .shadow(color: .secondary, radius: 2, x: 1, y: 1)
        
    }
}

struct NewStatusCard: View {
    let userName: String
    let userStatus: String
    
    var body: some View {
        ZStack {
            Image(userStatus)
                .resizable()
                .frame(width: 120, height: 180)
                .scaledToFill()
            VStack {
                Spacer()
                Text(userName)
                    .foregroundColor(.white)
                    .padding()
            }
        }
        .frame(width: 120, height: 180)
        .cornerRadius(10)
    }
}

struct StatusScrollView: View {
    var userId = [1456, 1678, 1940, 2647, 4782, 1904, 1638, 3216, 8743, 6811, 0567, 6517, 6586, 1538, 7879, 2091, 3761, 5390, 5908, 9815, 0914, 2043]
    
    var postImage = ["bigsur", "bigsurdark"]
    
    var body: some View {
        ScrollView (.horizontal, showsIndicators: false) {
            HStack {
                ForEach (0..<20) { item in
                    NewStatusCard(userName: "user_\(self.userId.randomElement() ?? 123)", userStatus: "\(self.postImage.randomElement() ?? "bigsur")")
                }
                .animation(.spring())

            }
            .shadow(color: .secondary, radius: 3, x: 1, y: 1)
        }
        .padding(.leading)
    }
}

struct NewPostCard: View {
    var userName: String
    var userImage: String
    var postLocation = "Big Sur"
    var postImage: String
    var numberOfLikes = 0
    var totalComments = 0
    
    var body: some View {
        ZStack {
            PostCardImage(postImage: postImage)
            
            VStack (alignment: .leading) {
            PostCardHeader(userName: userName, userImage: userImage, postLocation: postLocation)
                .padding(3)
                .background(Color.white.opacity(0.6))
                .cornerRadius(10)
            
            Spacer()
                
            VStack (alignment: .leading){
                PostCardButtonGroup()
                
                HStack {
                PostCardLikes(numberOfLikes: numberOfLikes)
                    
                Spacer()

                PostCardTotalComments(totalComments: totalComments)
                }
                
            }
                .padding(8)
                .background(Color.white.opacity(0.5))
                .cornerRadius(10)
                
            }
            //.padding(10)
            
        }
        .frame(width: 350, height: 300)
        .background(Color.yellow)
        .cornerRadius(20)
        .shadow(color: .secondary, radius: 3, x: 1, y: 1)
    }
}

struct NavBarButton: View {
    var button: String
    
    var body: some View {
        Image(systemName: button)
        .resizable()
        .frame(width: 30, height: 30)
    }
}

struct Help: View {
    var body: some View {
        NavigationView  {
            Text("Help Center")
        }
    }
}

struct Explore: View {
    var body: some View {
        NavigationView {
            Text("Explore")
        }
    }
}

struct StatusCard: View {
    let userName: String
    let userImage: String
    
    var body: some View {
        VStack (spacing: 2) {
            Image(userImage)
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .shadow(color: .secondary, radius: 2, x: 2, y: 2)
            Text(userName)
                .font(.footnote)
                .fontWeight(.medium)
        }
        .padding(.horizontal, 8)
        .padding(.top, 12)
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
    var postImage = ["gots8", "wws1", "wws2", "wws3"]
    var numberOfLikesComments = [13, 269, 167, 47, 14, 20, 96, 132, 94, 129, 64, 903, 694, 21, 509, 40, 94]
    var userComments = ["That's cool pic!", "Amazing photo!", "Wish I were there", "Is this real?", "Goodstagram is lit!", "Hello?", "How did you take these?", "Can't say a thing!", "Jaw-dropping!", "WOW!!!", "Hi there?"]
    var locations = ["Apple Park", "Big Sur", "Catalina", "High Sierra", "Mojave", "NASA", "HBO"]
    
    var body: some View {
        NavigationView {
            VStack (alignment: .center) {
            
                HStack {
                    SectionTitle(section: "Good Morning, Bagus!")
                    Spacer()
                }
                .padding(.leading)
                .padding(.top, 15)
            
            GoodMorning(userName: "@bagusisgood", userImage: "bagussquare", followers: 120, following: 50, dM: 3, tagPost: 4, tagStories: 7)
                
                
            Divider()
            
            ScrollView (.horizontal, showsIndicators: false) {
                HStack (spacing: 15) {
                    ForEach (0..<20) { _ in
                        NewPostCard(
                            userName: "user_\(self.userId.randomElement() ?? 1234)",
                            userImage: "person.crop.circle.fill",
                            postLocation: "\(self.locations.randomElement() ?? "Undisclosed Location")",
                            postImage: "\(self.postImage.randomElement() ?? "wws3")",
                            numberOfLikes: self.numberOfLikesComments.randomElement() ?? 100,
                            totalComments: self.numberOfLikesComments.randomElement() ?? 100)
                    }
                    .animation(.spring())
                    
                }
            }
            .padding(.leading)
                
                Divider()
                    
                HStack {
                    SectionTitle(section: "Top Stories")
                    Spacer()
                }
                .padding(.leading)
                
                StatusScrollView()
                
            }
            .navigationBarTitle("Goodstagram", displayMode: .inline)
            .navigationBarItems(leading:
                NavigationLink(destination: Help()){
                    NavBarButton(button: "questionmark.circle")
                    
                },
                                trailing:
                NavigationLink(destination: Explore()){
                    NavBarButton(button: "magnifyingglass")
                    
                }
                
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
            
            Text("Add Stories").tabItem {
                Image(systemName: "camera")
            }
            
            Text("New Post").tabItem {
                Image(systemName: "plus.square")
            }
            
            Text("Dashboard").tabItem {
                Image(systemName: "heart")
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
