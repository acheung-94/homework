require 'set'
class GraphNode
    attr_reader :neighbors, :value
    def initialize(value)
        @value = value
        @neighbors = []
    end

    def neighbors=(array)
        @neighbors = array
    end
end

def bfs(start, target_val, visited = Set.new())
    line = [start]

    until line.empty?
    current_node = line.shift
    return "#{current_node.value} has been visited already." if visited.include?(current_node)
    if current_node.value == target_val
        return current_node
    else
        p current_node.value
        line += current_node.neighbors
        visited << current_node
    end
end

end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

p bfs(f, "a")