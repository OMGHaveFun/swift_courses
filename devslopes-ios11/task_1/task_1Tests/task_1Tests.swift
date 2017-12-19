//
//  Copyright © 2017 HaveFun. All rights reserved.
//

import XCTest

@testable import task_1

class task_1Tests: XCTestCase {
    
    var viewControllerUnderTest: ViewController!

    override func setUp() {
        super.setUp()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.viewControllerUnderTest = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        self.viewControllerUnderTest.loadView()
        self.viewControllerUnderTest.viewDidLoad()
    }

    // MARK: - startButton check
    
    func testStartButtonExist() {
        XCTAssertNotNil(self.viewControllerUnderTest.startButton, "Doesn't have a startButton")
    }
    
    func testStartButtonExistLabelLess() {
        XCTAssertTrue(viewControllerUnderTest.startButton.currentTitle == nil, "startButton have a label")
    }
    
    func testStartButtonInvokesActionMethodWhenTapped() {
        let actionMethod = self.viewControllerUnderTest.startButton.actions(forTarget: self.viewControllerUnderTest, forControlEvent: UIControlEvents.touchUpInside)
        let actualMethodName = actionMethod?.first
        let expectedMethodName = "startButtonPressed:"
        
        XCTAssertEqual(actualMethodName, expectedMethodName, "Actual: \(String(describing: actualMethodName)) not equal to expected: \(expectedMethodName)")
    }
    
    func testStartButtonMainFunctionality() {
        viewControllerUnderTest.startButton.sendActions(for: UIControlEvents.touchUpInside)
        XCTAssertTrue(viewControllerUnderTest.rocketView.isHidden == false, "rocketView doesn't hidden")
    }
    
    // MARK: - audio check

    func testPathForAudioResource() {
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        XCTAssertNotNil(path, "Doesn't have a audio resource")
    }
    
    func testUncorrectAudioResource() {
        let url = URL(fileURLWithPath: "wrongPath")
        XCTAssertNotNil(viewControllerUnderTest.initAudioWithUrl(url))
    }

}
