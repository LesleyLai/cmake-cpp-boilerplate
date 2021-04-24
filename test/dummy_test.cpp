#include <catch2/catch.hpp>

#include "dummy.hpp"

TEST_CASE("Fibonacci number test")
{
  REQUIRE(fib(-1) == 0);
  REQUIRE(fib(0) == 0);
  REQUIRE(fib(10) == 55);
}