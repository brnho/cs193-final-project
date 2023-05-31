//
//  Extensions.swift
//  Xcerpt
//
//  Created by Brian Ho on 5/27/23.
//

import Foundation
import SwiftUI

// code from https://lukeroberts.co/blog/fetch-data-api/
extension URLSession {
    func fetchData<T: Decodable>(for url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        self.dataTask(with: url) { (data, response, error) in
            if let error {
                completion(.failure(error))
            }
            
            if let data {
                do {
                    let object = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(object))
                } catch let decoderError {
                    completion(.failure(decoderError))
                }
            }
        }.resume()
    }
}

// code from https://stackoverflow.com/questions/62632213/swift-use-hsl-color-space-instead-of-standard-hsb-hsv
extension Color {
    init(hue: Double, saturation: Double, lightness: Double, opacity: Double) {
        //From HSL TO HSB ---------
        var newSaturation: Double = 0.0
        
        let brightness = lightness + saturation * min(lightness, 1-lightness)
        
        if brightness == 0 { newSaturation = 0.0 }
        else {
            newSaturation = 2 * (1 - lightness / brightness)
        }
        //---------
        self.init(hue: hue, saturation: newSaturation, brightness: brightness, opacity: opacity)
    }
}
