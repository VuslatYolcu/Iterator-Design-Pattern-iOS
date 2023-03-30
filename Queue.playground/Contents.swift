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

enum PriorityType {
    case low
    case medium
    case high
}

struct Ticket {
    var description: String
    var priority: PriorityType
}

let ticket1 = Ticket(description: "Server Down", priority: .high)
let ticket2 = Ticket(description: "Login is not working...", priority: .low)

var queue = Queue<Ticket>()
queue.enqueue(item: ticket1)
queue.enqueue(item: ticket2)

print(queue)

for ticket in queue {
    print(ticket)
}
