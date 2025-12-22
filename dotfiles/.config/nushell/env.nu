# Voidrice-inspired Nushell Environment
# Environment variables and PATH setup

# XDG directories
$env.XDG_CONFIG_HOME = ($env.HOME | path join ".config")
$env.XDG_DATA_HOME = ($env.HOME | path join ".local" "share")
$env.XDG_CACHE_HOME = ($env.HOME | path join ".cache")

# Default programs
$env.EDITOR = "nvim"
$env.VISUAL = "nvim"
$env.BROWSER = "open"
$env.TERMINAL = "alacritty"

# PATH additions
$env.PATH = ($env.PATH | split row (char esep) | append [
    ($env.HOME | path join ".local" "bin")
    ($env.HOME | path join ".cargo" "bin")
    "/opt/homebrew/bin"
    "/usr/local/bin"
] | uniq)

# Less options
$env.LESS = "-R"
$env.LESSHISTFILE = "-"

# FZF options
$env.FZF_DEFAULT_OPTS = "--height 40% --layout=reverse --border"

# Ripgrep config
$env.RIPGREP_CONFIG_PATH = ($env.XDG_CONFIG_HOME | path join "rg" "config")

# Clean home directory
$env.LESSHISTFILE = ($env.XDG_CACHE_HOME | path join "less" "history")
$env.CARGO_HOME = ($env.XDG_DATA_HOME | path join "cargo")
$env.RUSTUP_HOME = ($env.XDG_DATA_HOME | path join "rustup")

# Development
$env.GOPATH = ($env.XDG_DATA_HOME | path join "go")

# Colors for ls
$env.LS_COLORS = "di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40:sg=36;40:tw=32;40:ow=33;40:"