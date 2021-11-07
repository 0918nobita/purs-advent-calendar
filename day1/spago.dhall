{ name = "day1"
, dependencies =
    [ "console"
    , "effect"
    , "prelude"
    , "psci-support"
    ]
, packages = ../packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
