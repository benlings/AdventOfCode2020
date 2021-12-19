import XCTest
import AoC2021

final class Day19Tests: XCTestCase {

    func testOrientations() {
        let axes = [Offset3D(x: 1), Offset3D(y: 1), Offset3D(z: 1)]
        let orientations = axes.map { $0.orientations() }
        let orientedAxes = zip(orientations[0], zip(orientations[1], orientations[2]))
            .map { [$0.0, $0.1.0, $0.1.1] }
        XCTAssertEqual(orientedAxes.count, 24)
        XCTAssertEqual(orientedAxes.toSet().count, 24)
    }

    let exampleInput = Bundle.module.text(named: "day19example")

    func testPart1Example() {
        XCTAssertEqual(0, 0)
    }

    func testPart1() {
        XCTAssertEqual(day19_1(), 0)
    }

    func testPart2Example() {
        XCTAssertEqual(0, 0)
    }

    func testPart2() {
        XCTAssertEqual(day19_2(), 0)
    }
}
