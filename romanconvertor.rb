def fromRoman(romanNumber)
    # Replace the following line with the actual code!
    $numberTable = {
        "I" => 1,
        "V" => 5,
        "X" => 10,
        "L" => 50,
        "C" => 100,
        "D" => 500,
        "M" => 1000
    }

    romanNumberArray = romanNumber.split('')
    romanNumberArray.each do |c|
        unless $numberTable.has_key?(c) then
            raise TypeError
        end
    end

    def isNextLetterLarger(currentRomanNumber, nextRomanNumber)
        if $numberTable[nextRomanNumber] > $numberTable[currentRomanNumber] then
            return true
        end
        return false
    end

    finalValue = 0
    skip = false
    for i in (0..romanNumberArray.length-1) do
        if skip then
            skip = false
            next
        end
        if i == romanNumberArray.length-1 then
            finalValue += $numberTable[romanNumberArray[i]]
            next
        end

        if isNextLetterLarger(romanNumberArray[i], romanNumberArray[i+1]) then
            finalValue += $numberTable[romanNumberArray[i+1]] - $numberTable[romanNumberArray[i]]
            skip = true
        else
            finalValue += $numberTable[romanNumberArray[i]]
        end
    end

    return finalValue
end

def toRoman(arabicNumber)
    # Replace the following line with the actual code!
    $romanTable = {
        1 => "I",
        4 => "IV",
        5 => "V",
        9 => "IX",
        10 => "X",
        40 => "XL",
        50 => "L",
        90 => "XC",
        100 => "C",
        400 => "CD",
        500 => "D",
        900 => "CM",
        1000 => "M"
    }

    if arabicNumber <= 0 || arabicNumber >= 4000 then
        raise RangeError
    end

    def findLargestInTable(number)
        largest = 0
        $romanTable.each_pair do |key, value|
            if number >= key then
                largest = key
            end
        end
        return largest
    end

    currentValue = arabicNumber
    romanStr = ""
    until currentValue <= 0 do
        nextGroupNum = findLargestInTable(currentValue)
        currentValue -= nextGroupNum
        romanStr = "#{romanStr}#{$romanTable[nextGroupNum]}"
    end

    return romanStr
end