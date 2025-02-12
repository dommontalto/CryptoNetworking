//
//  ImageLoader.swift
//  CryptoNetworking
//
//  Created by Dominic Montalto on 12/02/2025.
//

import SwiftUI

class ImageLoader: ObservableObject {
    @Published var image: Image?
    
    private let urlString: String
    
    init(url: String) {
        self.urlString = url
        Task { await loadImage() }
    }
    
    @MainActor
    private func loadImage() async {
        if let cached = ImageCache.shared.get(forKey: urlString) {
            print("DEBUG: Image loaded from cache")
            self.image = Image(uiImage: cached)
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            print("DEBUG: Image loaded from URL")
            guard let uiImage = UIImage(data: data) else { return }
            ImageCache.shared.set(uiImage, forKey: urlString)
            self.image = Image(uiImage: uiImage)
           
        } catch {
            print("DEBUG: Failed to fetch image with error \(error)")
        }
    }
}
