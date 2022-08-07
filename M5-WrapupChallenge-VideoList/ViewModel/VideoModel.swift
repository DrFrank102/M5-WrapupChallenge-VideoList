//
//  VideoModel.swift
//  M5-WrapupChallenge-VideoList
//
//  Created by Ian Howard on 8/7/22.
//

import Foundation

class VideoModel : ObservableObject {
    
    // Create an empty array of type Video
    // This var is used to flag changes to the model
    // and is an array of video
    @Published var videos = [Video]()
    
    // Current module - keep track of the currently selected module
    // maybe nil if the user had not yet selected a module
    @Published var currentVideo: Video?
    var currentVideoIndex = 0
    
    
    init() {
        
        getVideoData()
        
    }
    
    func getVideoData() {
        
        // ***********
        // * Get URL *
        // ***********
        
        // String path
        let urlString = "https://codewithchris.github.io/Module5Challenge/Data.json"
        
        // Create a url object
        let url = URL(string: urlString)
        
        guard url != nil else {
            // Couldn't create url
            return
        }
        
        // ******************
        // * Get URLRequest *
        // ******************
        let request = URLRequest(url: url!)
        
        // *************************
        // * Get Singleton Session *
        // *************************
        let session = URLSession.shared
        
        // *******************
        // * Start Data Task *
        // *******************
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            
            // Check if there is an error
            guard error == nil else {
                // There was an error
                return
            }
            
            do {
                // Create json decoder
                let decoder = JSONDecoder()
                
                // Decode
                let videos = try decoder.decode ([Video].self, from: data!)
                
//                // Append parsed modules into modules property
//                self.videos += videos
                
                DispatchQueue.main.async {
                    self.videos = videos
                }

            }
            catch {
                // Couldn't parse json
                print ("Could not parse the json file")
            }
            
        }
        
        // Resume Data Request
        dataTask.resume()
        
    }
    
    // MARK: - Module navigation methods
    func determineCurrentVideo (_ videoId:Int) {
        
        // Find the index for this video id
        for index in 0..<videos.count {
            
            if videos[index].id == videoId {
                
                // Found the matching module
                currentVideoIndex = index
                break
            }
        }
        
        // Set the current module
        currentVideo = videos[currentVideoIndex]
    }
    
}
