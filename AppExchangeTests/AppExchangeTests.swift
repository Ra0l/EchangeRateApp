//
//  AppExchangeTests.swift
//  AppExchangeTests
//
//  Created by Raul Kevin Aliaga Shapiama on 6/2/24.
//

import XCTest
@testable import AppExchange

class CurrencyExchangeViewModelTests: XCTestCase {
    var viewModel: CurrencyConverterViewModel!
    var mockService: MockExchangeRateService!
    
    override func setUp() {
        super.setUp()
        mockService = MockExchangeRateService()
        viewModel = CurrencyConverterViewModel(service: mockService as! ExchangeRateServiceProtocol)
    }
    
    override func tearDown() {
        viewModel = nil
        mockService = nil
        super.tearDown()
    }
    
    func testFetchCurrencies() {

    }
}
