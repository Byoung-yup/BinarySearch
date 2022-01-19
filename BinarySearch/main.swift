//
//  main.swift
//  BinarySearch
//
//  Created by 김병엽 on 2022/01/18.
//

import Foundation


// 재귀 함수
func binarySearch(_ array: [Int], num: Int) -> Bool {
    // 남은 배열 원소의 갯수가 1이면 true, 아니면 false
    if array.count == 1 {
        return array[0] == num ? true : false
    }
    
    let mid = array.count / 2
    // 중간 값과 num이 일치하면 true
    if array[mid] == num { return true }
    // 새로운 범위 설정
    let range = array[mid] > num ? (0..<mid) : ((mid + 1)..<array.count)
    
    return binarySearch(Array(array[range]), num: num)
}
 

// 반복문
func binarySearch(_ array: [Int], num: Int) -> Bool {
    var start = 0
    var end = array.count - 1
    
    while start <= end {
        let mid = (start + end) / 2
        if array[mid] == num { return true }
        
        if array[mid] < num {
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    return false
}

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let num = Int(readLine()!)!

print(binarySearch(input, num: num))
