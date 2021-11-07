{ name = "my-project"
, dependencies =
    [ "console"
    , "effect"
    , "prelude"
    , "profunctor-lenses"
    , "psci-support"
    ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
