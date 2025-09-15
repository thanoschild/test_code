class DisjointSetUnion:
    def __init__(self, n):
        # Initially, each node is its own parent
        self.parent = list(range(n))
        self.rank = [0] * n  # Used for union by rank
    
    def find(self, x):
        """Finds the representative (root) of the set containing x with path compression."""
        if self.parent[x] != x:
            self.parent[x] = self.find(self.parent[x])  # Path compression
        return self.parent[x]
    
    def union(self, x, y):
        """Unites the sets containing x and y using union by rank."""
        root_x = self.find(x)
        root_y = self.find(y)
        
        if root_x == root_y:
            return False  # Already in the same set
        
        # Union by rank
        if self.rank[root_x] < self.rank[root_y]:
            self.parent[root_x] = root_y
        elif self.rank[root_x] > self.rank[root_y]:
            self.parent[root_y] = root_x
        else:
            self.parent[root_y] = root_x
            self.rank[root_x] += 1
        
        return True

# Example usage
dsu = DisjointSetUnion(5)  # Create DSU for elements {0,1,2,3,4}

dsu.union(0, 1)
dsu.union(3, 4)

print(dsu.find(0))  # Representative of set containing 0
print(dsu.find(1))  # Should be same as find(0)
print(dsu.find(3))  # Representative of set containing 3
print(dsu.find(4))  # Should be same as find(3)
