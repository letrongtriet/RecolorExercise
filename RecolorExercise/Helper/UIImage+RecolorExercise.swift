//
//  UIImage+RecolorExercise.swift
//  RecolorExercise
//
//  Created by Trong Triet Le on 12/02/2019.
//  Copyright © 2019 Nets AS. All rights reserved.
//

import UIKit

extension UIImageView {
    func load(url: URL , cache: URLCache? = nil) {
        DispatchQueue.global().async {
            let cache = cache ?? URLCache.shared
            let request = URLRequest(url: url)
            if let data = cache.cachedResponse(for: request)?.data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = image
                }
            } else {
                URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                    if let data = data, let response = response, ((response as? HTTPURLResponse)?.statusCode ?? 500) < 300, let image = UIImage(data: data) {
                        let cachedData = CachedURLResponse(response: response, data: data)
                        cache.storeCachedResponse(cachedData, for: request)
                        DispatchQueue.main.async {
                            self.image = image
                        }
                    }
                }).resume()
            }
        }
    }
}


