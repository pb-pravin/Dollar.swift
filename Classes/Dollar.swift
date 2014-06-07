//
//  $.swift
//  Dollar - A functional tool-belt for Swift Language
//
//  Created by Ankur Patel on 6/3/14.
//  Copyright (c) 2014 Encore Dev Labs LLC. All rights reserved.
//

import Foundation

struct $ {
    
    //$.first([0, 1, false, 2, '', 3])
    //Gets the first element or first n elements of an array.
    static func first(array: AnyObject[]) -> AnyObject? {
        if array.isEmpty {
            return nil
        } else {
            return array[0]
        }
    }
    
    //$.compact([0, 1, false, 2, '', 3])
    //Remove all falsey values
    static func compact(array: AnyObject?[]) -> AnyObject[] {
        var result: AnyObject[] = []
        for elem: AnyObject? in array {
            if let val: AnyObject = elem {
                result += val
            }
        }
        return result
    }

    //$.flatten([[2],3,4])
    //flatten array
    static func flatten(array: AnyObject[]) -> AnyObject[] {
        var resultArr: AnyObject[] = []
        for elem : AnyObject in array {
            if let val = elem as? AnyObject[] {
                resultArr += self.flatten(val)
            } else {
                resultArr += elem
            }
        }
        return resultArr
    }
    
    //$.indexOf([2, 3, 4, 5], 3)
    //Return index of the value
    static func indexOf<T: Equatable>(array: T[], value: T) -> Int? {
        for (index, elem) in enumerate(array) {
            if elem == value {
                return index
            }
        }
        return nil
    }

    //$.initial([2, 3, 4, 5])
    //Returns all except for last element
    static func initial(array: AnyObject[]) -> AnyObject[] {
        return self.initial(array, numElements: 1)
    }
    
    //$.initial([2, 3, 4, 5], 2)
    //Returns all except for last 2
    static func initial(array: AnyObject[], numElements: Int) -> AnyObject[] {
        var result: AnyObject[] = []
        for (index, _) in enumerate((0..array.count - numElements)) {
            result += array[index]
        }
        return result
    }
    
    //$.intersection([1, 2, 3], [5, 2, 1, 4], [2, 1])
    //Will return intersection of all arrays
    static func intersection(arrays: AnyObject[]...) -> AnyObject[] {
        return [] //@TODO Implement
    }
    
    //$.last([1, 2, 3])
    //Will return last element in the array
    static func last(array: AnyObject[]) -> AnyObject? {
        if array.isEmpty {
            return nil
        } else {
            return array[array.count - 1]
        }
    }
    
    //$.difference([1, 2, 3], [2], [3])
    //returns [1]
    //Returns first array passed subtracted by remaining arrays
    static func difference(arrays: AnyObject[]...) -> AnyObject[] {
        return [] //@TODO implement
    }
    
    //$.rest([2, 3, 4])
    //returns [3, 4]
    //Returns last n - 1 elements in array
    static func rest(array: AnyObject[]) -> AnyObject[] {
        return self.rest(array, numElements: 1)
    }
    
    //$.rest([2, 3, 4], 2)
    //returns [4]
    //Returns last n - numElements elements in array
    static func rest(array: AnyObject[], numElements: Int) -> AnyObject[] {
        var result: AnyObject[] = []
        for (index, _) in enumerate((numElements..array.count)) {
            result += array[index + numElements]
        }
        return result
    }
    
    //$.findIndex([2, 3, 3]) { return $0 == 3 }
    //returns 1
    //Returns index of element
    static func findIndex(array: AnyObject[], iterator: (AnyObject) -> Bool) -> Int? {
        for (index, elem : AnyObject) in enumerate(array) {
            if iterator(elem) {
                return index
            }
        }
        return nil
    }
    
    //$.findLastIndex([2, 3, 3]) { return $0 == 3 }
    //returns 2
    //Returns last index of element
    static func findLastIndex(array: AnyObject[], iterator: (AnyObject) -> Bool) -> Int? {
        let count = array.count
        for (index, _) in enumerate(array) {
            let reverseIndex = count - (index + 1)
            let elem: AnyObject = array[reverseIndex]
            if iterator(elem) {
                return reverseIndex
            }
        }
        return nil
    }
    
    //$.lastIndexOf([2, 3, 4], 3)
    //returns 1
    static func lastIndexOf<T: Equatable>(array: T[], value: T) -> Int? {
        var count = array.count
        for (index, _) in enumerate(array) {
            let reverseIndex = count - (index + 1)
            if value == array[reverseIndex] {
                return reverseIndex
            }
        }
        return nil
    }
    
    static func contains<T : Equatable>(array: T[], value: T) -> Bool {
        return array.filter({ $0 as? T == value }).count > 0
    }
    
    //$.pull()
    static func pull<T : Equatable>(array: T[], values: T...) -> T[] {
        return self.pull(array, values: values)
    }
    
    static func pull<T : Equatable>(array: T[], values: T[]) -> T[] {
        return array.filter { !self.contains(values, value: $0) }
    }
    
    //$.range()
    static func range(endVal: Int) -> Int[] {
        return self.range(0, endVal: endVal)
    }

    //$.range()
    static func range(startVal: Int, endVal: Int) -> Int[] {
        return self.range(startVal, endVal: endVal, incrementBy: 1)
    }

    //$.range()
    static func range(startVal: Int, endVal: Int, incrementBy: Int) -> Int[] {
        var result: Int[] = []
        for var i = startVal; i < endVal; i = i + incrementBy {
            result += i
        }
        return result
    }
    
    //$.remove()
    static func remove(array: AnyObject[], iterator: (AnyObject) -> Bool) -> AnyObject[] {
        return array.filter { !iterator($0) }
    }
        
    //$.sortedIndex()
    static func sortedIndex<T : Comparable>(array: T[], value: T) -> Int {
        for (index, elem) in enumerate(array) {
            if elem > value {
                return index
            }
        }
        return array.count
    }

    //$.union()
    static func union(arrays: AnyObject[]...) -> AnyObject[] {
        return [] //@TODO implement
    }

    //$.uniq()
    static func uniq(array: AnyObject[]) -> AnyObject[] {
        return [] //@TODO implement
    }
    
    //$.without()
    static func without<T : Equatable>(array: T[], values: T...) -> T[] {
        return self.pull(array, values: values)
    }
    
    //$.xor()
    static func xor(arrays: AnyObject[]...) -> AnyObject[] {
        return [] //@TODO implement
    }
    
    //$.zip()
    static func zip(arrays: AnyObject[]...) -> AnyObject[] {
        var result: AnyObject[][] = []
        for _ in arrays[0] {
            result += [] as AnyObject[]
        }
        for (index, array) in enumerate(arrays) {
            for (elemIndex, elem : AnyObject) in enumerate(array) {
                result[elemIndex] += elem
            }
        }
        return result
    }

    //$.zipObject()
    static func zipObject<T, E>(keys: T[], values: E[]) -> Dictionary<T, E> {
        var result = Dictionary<T, E>()
        for (index, key) in enumerate(keys) {
            result[key] = values[index]
        }
        return result
    }
    
    //$.noop()
    //A no-operation function.
    static func noop() -> AnyObject? {
        return nil
    }
}