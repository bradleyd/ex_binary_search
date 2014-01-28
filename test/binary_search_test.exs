defmodule BinarySearchTest do
  use ExUnit.Case

  test "returns sort list" do
    assert [1,2,3] == BinarySearch.sort([3,2,1])
  end

  test "binary search for 3 in list" do
    assert {:ok, 8} == BinarySearch.find([3,2,6,8],8)
  end

  test "binary search does not find match" do
    assert {:error, "9 was not found"} == BinarySearch.find([3,2,6,8],9)
  end

  test "binary search finds match with min max as params" do
    assert {:ok, 6} == BinarySearch.find([3,2,6,8],6,0,0)
  end

end
