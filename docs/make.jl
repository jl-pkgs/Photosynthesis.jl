using Documenter, Photosynthesis, Unitful

makedocs(
    modules = [Photosynthesis],
    sitename = "Photosynthesis.jl",
    pages = Any[
        "Home" => "index.md",
    ],
    clean = false,
)

deploydocs(
    repo = "github.com/jl-pkgs/Photosynthesis.jl.git",
)
