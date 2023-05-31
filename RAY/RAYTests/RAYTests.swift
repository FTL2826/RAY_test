//
//  RAYTests.swift
//  RAYTests
//
//  Created by Alex Kharin on 5/31/23.
//

import XCTest
@testable import RAY

final class RAYTests: XCTestCase {

    var sut: MainPageViewModel!
    var network = MockNetworkService()
    
    override func setUpWithError() throws {
        sut = .init(network,
                    MockFileService(),
                    MockFavoriteEnviroment())
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testSubmit() {
        //Given
        let text = "dummy"
        //When
        let result = sut.submitPressed(text)
        print(result)
        //Then
        switch result {
        case .success(let success):
            XCTAssertTrue(success == URL(string: "https://dummyimage.com/350x350?text=dummy"))
        case .failure(let failure):
            XCTFail("cannot be failure")
        }
        
    }

    func testCreateURL() {
        //Given
        network.result = .success("Hello".data(using: .utf8)!)
        let url = URL(string: "https://dummyimage.com/500x500&text=some+text")!
        //When
        sut.dowloadPicture(from: url)
        //Then
        let str = String(data: sut.pictureData.value, encoding: .utf8)
        XCTAssertTrue(str == "Hello")
        
        //Given
        enum TestErrors: Error {
            case test
        }
        network.result = .failure(TestErrors.test)
        //When
        sut.dowloadPicture(from: url)
        //Then
        XCTAssert(sut.networkError.value as! TestErrors == TestErrors.test)
    }

}
