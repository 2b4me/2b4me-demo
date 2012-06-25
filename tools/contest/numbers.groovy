import java.util.Random

def r = new Random(2746);

def printed = []

new File('output/numbers.txt').withWriter { out ->
    while ( printed.size() < 10000 ) {
        def num = String.format("%05d", r.nextInt(10000));
        if (!printed.contains(num)) {
            printed << num
            if (num == '00000') num = '10000'
            out.writeLine(num)
        }
    }
}
