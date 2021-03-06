require "../exercise_generator"
require "../test_cases"

class SumOfMultiplesGenerator < ExerciseGenerator
  def exercise_name
    "sum-of-multiples"
  end

  def test_cases
    TestCases(SumOfMultiplesTestCase).from_json(data).cases
  end
end

class SumOfMultiplesTestCase < ExerciseTestCase
  class Input
    JSON.mapping(
      factors: Array(Int32),
      limit: Int32
    )
  end

  JSON.mapping(
    description: String,
    property: String,
    input: Input,
    expected: Int32
  )

  def fix_empty_array(factors : Array(Int32)) : String
    factors.empty? ? "[] of Int32" : factors.to_s
  end

  def workload
    "SumOfMultiples.#{property}(#{fix_empty_array(input.factors)}, #{input.limit}).should eq(#{expected})"
  end

  def test_name
    description
  end
end
