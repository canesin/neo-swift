//
//  NeoScanTest.swift
//  NeoSwiftTests
//
//  Created by Apisit Toompakdee on 4/2/18.
//  Copyright © 2018 drei. All rights reserved.
//

import XCTest

class NeoScanTest: XCTestCase {
    
    func testGetHistory() {
        let exp = expectation(description: "Wait for transaction History response")
        let address = "AeNkbJdiMx49kBStQdDih7BzfDwyTNVRfb"
        NeoScan(network: .main).getTransactionHistory(address: address, page: 1) { result in
            switch result {
            case .failure:
                assert(false)
            case .success(let history):
                #if DEBUG
                print(history)
                #endif
                exp.fulfill()
            }
        }
        waitForExpectations(timeout: 20, handler: nil)
    }
}
