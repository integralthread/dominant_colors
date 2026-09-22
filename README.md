# DominantColors

> Working in progress...

[Blog post](https://orchardlab.dev/posts/dominant-colors/)

![livebook dominant colors usage](screenshots/livebook.png)


Extract dominant colors from given image path. Wrapper around the awesome Rust library [kmeans_colors](https://github.com/okaneco/kmeans-colors).


## Installation

The NIF is compiled locally on `mix compile`, so a Rust toolchain is required
(`rust = "stable"` in `mise.toml` covers it). No precompiled binaries are
downloaded.

```elixir
def deps do
  [
    {:dominant_colors, path: "../dominant_colors"}
    # or: {:dominant_colors, git: "git@github.com:integralthread/dominant_colors.git"}
  ]
end
```

## Usage

```elixir
file_path = "test-image.png"
colors = DominantColors.dominant_colors(file_path)
# {:ok , ["#b49480", "#4b2e24", "#201310", "#7e99c5", "#947260", "#715042", "#94aacc", "#d1b8a7"] }
```

