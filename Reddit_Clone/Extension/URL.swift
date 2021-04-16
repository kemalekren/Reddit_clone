//
//  UIImage.swift
//  Reddit_Clone
//
//  Created by Kemal Ekren on 16.04.2021.
//

import UIKit

extension URL {
    private func imageDownload(url: URL, toFile file: URL, completion: @escaping (Error?) -> Void) {
        
        let task = URLSession.shared.downloadTask(with: url) {
            (tempURL, response, error) in
            
            guard let tempURL = tempURL else {
                completion(error)
                return
            }
            
            do {
                if FileManager.default.fileExists(atPath: file.path) {
                    try FileManager.default.removeItem(at: file)
                }
                
                try FileManager.default.copyItem(
                    at: tempURL,
                    to: file
                )
                
                completion(nil)
            }
            catch {
                completion(error)
            }
        }
        task.resume()
    }
    
    func loadImageDataWith(url: URL, completion: @escaping (Data?, Error?) -> Void) {

        let fileCachePath = FileManager.default.temporaryDirectory
            .appendingPathComponent(
                url.lastPathComponent,
                isDirectory: false
            )
    
        if let data = try? Data(contentsOf: fileCachePath) {
            completion(data, nil)
            return
        }
        
        imageDownload(url: url, toFile: fileCachePath) { (error) in
            if let data = try? Data(contentsOf: fileCachePath) {
                completion(data, error)
            }
        }
    }
}
