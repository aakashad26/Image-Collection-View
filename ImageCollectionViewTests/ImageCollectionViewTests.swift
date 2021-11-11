//
//  ImageCollectionViewTests.swift
//  ImageCollectionViewTests
//
//  Created by Aakash Adhikari on 6/25/20.
//  Copyright © 2020 Aakash Adhikari. All rights reserved.
//

import XCTest
import ImageCollectionView

class ImageCollectionViewTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            
            let vc = ViewController()
            
           // vc.fetchImages
            // Put the code you want to measure the time of here.
            vc.fetchImages()
        }
    }
    
//    func test_StartDownload_Performance() {
//       let track = Track(name: "Waterloo", artist: "ABBA",
//                         previewUrl: "http://www.kaleidosblog.com/tutorial/get_images.php")
//       measure {
//         self.sut.startDownload(track)
//       }
//     }

}
