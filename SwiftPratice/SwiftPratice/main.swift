//
//  main.swift
//  SwiftPratice
//
//  Created by dexunzhu on 2018-05-03.
//  Copyright © 2018 dexunzhu. All rights reserved.
//

import Foundation

func sendTextMessage(_ message: String, to lover: String, in country: String) {
    print("To my love \(lover) in \(country): \(message).")
}

sendTextMessage("I miss you", to: "Natsuki", in: "Shibuya, Japan")

let numbers = [4, 17, 34, 82]
func isDivisibleByTwo(_ num: Int) -> Bool {
    return num % 2 == 0
}

let someFunc: (Int) -> Bool = isDivisibleByTwo
print(someFunc(10))


func filterInts(_ numbers: [Int], _ includeNumber: (Int) -> Bool) -> [Int] {
    var result = [Int]()
    for number in numbers {
        if (includeNumber(number)) {
            result.append(number)
        }
    }
    return result
}

var result = filterInts(numbers, someFunc)
print(result)

var result1 = filterInts(numbers) { (number: Int) -> Bool in return number % 2 == 0 }
var result2 = filterInts(numbers) { number in number % 2 == 0 }
var result3 = filterInts(numbers) { $0 % 2 == 0 }
print(result1)
print(result2)
print(result3)

// filterInts: filters an Int array baseon the function you pass
var result4 = filterInts(numbers) { num in
    var sum = 0
    var number = num
    while number > 0 {
        sum += number % 10
        number = number / 10
    }
    return sum % 2 == 0
}

print(result4)

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
            self.val = val
                self.left = nil
                self.right = nil
    }
}


func binaryTreePaths(_ root: TreeNode?) -> [String] {
    var paths = [String]();
    if let root = root {dfs(root, "", &paths)}
    return paths;
}

func dfs(_ root: TreeNode?, _ path: String, _ paths: inout [String]){
    if let root = root {
        if root.left == nil && root.right == nil {paths.append(path + String(root.val))}
        if let left = root.left {dfs(left, path + String(root.val) + "->", &paths)}
        if let right = root.right {dfs(right, path + String(root.val) + "->", &paths)}
    }
}

func maxHeight(_ root: TreeNode?) -> Int {
    var max  = 0;
    var paths = [Int]();
    if let root = root {dfs2(root, 1, &paths)}
    for num in paths {
        if num>max{
            max=num;
        }
    }
    return max;
}

func dfs2(_ root: TreeNode?, _ height: Int, _ paths: inout [Int]){
    if let root = root {
        if root.left == nil && root.right == nil {paths.append(height)}
        if let left = root.left {dfs2(left, (height+1), &paths)}
        if let right = root.right {dfs2(right, (height+1), &paths)}
    }
}

func maxHeight2(_ root: TreeNode?) -> Int {
    if let root = root {
        let leftMax = maxHeight(root.left)
        let rightMax = maxHeight(root.right)
        return max(leftMax, rightMax) + 1
    } else {
        return 0;
    }
}

var root = TreeNode(1)
var node1 =  TreeNode(2)
var node2 =  TreeNode(3)
var node3 =  TreeNode(5)
root.left = node1;
root.right = node2;
node1.right = node3;
print(binaryTreePaths(root))
print(maxHeight(root))
print(maxHeight2(root))



var nums = [0, 1, 0, 3, 12]
func moveZeroes(_ nums: inout [Int]) {
    // inout: pass by reference
    // struct: value
    var index = 0
    for num in nums {
        if num != 0 {
            nums[index] = num
            index += 1
        }
    }
    for i in index..<nums.count {
        nums[i] = 0
    }
}
moveZeroes(&nums)
print(nums)




func findDisappearedNumbersDex(_ nums: [Int]) -> [Int] {
    // O(n^2)
    let size = nums.count
    var arr = [Int]()
    for i in 1..<size+1 {
        arr.append(i)
    }
    for e in nums {
        if let loc = arr.index(of: e) {
            arr.remove(at: loc) // remove takes at most n times
        }
    }
    return arr
}


func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
    // all arguments are 'let' constants
    var nums = nums
    for e in nums {
        if nums[abs(e) - 1] > 0 {
            nums[abs(e) - 1] *= -1
        }
    }
    var res = [Int]()
    for i in 0..<nums.count {
        if nums[i] > 0 {
            res.append(i + 1)
        }
    }
    return res
}//                            1   2   3   4  5  6   7   8
print(findDisappearedNumbers([-4, -3, -2, -7, 8, 2, -3, -1]))
