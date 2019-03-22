
import Foundation

class Fibonacci {
    
    //Easy to understand
    func calc(value: Int) -> Int {
        guard value > 1 else { return value }
        var lastItem = 1
        var oldItem = 1
        var finalItem = 0
        for _ in 0..<value {
            oldItem = lastItem
            lastItem = finalItem
            finalItem = oldItem + lastItem
        }
        return finalItem
    }
    
    //Better
    func calcRecursively(value: Int) -> Int {
        guard value > 1 else { return value }
        var finalValue = 1
        func recursive(value: Int, lastValue: Int = 1, oldValue: Int = 1) -> Int {
            guard value > 0 else { return finalValue }
            finalValue = lastValue + oldValue
            return recursive(value: value-1, lastValue: finalValue, oldValue: lastValue)
        }
        return recursive(value:value-2)
    }
    
    //Complex
    func calcRecursivelyFromWeb(value: Int) -> Int {
        guard value > 1 else { return value }
        return calcRecursivelyFromWeb(value:value - 1) + calcRecursivelyFromWeb(value:value - 2)
    }
    
    //Expert
    func calcWithMath(value: Int) -> Int {
        let sqrt5: Double = sqrt(5)
        let k: Double = 1 / sqrt5
        let y: Double = pow(Double ((1 + sqrt5) / 2), Double(value))
        let z: Double = pow(Double ((1 - sqrt5) / 2), Double(value))
        return Int(k * (y - z))
    }
}

let fib = Fibonacci()
fib.calc(value: 5)
fib.calcRecursively(value: 5)
fib.calcRecursivelyFromWeb(value: 5)
fib.calcWithMath(value:5)
