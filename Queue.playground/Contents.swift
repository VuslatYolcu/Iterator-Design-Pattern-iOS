import UIKit

// FIFO

struct Queue<T> {
    
    var array :[T?] = []
    var head = 0
    
    mutating func enqueue(item :T) {
        array.append(item)
    }
    
    mutating func dequeue() -> T? {
        
        guard head < array.count,
            let element = array[head] else {
                return nil
        }
        
        array.remove(at: head)
        head += 1
        return element
        
    }
    
}

extension Queue :Sequence {
    
    func makeIterator() -> IndexingIterator<ArraySlice<T?>> {
        
        let values = array[head..<array.count]
        return values.makeIterator()
        
    }
    
}

enum PriorityType :Int {
    case low
    case medium
    case high
}

struct Ticket {
    var description :String
    var priority :PriorityType
}

let ticket1 = Ticket(description: "Server Down", priority: .high)
let ticket2 = Ticket(description: "Login is not working...", priority: .low)
let ticket3 = Ticket(description: "Website is crashing", priority: .high)
let ticket4 = Ticket(description: "Medium priority", priority: .medium)

var queue = Queue<Ticket>()
queue.enqueue(item: ticket1)
queue.enqueue(item: ticket2)
queue.enqueue(item: ticket3)
queue.enqueue(item: ticket4)

print(queue)

for ticket in queue {
    print(ticket)
}

let sortedTickets = queue.sorted {
    $0!.priority.rawValue > $1!.priority.rawValue
}

print(sortedTickets)
