# A simple Python script for pretty printing my solution to the Sudoku problem.
# The following paramerters was used in AMPL to create a more manageable file:
#   option omit_zero_cols 1;
#   option omit_zero_rows 1;
#   option display_1col 500;

def read_sudoku_from_file(filename):
    solution = []
    with open(filename) as file:
        for line in file:
            parts = line.split()
            solution.append((parts[0], parts[1], parts[2]))
    return solution

def eol(num):
    if num % 9 == 0:
        return '\n'
    return ''

def formatted_print(sudoku):
    for i in range(len(sudoku)):
        tile = sudoku[i]
        #print("%s----" % i)
        print("%s " % tile[2], end=eol(i+1))
    print('\n')

sudoku = read_sudoku_from_file('sudoku_solution.txt')
formatted_print(sudoku)


