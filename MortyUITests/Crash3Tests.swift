//
//  Crash3Tests.swift
//  MortyUITests
//
//  Created by Shams Ahmed on 22/01/2021.
//

import XCTest

final class Crash3Tests: XCTestCase {

    // MARK: - Setup
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        continueAfterFailure = true
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    // MARK: - Test

    func testForceUnwrap_crash() throws {
        let app = XCUIApplication()
        app.launch()
    
        sleep(1)
        
        app.tabBars["Tab Bar"].buttons["Search"]
            .tap()
        
        app.tables/*@START_MENU_TOKEN@*/.textFields["Search"]/*[[".cells[\"Search\"].textFields[\"Search\"]",".textFields[\"Search\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
            .tap()
        
        sleep(1)
        
        app/*@START_MENU_TOKEN@*/.keys["C"]/*[[".keyboards.keys[\"C\"]",".keys[\"C\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.keys["r"].tap()
        app.keys["a"].tap()
        app.keys["s"].tap()
        app.keys["h"].tap()
        
        if app.wait(for: .notRunning, timeout: 1) {
            app.terminate()
        }
    }
    
    func testForceUnwrap_relaunch() throws {
        let app = XCUIApplication()
        app.launch()
        
        // Sends crash report
        
        sleep(15)
        
        _ = app.wait(for: .runningForeground, timeout: 5)
    }
}
