import Foundation

class Deck : NSObject {
    static let allSpades : [Card] = Value.allValues.map{Card(color:Color.spades, value:$0)};
    static let allDiamonds : [Card] = Value.allValues.map{Card(color:Color.diamonds, value:$0)};
    static let allHearts : [Card] = Value.allValues.map{Card(color:Color.hearts, value:$0)};
    static let allClubs : [Card] = Value.allValues.map{Card(color:Color.clubs, value:$0)};
    
    static let allCards : [Card] = allSpades + allDiamonds + allHearts + allClubs;
    
    var cards : [Card] = allCards;
    var discards : [Card] = [];
    var outs : [Card] = [];
    
    init (mix: Bool){
        if mix {
            cards.moveCards();
        }
    }
    
    override var description : String {
        return (String(describing: self.cards));
    }
    
    func draw() -> Card?{
        let firstEle = cards.first;
        self.outs.append(firstEle!);
        self.cards.remove(at: 0);
        return firstEle;
    }
    func fold(c: Card){
        if self.outs.contains(c){
            self.discards.append(c);
            while (self.outs.contains(c)){
                if let index = self.outs.index(of: c){
                    self.outs.remove(at: index);
                }
            }
        }
    }
}

extension Array {
    mutating func moveCards() {
        var j:Int;
        for i in 0...51{
            j = Int(arc4random_uniform(UInt32(52)));
            if i != j{
                self.swapAt(i, j);
            }
        }
    }
}
