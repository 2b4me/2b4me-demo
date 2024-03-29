/*
 * Before running this file, make sure that you have set the following files properly in the ./input directory:
 * 
 * contestants.txt
 * This is a list of the contestants that have signed up at the time of the drawing. This should be a
 * straight copy/paste from the 2b4me Launch Promotion Google Docs of the contestants that signed up. The
 * order must be kept intact.
 *
 * prizes.txt
 * This is a list of the prizes being given out at the time of the drawing; each contest should be on its own
 * line. The sort order should be from greatest cash value to least cash value. The number of contestants (c)
 * should never exceed the number of prizes (p) ten times over. In other words, p * 10 <= c must be a true
 * statement for the drawing to be valid.
 */

def readIn(filename) {
    def array
    new File(filename).withReader { reader ->
        array = reader.readLines()
    }
    return array
}

def contestants = readIn('input/contestants.txt')
def prizes = readIn('input/prizes.txt')

if (prizes.size() * 10 > contestants.size()) {
    println "The number of contestants (${contestants.size()}) exceeded " +
            "the number of prizes times ten (${prizes.size() * 10}). " +
            "Reduce the number of prizes to " +
            (int)Math.floor(contestants.size()/10) + " or less."
    System.exit(0)
}

def winners = []
def datetime = new java.util.Date()
def seed = datetime.getTime()
def r = new java.util.Random(seed)
def limit = prizes.size() * 3

while (winners.size() < limit) {
    def w = contestants.get(r.nextInt(contestants.size()))
    if (!winners.contains(w)) winners << w
}

new File('output/winners.txt').withWriter { out ->
    out.writeLine("Drawing ran on ${datetime}")
    out.writeLine("Randomizer seed was ${seed}")
    out.writeLine('----------------------------------------------')
    out.writeLine('')
    def i = 0
    prizes.each { p ->
        def cleanup = {
            def tokens = winners.get(i++).tokenize('\t')
            return tokens[1] + ' (' + tokens[0] + ')'
        }
        def w1 = cleanup()
        def w2 = cleanup()
        def w3 = cleanup()
        out.writeLine("Winners for prize: ${p}")
        out.writeLine("First place:\t${w1}")
        out.writeLine("Second place:\t${w2}")
        out.writeLine("Third place:\t${w3}")
        out.writeLine('')
    }
}