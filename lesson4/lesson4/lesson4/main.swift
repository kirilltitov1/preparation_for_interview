//
//  main.swift
//  lesson4
//
//  Created by Kirill Titov on 03.01.2021.
//

import Foundation

final class Node {
    let value: Int
    var next: Node?
    init(value: Int) {
        self.value = value
    }
}

// 1->2->3->4->5->2
let node1: Node = Node(value: 1)
let node2: Node = Node(value: 2)
let node3: Node = Node(value: 3)
let node4: Node = Node(value: 4)
let node5: Node = Node(value: 5)
let node2_2: Node = Node(value: 2)
let node2_3: Node = Node(value: 2)

node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5
node5.next = node2_2
//node2_2.next = node2_3

var node: Node? = node1

/// я вот думал как идти каждый раз с нуля, то есть догонять хвост до головы
/// или от головы идти вправо, я решил идти вправо,
/// потому что так проще всего различить self и циклов получится меньше.
/// - Parameter node: голова
/// - Returns: true/false (был ли исправлен однонаправленный список)
@discardableResult
func validateNode(node: Node?) -> Bool {
    var tail: Node? = node
    
    var bool = false
    
    while tail != nil {
        var rightTail: Node? = tail?.next
        var prevTail: Node? = tail
        while rightTail != nil {
            if tail?.value == rightTail?.value {
                prevTail?.next = rightTail?.next
                rightTail?.next = nil
                rightTail = prevTail?.next
                bool = true
            }
            prevTail = prevTail?.next
            rightTail = rightTail?.next
        }
        print(tail?.value ?? "nil")
        tail = tail?.next
    }
    return bool
}

print(validateNode(node: node))
