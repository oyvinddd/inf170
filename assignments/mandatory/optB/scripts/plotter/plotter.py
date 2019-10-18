import matplotlib.pyplot as plt

class City:
    def __init__(self, name, x, y):
        self.name = name
        self.x = int(x)
        self.y = int(y)
    def __str__(self):
        return 'City #' + str(self.name)

def read_cities_from_file(filename):
    cities = []
    with open(filename) as file:
        for line in file:
            parts = line.split()
            cities.append(City(parts[0], parts[1], parts[2]))
    return cities

def read_arcs_from_file(filename):
    arcs = []
    with open(filename) as file:
        for line in file:
            parts = line.split()
            arcs.append((parts[0], parts[1]))
    return arcs

def to_city_dict(cities):
    dict = {}
    for c in cities:
        dict[c.name] = c
    return dict

def plot_cities():
    
    cities = read_cities_from_file('NorwayTSP_Data.txt')
    arcs = read_arcs_from_file('arcs.txt')
    
    x_coords = list(map(lambda c: c.x, cities))
    y_coords = list(map(lambda c: c.y, cities))

    c_dict = to_city_dict(cities)
    # Plot cities (scatter plot)
    for i in range(len(x_coords)):
         plt.scatter(x_coords[i], y_coords[i], label='Cities', s=10)
    # Plot arcs between cities (lines)
    walk(arcs, c_dict, 1, 0)
    plt.title('Distance between cities in Norway (Svetska)')
    plt.xlabel = 'x - axis'
    plt.ylabel = 'y - axis'
    plt.show()

def plot_neighbors(c1, c2):
    plt.plot([c1.x, c2.x], [c1.y, c2.y])

def walk(arcs, cities, s, cnt):
    if cnt == 103:
        return
    print('Visiting: ' + arcs[int(s)-1][0])
    
    arc = arcs[int(s)-1]
    c1 = cities[arc[0]]
    c2 = cities[arc[1]]
    plot_neighbors(c1, c2)

    cnt+=1
    return walk(arcs, cities, arcs[int(s)-1][1], cnt)


plot_cities()



