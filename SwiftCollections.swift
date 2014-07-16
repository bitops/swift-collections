extension Array {
    func each(iterator: (T) -> Void) -> Array {
        for item in self {
            iterator(item)
        }
        return self
    }

    func partition(iterator: (T) -> Bool) -> (Array<T>, Array<T>) {
        var ifTrue = Array<T>()
        var ifFalse = Array<T>()
        self.each {
            if iterator($0) == true {
                ifTrue.append($0)
            } else {
                ifFalse.append($0)
            }
        }
        return (ifTrue, ifFalse)
    }

    func all(iterator: (T) -> Bool) -> Bool {
        var result = true
        self.each {
            if iterator($0) == false {
                result = false; return
            }
        }
        return result
    }

    func any(iterator: (T) -> Bool) -> Bool {
        var result = false
        self.each {
            if iterator($0) == true {
                result = true; return
            }
        }
        return result
    }

    func none(iterator: (T) -> Bool) -> Bool {
        var result = true
        self.each {
            if iterator($0) == true {
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
        self.each {
            if iterator($0) == true {
                result = $0; return
            }
        }
        return result
    }
}

