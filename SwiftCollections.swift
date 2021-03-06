import Foundation

extension Array {

    mutating func unshift(newElem: T) {
        self.insert(newElem, atIndex: 0)
    }
    
    mutating func pop() -> T {
        var idx = self.count - 1
        var item = self[idx]
        self.removeAtIndex(idx)
        return item
    }
    
    mutating func shift() -> T {
        var elem = self[0]
        self.removeAtIndex(0)
        return elem
    }
    
    mutating func push(newElem: T) {
        self.append(newElem)
    }
    
    // from https://gist.github.com/ijoshsmith/5e3c7d8c2099a3fe8dc3
    mutating func shuffle()
    {
        for _ in 0..<10
        {
            sort { (_,_) in arc4random() < arc4random() }
        }
    }

    // copied from http://stackoverflow.com/questions/24003191/pick-a-random-element-from-an-array 
    func randomItem() -> T {
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }

    func each(iterator: (T) -> Void) -> Array {
        for item in self { iterator(item) }
        return self
    }
    
    func partition(iterator: (T) -> Bool) -> (Array<T>, Array<T>) {
        var ifTrue = Array<T>()
        var ifFalse = Array<T>()
        self.each { (var item) -> Void in
            if iterator(item) == true {
                ifTrue.append(item)
            } else {
                ifFalse.append(item)
            }
        }
        return (ifTrue, ifFalse)
    }
    
    func all(iterator: (T) -> Bool) -> Bool {
        var result = true
        self.each { (var item) -> Void in
            if iterator(item) == false {
                result = false; return
            }
        }
        return result
    }
    
    func any(iterator: (T) -> Bool) -> Bool {
        var result = false
        self.each { (var item) -> Void in
            if iterator(item) == true {
                result = true; return
            }
        }
        return result
    }
    
    func none(iterator: (T) -> Bool) -> Bool {
        var result = true
        self.each { (var item) -> Void in
            if iterator(item) == true {
                result = false; return
            }
        }
        return result
    }
    
    func first() -> T? {
        if self.count >= 1 {
            return self[0]
        } else {
            return nil
        }
    }
    
    func last() -> T? {
        if self.count >= 1 {
            return self[self.count - 1]
        } else {
            return nil
        }
    }
    
    func take(count: Int) -> Array {
        var result = Array<T>()
        for idx in 1...count {
            result.append(self[idx - 1])
        }
        return result
    }
    
    func drop(count: Int) -> Array {
        var result = Array<T>()
        var end = self.count - 1
        for idx in count...end {
            result.append(self[idx])
        }
        return result
    }
    
    func find(iterator: (T) -> Bool) -> T? {
        var result : T?
        self.each { (var item) -> Void in
            if iterator(item) == true {
                result = item; return
            }
        }
        return result
    }
}
