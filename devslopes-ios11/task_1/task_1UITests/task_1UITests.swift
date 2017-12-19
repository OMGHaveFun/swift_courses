//
//  Copyright © 2017 HaveFun. All rights reserved.
//

import XCTest

class task_1UITests: XCTestCase {
        
    override func setUp() {
        super.setUp()

        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    func testStartButtonPressed() {
        let app = XCUIApplication()
        app.buttons["startButton"].tap()
        XCTAssertFalse(app.otherElements["ViewController.rocketView"].accessibilityElementsHidden, "rocketView hidden")
        
    }
    
}
