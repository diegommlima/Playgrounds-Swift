import Foundation

class Tree {
    var value: Int
    var leftTree: Tree?
    var rightTree: Tree?
    
    init(value: Int) {
        self.value = value
    }
}

class BinaryTree {
    
    func calc(values: [Int]) -> Tree {
        func internalCalc(tempValues: [Int]) -> Tree? {
            guard tempValues.count > 0 else { return nil }
            let middle = tempValues.count/2
            let value = tempValues[middle]
            let leftArray = Array(tempValues.prefix(upTo: middle))
            let rightArray = Array(tempValues.suffix(from: middle+1))
            let tree = Tree(value: value)
            tree.leftTree = internalCalc(tempValues: leftArray)
            tree.rightTree = internalCalc(tempValues: rightArray)
            return tree
        }
        return internalCalc(tempValues: values) ?? Tree(value: 0)
    }
    
    //TODO: make this method great
    func describeNode(tree: Tree?) -> String?  {
        guard let tree = tree else { return nil }
        var str = "[value:\(tree.value)]"
        if let leftString = self.describeNode(tree: tree.leftTree) {
            str.insert(contentsOf: " Left: \(leftString)", at: str.endIndex)
        }
        if let rightString = describeNode(tree: tree.rightTree) {
            str.insert(contentsOf:" Right:\(rightString)", at: str.index(before: str.endIndex))
        }
        return str
    }
}

let values = [1, 3, 4, 6, 7, 8, 10, 13, 14]
let values2 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26]
let values3 = [1, 2, 3, 4, 5, 6]
let binaryTree = BinaryTree()
let tree = binaryTree.calc(values: values3)
print(binaryTree.describeNode(tree: tree) as Any)

