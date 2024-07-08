//
//  PublisherTest1.swift
//  SMSWithoutBorders-Production
//
//  Created by sh3rlock on 04/07/2024.
//

import Testing
import XCTest
import os

@testable import SMSWithoutBorders

class PublisherTest : XCTestCase {

    func testGetUrl() async throws {
        let publisher = Publisher()
        let response = try publisher.getURL(platform: "gmail")
        print(response.authorizationURL)
    }
    
//    func testGetPlatforms() async throws {
//        let expectation = XCTestExpectation(description: "JSON loading")
//        Publisher.getPlatforms() { result in
//            switch result {
//            case .success(let data):
//                print("Success: \(data)")
//            case .failure(let error):
//                XCTFail("Failed to load JSON data: \(error)")
//            }
//            expectation.fulfill()
//        }
//        wait(for: [expectation], timeout: 10.0) // Adjust the timeout as needed
//    }

}
