# Prepare for development

You're preparing to develop a new feature.

You will not do any developement work yet, ONLY preparing a worktree and session.

## Pre-Requisities

- You've fetched a linear issue and have context on the issue
- there's a script in hack/create_worktree.sh for you to use to make worktrees
- theres an implementation plan in the thoughts/ folder that directly correlates to the work (if present)

If you find at any point that these are not true, STOP and ask the user for clarification.

## Instructions

### 1. find the implementation plan

search the thoughts folder for an implementation plan that directly correlates to the issue (if present)

If there are multiple implementation plans, ask the user to choose one.

### 2. Confirming with the user

review your context and confirm you're ready to proceed, for example:

```
Ready to set up the dev environment for issue ENG-XXXX

Branch name: ...
Worktree path: ...
Primary implementation plan: ...
```

### 3. move linear issue to "in dev"

use the linear mcp tool to move the issue to "in dev" - you may need to fetch workflow states first

### 4. read the create_worktree.sh script

use Read() without a limit/offset to read the entire script

### 5. run the script with parameters

use the script in hack/create_worktree.sh to create a worktree

```
./hack/create_worktree.sh BRANCH_NAME WORKTREE_DIR
```

## When you're done

When you're done, you can encourage the user to launch a new session in the created worktree (fill in PLAN_PATH)

```
npx humanlayer launch -m opus -w WORKTREE_DIR "/implement_plan using the plan at PLAN_PATH"
```
