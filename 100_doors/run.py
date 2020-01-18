#!/usr/bin/env python

def create_doors():
    """Create an array of 100 elements, set to 0."""
    doors = []
    for i in range(100):
        doors.append(0)
    return doors

def toggle_doors(doors, skip):
    """Toggle every skip door in doors.

    doors is an array of elements where a false value represents a
    closed door and a true value represents an open door.

    If skip is 1, toggle door #1, #2, #3...
    If skip is 2, toggle door #2, #4, #6...

    Returns doors
    """
    for i in range(skip-1, len(doors), skip):
        if doors[i]:
            doors[i] = 0
        else:
            doors[i] = 1
    return doors

def main():
    """Run the problem, displaying the results of 100 toggle passes.

    Create 100 doors.
    Toggle every door.
    Toggle every other door.
    Toggle every third door.
    to 100.
    Print the final state of the doors.
    """
    doors = create_doors();
    for i in range(len(doors)):
        doors = toggle_doors(doors, i+1)
    print doors

if __name__ == "__main__":
    main()

