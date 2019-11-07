var testDeck = Deck(mix: true)
var x: Card?
var index: Int = 0;
print(testDeck)
x = testDeck.draw()
x = testDeck.draw()
x = testDeck.draw()
x = testDeck.draw()
x = testDeck.draw()
print("")
for i in testDeck.outs {
    print("outs[\(index)] = \(i)")
    index+=1;
}
print("")
testDeck.fold(c: testDeck.outs[0])
testDeck.fold(c: testDeck.outs[1])
testDeck.fold(c: testDeck.outs[2])
index = 0;
for i in testDeck.discards {
    print("discards[\(index)] = \(i)")
    index+=1;
}
print("")
index = 0;
for i in testDeck.outs {
    print("outs[\(index)] = \(i)")
    index+=1;
}
print("")
for i in testDeck.cards {
print(i)
}
