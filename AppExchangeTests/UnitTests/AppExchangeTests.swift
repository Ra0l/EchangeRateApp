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
        // Given
        let mockExchangeRate = ExchangeRate(provider: "lsls", warning: "", terms: "lslsl", date: "2024-03-03", timeLastUpdated: 1200202, base: "USD", rates: ["PEN": 3.72, "EUR": 0.85])
        mockService.mockExchangeRate = mockExchangeRate
        
        // When
//        viewModel.isDollarToSoles = true
        let expectation = self.expectation(description: "fetchExchangeRates completion")
        viewModel.fetchCurrencies()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            expectation.fulfill()
        }
        
        // Then
        waitForExpectations(timeout: 2) { error in
            XCTAssertNil(error, "Test timed out")
            XCTAssertEqual(self.viewModel.exchangeRates?.base, "USD")
            XCTAssertEqual(self.viewModel.exchangeRates?.rates["PEN"], 3.72)
            XCTAssertEqual(self.viewModel.currencies, ["EUR", "PEN"])
            
        }
    }
    
    func testValidConversion() {
        // Configurar valores de prueba
        viewModel.exchangeRates = ExchangeRate(provider: "lsls", warning: "", terms: "lslsl", date: "2024-03-03", timeLastUpdated: 1200202, base: "USD", rates: ["USD": 3.5]) // Ejemplo de tasa de cambio
        viewModel.isDolarToSoles = true
        viewModel.targetCurrency = "USD"
        viewModel.baseCurrency = "PEN"
        viewModel.amount = "10" // 10 soles
        
        // Calcular el resultado
        let result = viewModel.result
        
        // Comprobar que el resultado es correcto
        XCTAssertEqual(result, "35.00000", "La conversión de 10 PEN a USD con una tasa de 3.5 debería ser 35.00000")
    }
    
    func testNilExchangeRates() {
        // Configurar valores de prueba
        viewModel.exchangeRates = nil
        viewModel.isDolarToSoles = true
        viewModel.targetCurrency = "USD"
        viewModel.baseCurrency = "PEN"
        viewModel.amount = "10"
        
        // Calcular el resultado
        let result = viewModel.result
        
        // Comprobar que el resultado es correcto
        XCTAssertEqual(result, "Ingrese un valor para realizar la conversión", "El resultado debe ser un mensaje de error si exchangeRates es nil")
    }
    
    func testFetchExchangeRates_Success() {
        // Datos JSON de prueba
        let jsonData = """
            {
                "base": "USD",
                "rates": {
                    "EUR": 0.935,
                    "GBP": 0.791
                }
            }
            """.data(using: .utf8)
        
        // Simular URLSession
        let mockSession = MockURLSession()
        mockSession.data = jsonData
        
        let expectation = self.expectation(description: "Completion handler called")
        
        let service = ExchangeRateService()
        service.fetchExchangeRates(for: "USD") { exchangeRate in
            XCTAssertNotNil(exchangeRate)
            XCTAssertEqual(exchangeRate?.base, "USD")
            XCTAssertEqual(exchangeRate?.rates["EUR"], 0.935)
            XCTAssertEqual(exchangeRate?.rates["GBP"], 0.791)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1, handler: nil)
    }
}

class MockURLSession: URLSession {
    var data: Data?
    var urlResponse: URLResponse?
    var error: Error?
    
    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        let data = self.data
        let response = self.urlResponse
        let error = self.error
        
        return MockURLSessionDataTask {
            completionHandler(data, response, error)
        }
    }
}

class MockURLSessionDataTask: URLSessionDataTask {
    private let closure: () -> Void
    
    init(closure: @escaping () -> Void) {
        self.closure = closure
    }
    
    override func resume() {
        closure()
    }
}
