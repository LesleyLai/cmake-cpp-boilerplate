#define CATCH_CONFIG_MAIN // This tells Catch to provide a main() - only do this
                          // in one cpp file
#include <catch2/catch.hpp>

#include "dummy.hpp"

TEST_CASE("Finonacci number test")
{
  REQUIRE(fib(-1) == 0);
  REQUIRE(fib(0) == 0);
  REQUIRE(fib(10) == 55);
}
