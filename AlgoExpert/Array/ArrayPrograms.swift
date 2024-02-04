//
//  ArrayPrograms.swift
//  AlgoExpert
//
//  Created by Hirendra Sharma on 19/01/24.
//

import Foundation

class ArrayPrograms {
    
    //Input: [5, 7, 1, 1, 2, 3, 22]
    // Output: 20
    //O(nlogn) time | O(1) space
    func nonConstructibleChange(_  coins: inout [Int]) -> Int {
        var result = 0
        for coin in coins.sorted() {
            if coin > result + 1 {
                return result+1
            }
            result += coin
        }
        return result+1
    }
    
    
    //Input: {
    //    "matrix": [
    //      [1, 2],
    //      [3, 4],
    //  [5, 6]
    //    ]
    //  }
    
    //Output: [
    //      [1, 2, 3],
    //      [4, 5, 6]
    //    ]
    // O(w * h) time | O(w * h) space - where w is the width and h is the height of the matrix
    func transposeMatrix(_ matrix: [[Int]]) -> [[Int]] {
        let rows = matrix.count
        let columns = matrix[0].count
        var result = [[Int]]()
        for col in 0..<columns {
            var tempArray = [Int]()
            for row in 0..<rows {
                tempArray.append(matrix[row][col])
            }
            result.append(tempArray)
        }
        return result
    }
    
    //   Input: {
    //    "array": [3, 5, -4, 8, 11, 1, -1, 6],
    //    "targetSum": 10
    //  }
    //O(n) time | O(n) space
    func twoNumberSum(_ array: inout [Int], _ targetSum: Int) -> [Int] {
        var res = [Int: Int]()
        for (i,n) in array.enumerated() {
            let diff = targetSum - n
            if let _ = res[diff] {
                return [diff, n]
            }
            res[n] = i
        }
        return []
    }
    
    //Input: {
    //    "array": [12, 3, 1, 2, -6, 5, -8, 6],
    //    "targetSum": 0
    //  }
    //Output: [[-8, 2, 6], [-8, 3, 5], [-6, 1, 5]]
    //O(n^2) time | O(n) space
    func threeNumberSum(array: inout [Int], targetSum: Int) -> [[Int]] {
        let sortedArray = array.sorted()
        var left = 0
        var right = sortedArray.count - 1
        var result = [[Int]]()
        for i in 0..<sortedArray.count - 2 {
            var tempArr = [Int]()
            left = i + 1
            right = sortedArray.count - 1
            while left < right {
                let sum = sortedArray[i] + sortedArray[left] + sortedArray[right]
                if sum == targetSum {
                    tempArr = [sortedArray[i], sortedArray[left], sortedArray[right]]
                    result.append(tempArr)
                    left += 1
                    right -= 1
                } else if sum < targetSum {
                    left += 1
                } else if sum > targetSum {
                    right -= 1
                }
            }
        }
        return result
    }
    
    //Input: [2,1,2,2,2,3,4,2]
    //Output: [1, 3, 4, 2, 2, 2, 2, 2]
    //O(n) time | O(n) space
    func moveElementToEnd(_ array: inout [Int], _ toMove: Int) -> [Int] {
        var result = Array(repeating: 0, count: array.count)
        var startIdx = 0
        var endIdx = array.count - 1
        for i in 0..<array.count {
            let currVal = array[i]
            if currVal == toMove {
                result[endIdx] = currVal
                endIdx -= 1
            } else {
                result[startIdx] = currVal
                startIdx += 1
            }
        }
        return result
    }
    
    //Input: [2,1,2,2,2,3,4,2]
    //Output: [1, 3, 4, 2, 2, 2, 2, 2]
    //O(n) time | O(1) space
    func moveElementToEnd2(_ array: inout [Int], _ toMove: Int) -> [Int] {
        var left = 0
        var right = array.count - 1
        while left < right {
            while left < right && array[right] == toMove {
                right -= 1
            }
            if array[left] == toMove {
                array.swapAt(left, right)
                // OR
                //(array[left],array[right]) = (array[right],array[left])
            }
            left += 1
        }
        return array
    }
    
