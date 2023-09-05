
def bubble_sort(arr)

    # Number of elements in the array
    n_elements = arr.length

    swapped = true

    # Loop through the array until no more swaps are made
    while swapped do
        swapped = false
        # Loop through the array and swap elements if they are in the wrong order
        (n_elements - 1).times do |i|
            if arr[i] > arr[i + 1]
                arr[i], arr[i + 1] = arr[i + 1], arr[i] # Swap elements
                swapped = true # Set swapped to true to continue the loop if a swap was made
            end
        end
    end