extension Array {
    func each(iterator: (T) -> Void) -> Array {
        for item in self {
            iterator(item)
        }
        return self
    }
}


extension Array {
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
}