    // Input: var array = [-1, 5, 10, 20, 28, 3]
    // Output: var array2 = [26, 134, 135, 15, 17]
    //O(n^2) time | O(1) space
    func smallestDifference(arrayOne: inout [Int], arrayTwo: inout [Int]) -> [Int] {
        var minDiff = Int.max
        var result = [Int]()
        for i in 0..<arrayOne.count {
            for j in 0..<arrayTwo.count {
                let diff = abs(arrayOne[i] - arrayTwo[j])
                if diff < minDiff {
                    minDiff = diff
                    result = [arrayOne[i], arrayTwo[j]]
                }
            }
        }
        return result
    }
    
    // Check Non decreasing or non increasing
    //Input: [-1, -5, -10, -1100, -1100, -1101, -1102, -9001]
    // Output: True
    //O(n) time | O(1) space
    func isMonotonic(array: [Int]) -> Bool {
        if array.count <= 2 {
            return true
        }
        var isDecreasing = false
        
        for i in 0..<array.count-1 {
            if array[i] > array[i+1] {
                isDecreasing = true
                break
            }
        }
        for i in 0..<array.count-1 {
            if isDecreasing {
                if array[i] < array[i+1] {
                    return false
                }
            } else {
                if array[i] > array[i+1] {
                    return false
                }
            }
        }
        return true
    }
    
    func isMonotonic2(array: [Int]) -> Bool {
        if array.count <= 2 {
            return true
        }
        var increasingOrder = true
        var decresingOrder = true
        for i in 0..<array.count - 1 {
            if array[i] > array[i+1] {
                increasingOrder = false
            }
            if array[i] < array[i+1] {
                decresingOrder = false
            }
        }
        return increasingOrder || decresingOrder
    }
    
    //https://www.youtube.com/watch?v=VXeukMTbxkw
    //Input: [1, 2, 3, 3, 4, 0, 10, 6, 5, -1, -3, 2, 3]
    // Output: 6
    //O(n) time | O(1) space
    func longestPeak(array: [Int]) -> Int {
        if array.count <= 2 {
            return 0
        }
        var ans = 0
        for i in 1..<array.count - 1 {
            if array[i] > array[i-1] && array[i] > array[i+1] {
                var left = i - 1
                var right = i + 1
                while left>0 && array[left] > array[left-1] {
                    left -= 1
                }
                while right < array.count-1 && array[right] > array[right+1] {
                    right += 1
                }
                ans = max(ans, right-left+1)
            }
        }
        return ans
    }
    
    // Input: [5, 1, 4, 2]
    // Output: [8, 40, 10, 20]
    //O(n^2) time | O(n) space
    func arrayOfProducts(_ array: [Int]) -> [Int] {
        var result = [Int]()
        var multiplyVal = 1
        for i in 0..<array.count {
            for j in 0..<array.count {
                if i == j {
                    continue
                }
                multiplyVal *= array[j]
            }
            result.append(multiplyVal)
            multiplyVal = 1
        }
        return result
    }
    //Input
    //[2, 1, 5, 3, 3, 2, 4]
    //[2, 1, 5, 2, 3, 3, 4]
    // Output: 2
    //O(n^2) time | O(1) space
    func firstDuplicateValue(_ array: inout [Int]) -> Int {
        var index = array.count
        for i in 0..<array.count {
            for j in i+1..<array.count {
                if array[i] == array[j] {
                    if j < index {
                        index = j
                    }
                }
            }
        }
        
        if index == array.count {
            return -1
        }
        return array[index]
    }
    
    //O(n) time | O(n) space
    func firstDuplicateValue2(_ array: inout [Int]) -> Int {
        var seen = Set<Int>()
        for i in array {
            if seen.contains(i) {
                return i
            }
            seen.insert(i)
        }
        return -1
    }
    
