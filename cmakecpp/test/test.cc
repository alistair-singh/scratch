
#define CATCH_CONFIG_MAIN
#include "catch.hpp"

#include "skel.hh"

TEST_CASE( "My first test case", "[skel-general]" ) {
  REQUIRE( 1 == 1 );
}

