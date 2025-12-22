# Simple working nushell config

# Hide banner
$env.config = ($env.config | upsert show_banner false)

# Set vi mode  
$env.config = ($env.config | upsert edit_mode "vi")

# Simple aliases
alias l = ls -la
alias ll = ls -l  
alias v = nvim
alias c = clear
alias .. = cd ..
alias g = git
alias gs = git status

# Custom commands
def mkcd [name: string] {
    mkdir $name; cd $name
}

def cdh [] { cd ~ }
def cdc [] { cd ~/.config }
def cdv [] { cd ~/.config/nvim }

# Simple prompt
$env.PROMPT_INDICATOR = " > "
$env.PROMPT_INDICATOR_VI_INSERT = " > "
$env.PROMPT_INDICATOR_VI_NORMAL = " :: "