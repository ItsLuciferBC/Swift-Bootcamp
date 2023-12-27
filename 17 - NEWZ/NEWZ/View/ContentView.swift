//
//  ContentView.swift
//  NEWZ
//
//  Created by Fahad Mansuri on 05.09.23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView{
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack{
                        Text("\(post.points)")
                        Text(post.title)
                    }
                }
            }
            .navigationTitle("NEWZ")
        }
        .onAppear(){
            self.networkManager.fetchdata()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//let posts = [
//    Post(id: "1", title: "Hello"),
//    Post(id: "2", title: "Bonjour"),
//    Post(id: "3", title: "Hola")
//]
