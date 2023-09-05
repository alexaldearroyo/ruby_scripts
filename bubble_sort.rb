
def bubble_sort(arr)

    # Number of elements in the array
    n_elements = arr.length

    swap = true

    # Loop through the array until no more swaps are made
    while swap do
        swap = false
        # Loop through the array and swap elements if they are in the wrong order
        (n_elements - 1).times do |i|
            if arr[i] > arr[i + 1]
                arr[i], arr[i + 1] = arr[i + 1], arr[i] # Swap elements
                swap = true # Set swapped to true to continue the loop if a swap was made
            end
        end
    end