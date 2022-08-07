//
//  VideoDetail.swift
//  M5-WrapupChallenge-VideoList
//
//  Created by Ian Howard on 8/7/22.
//

import SwiftUI
import AVKit

struct VideoDetail: View {
    
    @EnvironmentObject var model:VideoModel
    
    var body: some View {
        
        let video = model.currentVideo
        
        // Create a url object
        let url = URL(string: video?.url ?? "")
        
        // sample.mp4 is 1920 x 1080
        let videoRatio: CGFloat =  1080 / 1920
        
        
        VStack (alignment:.leading) {
            
            // Only show video if we get a valid url
            if url != nil {
                
                VStack {
                    Text(video!.title)
                        .font(.title)
                        .bold()
                        .padding()
                    
                    GeometryReader { geo in
                        VideoPlayer (player: AVPlayer (url: url!))
                            .frame(height: (geo.size.width-30) * videoRatio)
                            .cornerRadius(10)
                    }
                }
                
            }
        }
        .padding()
    }
}


struct VideoDetail_Previews: PreviewProvider {
    static var previews: some View {
        VideoDetail()
            .environmentObject(VideoModel())
        
    }
}
