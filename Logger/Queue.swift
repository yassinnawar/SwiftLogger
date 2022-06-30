
public struct Queue{
    public var items: [(String, String)] = []

    mutating func enqueue(message: String, level:String){
        if (items.count > 999)
        {
            items.remove(at: 0)
            items.append((level,message))
        }
        else {
            items.append((level,message))
        }
    }
    
    
    mutating func dequeue(){
        if items.isEmpty {
            print("Queue is Empty")
        }
        else{
            items.remove(at: 0)
        }
    }
    
    
    mutating func returnLog() -> [(String, String)]{
        return items;
    }
    
    mutating func getlevelAtIndex(i:Int) -> String{
        return (items[i].0)
    }
    
    mutating func getmessageAtIndex(i:Int) -> String{
        return (items[i].1)
    }
    
}