    //https://www.youtube.com/watch?v=IexN60k62jo
    // Input
    //       [[1, 2],
    //        [3, 5],
    //        [4, 7],
    //        [6, 8],
    //        [9, 10]]
    //Output: [[1, 2], [3, 8], [9, 10]]
    //O(nlog(n)) time | O(n) space
    func mergeOverlappingIntervals(_ intervals: [[Int]]) -> [[Int]] {
        if intervals.count <= 1 {
            return intervals
        }
        let sortedIntervals = intervals.sorted { $0[0] < $1[0] }
        var result = [[Int]]()
        result.append(sortedIntervals[0])
        
        for i in 1..<sortedIntervals.count {
            let currentIntervalEnd = result[result.count-1][1]
            let nextIntervalStart = sortedIntervals[i][0]
            if nextIntervalStart <= currentIntervalEnd {
                result[result.count-1][1] = max(currentIntervalEnd, sortedIntervals[i][1])
            } else {
                result.append(sortedIntervals[i])
            }
        }
        return result
    }
    
    //Input: [1, 0, 1, 0, 0, 0, 1]
    // Output: 4
    //O(n) time | O(1) space
    func bestSeat(_ seats: [Int]) -> Int {
        var left = 0
        var right = left+1
        var bestSeat = 0
        var maxSeat = 0
        for i in 1..<seats.count {
            if seats[i] == 0 {
                right += 1
            } else {
                let currenetSeat = right - left - 1
                if maxSeat < currenetSeat {
                    maxSeat = currenetSeat
                    bestSeat = (right + left)/2
                }
                left = right
                right += 1
            }
        }
        return bestSeat == 0 ? -1 : bestSeat
    }
    
    //Input: [-5, -5, 2, 3, -2]
    //Output: True
    //O(n) time | O(n) space
    func zeroSumSubarray(_ nums: [Int]) -> Bool {
        var currentSum = 0
        var result = [Int]()
        result.append(0)
        for num in nums {
            currentSum = currentSum + num
            if result.contains(currentSum) {
                return true
            }
            result.append(currentSum)
        }
        return false
    }
    
    //Input: [1, 4, 3]
    // Output: [2, 5]
    //O(n) time | O(n) space
    func missingNumbers(_ nums: [Int]) -> [Int] {
        var result = [Int]()
        for i in 1...nums.count+2 {
            if !nums.contains(i) {
                result.append(i)
            }
        }
        return result
    }
    
    //Input: [1, 2, 3, 2, 2, 1, 2]
    //Output: 2
    //O(n^2) time | O(1) space
    func majorityElement(_ array: [Int]) -> Int {
        var currentElement = 1
        var maxElement = 0
        var majorityElement = -1
        for i in 0..<array.count {
            currentElement = 1
            for j in i+1..<array.count {
                if array[i] == array[j] {
                    currentElement += 1
                }
            }
            if maxElement < currentElement && currentElement >= (array.count/2) {
                maxElement = currentElement
                majorityElement = array[i]
            }
        }
        return majorityElement
    }
    
    //O(n) time | O(n) space
    func majorityElement2(_ array: [Int]) -> Int {
        var hashMap = [Int: Int]()
        for i in 0..<array.count {
            hashMap[array[i], default: 0] += 1
        }
        var maxElement = 0
        var majorityElement = -1
        for (key, value) in hashMap {
            if maxElement < value {
                maxElement = value
                majorityElement = key
            }
        }
        return majorityElement
    }
    
    //Input: [-3, -5, 1, 7]
    //Output: 8
    func sweetAndSavory(_ dishes: [Int], _ target: Int) -> [Int] {
        let sweet = dishes.filter { $0 < 0 }.sorted(by: >)
        let savory = dishes.filter { $0 > 0 }.sorted()
        
        var sweetIdx = 0
        var savoryIdx = 0
        var bestDiff = Int.max
        var bestPair = [0,0]
        while sweetIdx < sweet.count, savoryIdx < savory.count {
            let currentSum = sweet[sweetIdx] + savory[savoryIdx]
            if currentSum == target {
                return [sweet[sweetIdx], savory[savoryIdx]]
            } else if currentSum < target {
                let currentDiff = abs(target - currentSum)
                if currentDiff < bestDiff {
                    bestDiff = currentDiff
                    bestPair = [sweet[sweetIdx], savory[savoryIdx]]
                }
                savoryIdx += 1
            } else {
                sweetIdx += 1
            }
        }
        return bestPair
    }
}
