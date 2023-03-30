import UIKit

// FIFO

struct Queue<T> {
    
    var array: [T?] = []
    var head = 0
    
    mutating func enqueue(item: T) {
        array.append(item)
    }
    
    mutating func dequeue() -> T? {
        guard head < array.count, let element = array[head] else { return nil }
        array.remove(at:head)
        head += 1
        return element
    }
    
    
}
