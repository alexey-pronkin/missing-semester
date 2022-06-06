package main

import "fmt"

func search(nums []int, target int) int {
	// Binary Search

	left := 0
	right := len(nums) - 1
	middle := 0

	for left-right > 1 {
		fmt.Println(left, right, middle)
		middle = (left + right) / 2

		if target < nums[middle] {
			right = middle
		}
		if target > nums[middle] {
			left = middle
		} else {
			return middle
		}
	}
	if nums[left] == target {
		return left
	}
	if nums[right] == target {
		return right
	}

	/* else {
		return -1
	} */
	return -1
}
func main() {

	arr := []int{-1, 0, 3, 5, 9, 12}
	fmt.Println(search(arr, 9))
}
