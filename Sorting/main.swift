//
//  main.swift
//  Sorting
//
//  Created by Alireza Karimi on 2023-07-17.
//

import Foundation

// O(N^2)
func bubbleSort<T: Comparable>(_ arr: [T], _ comparator: (T, T) -> Bool) -> [T] {
  guard arr.count > 1 else { return arr }
  var elements = arr
  for i in 0..<elements.count - 1 {
    for j in 0..<elements.count - 1 - i {
      if comparator(elements[j + 1], elements[j]) {
        elements.swapAt(j, j + 1)
      }
    }
  }
  return elements
}


// O(N^2)
func selectionSort<T: Comparable>(_ arr: [T], _ comparator: (T, T) -> Bool) -> [T] {
  guard arr.count > 1 else { return arr }
  var elements = arr
  for i in 0..<elements.count - 1 {
    var indexMin = i
    for j in i+1..<elements.count {
      if comparator(elements[j], elements[indexMin]) {
        indexMin = j
      }
    }
    
    if i != indexMin {
      elements.swapAt(indexMin, i)
    }
  }
  return elements
}

// O(N^2)
func insertionSort<T: Comparable>(_ arr: [T], _ comparator: (T, T) -> Bool) -> [T] {
  guard arr.count > 1 else { return arr }
  var elements = arr
  for i in 1..<elements.count {
    var j = i
    let toInsert = elements[j]
    while j > 0 && comparator(toInsert, elements[j - 1]) {
      elements[j] = elements[j - 1]
      j -= 1
    }
    elements[j] = toInsert
  }
  return elements
}

// O(NlgN) <- this fastest sorting algorithm so far (e.g. Merge Sort, Quick Sort, Tim Sort, Heap Sort etc...)
// Recursion
func mergeSort<T: Comparable>(_ arr: [T], _ comparator: (T, T) -> Bool) -> [T] {
    guard arr.count > 1 else {
        return arr
    }
    
    let mid = arr.count / 2
    let left = mergeSort(Array(arr[..<mid]), comparator)
    let right = mergeSort(Array(arr[mid...]), comparator)
    
    return merge(left, right, comparator)
}// from chat gpt 

