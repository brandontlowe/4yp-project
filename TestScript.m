example = Frontier(8,6,8);
example.coordinates(:,1:4)
example.Put(7,2);
example.coordinates(:,1:4)

[x, y] = example.Get();
example.coordinates
x
y

examplecf = CameFrom(8);
examplecf.visited
examplecf.camefrom
examplecf.Put(5,2,1,1);
examplecf.visited
examplecf.camefrom