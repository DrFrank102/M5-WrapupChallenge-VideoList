//
//  ContentView.swift
//  M5-WrapupChallenge-VideoList
//
//  Created by Ian Howard on 8/6/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model:VideoModel
    @State private var searchText = ""
    
    var body: some View {
        
        VStack {
            NavigationView {
                
                List {
                    ForEach (searchResults){ video  in

                        NavigationLink (
                            destination: VideoDetail()
                                .onAppear(perform:
                                {
                                    model.determineCurrentVideo(video.id)
                                })
,
                            label: {
                                Text("\(video.title)")
                                    .multilineTextAlignment(.leading)
                            })

                    }
                }
                .searchable(text: $searchText)
                .foregroundColor(.black)
                .navigationBarTitle("All Videos")
            }
            .frame(width: 400.0)
        }
        .ignoresSafeArea()
        
    }
    
    var searchResults: [Video] {
        if searchText.isEmpty {
             return model.videos
         } else {
             return model.videos.filter {$0.title.contains(searchText) }
          }
     }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(VideoModel())
    }
}
