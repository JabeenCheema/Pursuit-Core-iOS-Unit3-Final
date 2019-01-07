//
//  ElementAPIClient.swift
//  Elements
//
//  Created by Jabeen's MacBook on 1/4/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class ElementAPIClient {
    static func fetchElements(completionHandler: @escaping(AppError?, [Element]?) -> Void) {
        NetworkHelper.shared.performDataTask(endpointURLString: "https://5c1d79abbc26950013fbcaa9.mockapi.io/api/v1/elements", httpMethod: "GET", httpBody: nil) { (appError, data, httpResponse) in
            if let appError = appError {
                completionHandler(appError, nil)
            }
        guard let response = httpResponse,
            (200...299).contains(response.statusCode) else {
                let statusCode = httpResponse?.statusCode ?? -999
                completionHandler(AppError.badStatusCode("\(statusCode)"), nil)
                return
            }
            if let data = data {
                do {
                    let users = try JSONDecoder().decode([Element].self, from: data)
                    completionHandler(nil, users)
                } catch {
                    completionHandler(AppError.decodingError(error), nil)
                }
            }
        }
    }
    static func favoriteElement(data: Data, completionHandler: @escaping (AppError?, Bool) -> Void) {
        NetworkHelper.shared.performUploadTask(endpointURLString: "https://5c1d79abbc26950013fbcaa9.mockapi.io/api/v1/favorites", httpMethod: "POST", httpBody: data) { (appError, data, httpResponse) in
            if let appError = appError {
                completionHandler(appError, false)
            }
        guard let response = httpResponse,
            (200...299).contains(response.statusCode) else {
                let statusCode = httpResponse?.statusCode ?? -999
                
                completionHandler(AppError.badStatusCode(String(statusCode)), false)
                return
            }
            if let _ = data {
                completionHandler(nil, true)
            }
        }
    }
}

