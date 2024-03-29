import Foundation

class Card : NSObject {
    var color : Color;
    var value : Value;
    
    init(color: Color, value:Value) {
        self.color = color;
        self.value = value;
    }
    
    override var description : String {
        return (String(describing: self.value) + " of " + String(self.color.rawValue));
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        if let object = object as? Card {
            return (self.color == object.color && self.value == object.value)
        }
        return (false)
    }
}
