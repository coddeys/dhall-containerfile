{-|
This file provides a central `Prelude` import for the rest of the library to
use so that the integrity check only needs to be updated in one place
whenever upgrading the interpreter.
-}
  env:DHALL_PRELUDE
? https://raw.githubusercontent.com/dhall-lang/dhall-lang/v23.1.0/Prelude/package.dhall
    sha256:931cbfae9d746c4611b07633ab1e547637ab4ba138b16bf65ef1b9ad66a60b7f
