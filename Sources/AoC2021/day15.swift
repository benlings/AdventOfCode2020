import Foundation
import AdventCore

public struct ChitonMap {
    var riskLevels: Grid<Int>

    public func findLowestRiskPath() -> Int? {
        findLowestRiskPath(start: .zero,
                           end: Offset(east: riskLevels.columnIndices.upperBound - 1,
                                       north: riskLevels.rowIndices.upperBound - 1),
                           risk: risk(position:))
    }

    func risk(position: Offset) -> Int? {
        riskLevels.contains(position) ? riskLevels[position] : nil
    }

    func findLowestRiskPath(start: Offset, end: Offset, risk: (Offset) -> Int?) -> Int? {
        var risks = [start: 0]
        var toVisit = [start] as Set
        var visited = Set<Offset>()
        while !toVisit.isEmpty {
            let current = toVisit.min { risks[$0, default: .max] }!
            toVisit.remove(current)
            if current == end {
                return risks[current]!
            }
            for neighbour in current.orthoNeighbours() {
                guard let neighbourRisk = risk(neighbour),
                      !visited.contains(neighbour) else { continue }
                let alt = risks[current, default: .max] + neighbourRisk
                if alt < risks[neighbour, default: .max] {
                    risks[neighbour] = alt
                    toVisit.insert(neighbour)
                }
            }
            visited.insert(current)
        }
        return nil
    }
}

public extension ChitonMap {
    init(_ description: String) {
        self.riskLevels = Grid(description, conversion: \.wholeNumberValue)
    }
}

fileprivate let day15_input = Bundle.module.text(named: "day15")

public func day15_1() -> Int {
    ChitonMap(day15_input).findLowestRiskPath()!
}

public func day15_2() -> Int {
    0
}
