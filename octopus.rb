require 'byebug'

def sluggish_octopus(array)
    string = ''
    array.each do |ele|
        array.each do |ele2|
            string = ele2 if ele2.length > ele.length
        end
    end
    string
end

def dominant_octopus(array)
    return array if array.length <= 1
    prc = Proc.new {|a,b| a<=>b}
    middle = array.length/2

    sorted_left = dominant_octopus(array.take(middle))
    sorted_right = dominant_octopus(array.drop(middle))

    
    merged = merge(sorted_left, sorted_right)
end


def merge(left, right)
    prc = Proc.new {|a, b| a<=>b}
    merged = []

    until left.empty?||right.empty?
        if prc.call(left.first.length, right.first.length) < 1
            merged << left.shift
        else
            merged << right.shift
        end
    end

    return merged + left + right
end



def clever_octopus(array)
    string = ''
    array.each do |ele|
        string = ele if ele.length > string.length
    end
    string
end


p dominant_octopus(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh', 'fish'])