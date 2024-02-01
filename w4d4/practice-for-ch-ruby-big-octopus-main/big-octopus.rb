def sluggish_octopus(array)
    sorted = false
    until sorted
        sorted = true
        (0...array.length-1).each do |i|
            case array[i].length <=> array[i+1].length
            when 1
                array[i], array[i+1] = array[i+1], array[i]
                sorted = false
            end
        end
    end
    array[-1]
end


def dominant_octopus(array)
    return array if array.length < 2
    pivot = array[0]

    left = array[1..-1].select {|el| el.length < pivot.length}
    right = array[1..-1].select {|el| el.length > pivot.length}
    
    dominant_octopus(left) + [pivot] + dominant_octopus(right)
end

def clever_octopus(array)
    array.inject {|acc, fish| fish.length > acc.length ? fish : acc}
end

def dancing_octopus(tile_dir, array)
    array.each {|dir| return array.index(dir) if dir == tile_dir}
end

def fast_octopus(tile_dir, hash)
    hash[tile_dir]
end

fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 
'fiiiissshhhhhh']

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", 
               "left",  "left-up"]
tiles_hash = {}
tiles_array.each {|fish| tiles_hash[fish] = tiles_array.index(fish)}

p sluggish_octopus(fish)
p dominant_octopus(fish)[-1] #sorry this is so weird
p clever_octopus(fish)
p dancing_octopus("left-down", tiles_array)
p "--"
p fast_octopus("left-down", tiles_hash)