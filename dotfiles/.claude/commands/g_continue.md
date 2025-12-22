0. determine your current working dir with `pwd`

1a. come up with a prompt and session title for a new agent to pick up where you left off
1b. present the prompt to the user

2. once user approves, launch a new session with humanlayer cli

```
npx humanalyer launch --model opus -w DIRECTORY --title "title" "PROMPT"
```
