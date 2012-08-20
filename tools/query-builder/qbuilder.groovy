def contestants = []
new File('input/contestants.csv').eachLine { line ->
    def c = [:]
    def t = line.split('\t')
    c.id = t[0]
    c.version = t[1]
    c.email = t[2]
    c.entry = t[3]
    c.ineligibilityReason = t[4]
    c.ineligible = t[5]
    c.signupDate = t[6]
    contestants << c
}

new File('output/contestants.sql').withWriter { out ->
    def i = 0
    contestants.each {
        def line = new StringBuilder()
        line.append('INSERT INTO contestant (id, version, email, entry, ')
        line.append('ineligibility_reason, ineligible, signup_date) VALUES (')
        line.append("${++i}, ${it.version}, '${it.email}', '${it.entry}', ")
        line.append("'${it.ineligibilityReason}', '${it.ineligible}', ")
        line.append("'${it.signupDate}');")
        out.writeLine(line.toString())
    }
}