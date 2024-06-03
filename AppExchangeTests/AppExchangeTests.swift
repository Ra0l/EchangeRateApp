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
        viewModel = CurrencyConverterViewModel(service: mockService!)
    }
    
    override func tearDown() {
        viewModel = nil
        mockService = nil
        super.tearDown()
    }
    
    func testFetchCurrencies() {
//        // Given
//        let mockExchangeRate = ExchangeRate(base: "USD", rates: ["PEN": 3.72, "EUR": 0.85])
//        mockService.mockExchangeRate = mockExchangeRate
//        
//        // When
//        viewModel.isDollarToSoles = true
//        let expectation = self.expectation(description: "fetchExchangeRates completion")
//        viewModel.fetchCurrencies()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            expectation.fulfill()
//        }
//        
//        // Then
//        waitForExpectations(timeout: 2) { error in
//            XCTAssertNil(error, "Test timed out")
//            XCTAssertEqual(self.viewModel.exchangeRates?.base, "USD")
//            XCTAssertEqual(self.viewModel.exchangeRates?.rates["PEN"], 3.72)
//            XCTAssertEqual(self.viewModel.currencies, ["EUR", "PEN"])
//        }
    }
}
