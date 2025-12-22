---
description: Answer questions about codelayer usage and recent sessions
---

# Read Sessions

You are tasked With analyzing session history from the CodeLayer database, CodeLayer is a tool for managing Claude code sessions.


## Initial Response

When invoked WITH a specific question:
```
I'll help answer questions about codelayer usage and recent sessions.

Please describe what you want to learn about:
- What are you working on?
- What do you want to learn about?
- What tickets or files or repos were you working in?
- Which plan or research files did you use?
- what time frame were you working in? (last 3 hours, last 24 hours, last 3 days, etc)
```

When invoked WITHOUT parameters:
```
I'll help answer questions about codelayer usage and recent sessions.

Please describe what's going wrong:
- What are you working on?
- What do you want to learn about?
- What tickets or files or repos were you working in?
- Which plan or research files did you use?
- what time frame were you working in? (last 3 hours, last 24 hours, last 3 days, etc)
```

## Environment Information

You have access to these key locations and tools:


**Logs**
- Combined WUI/Daemon logs: `~/Library/Logs/dev.humanlayer.wui/CodeLayer.log`
- Combined WUI/Daemon logs: `~/Library/Logs/dev.humanlayer.wui.pro/CodeLayer-Pro.log`

**Database**:
- Location: `~/.humanlayer/daemon.db`
- Location: `~/.humanlayer/daemon-pro.db`
- SQLite database with sessions, events, approvals, etc.
- Can query directly with `sqlite3`

**Git State**:
- Check current branch, recent commits, uncommitted changes
- Similar to how `commit` and `describe_pr` commands work
- you can `cd ../REPONAME && git ...` to understand the git state of the repo or recent commits on various branches
- you can `cd ../REPONAME && gh pr view` to view the details of an open PR

## Process Steps

### Step 1: Understand the Question

After the user describes the issue:

1. **Read any provided context** (plan or ticket file):
   - Understand what they're implementing/testing
   - Note which phase or step they're on

2. **Quick state check**:
   - Current git branch and recent commits
   - Any uncommitted changes
   - Any prs


### Step 2: Investigate the recent user messages

Find and analyze the most recent logs for codelayer launched sessions:

1. Search for codelayer launched sessions: `cat ~/Library/Logs/dev.humanlayer.wui/CodeLayer.log | grep -E "launching draft session with Claude|Executing Claude command"`
1. Search for codelayer launched sessions: `cat ~/Library/Logs/dev.humanlayer.wui/CodeLayer-Pro.log | grep -E "launching draft session with Claude|Executing Claude command"`

### Step 3: Collect Assistant messages from the database:

Check the database schema

```
sqlite3 ~/.humanlayer/daemon.db .schema sessions
sqlite3 ~/.humanlayer/daemon.db .schema conversation_events
sqlite3 ~/.humanlayer/daemon.db .schema raw_events
```

Search for assistant final messages:

```
sqlite3 ~/.humanlayer/daemon.db "select * from raw_events where event_json like '%"result"%'  AND created_at > datetime('now', '24 hour');"
```

```
sqlite3 ~/.humanlayer/daemon-pro.db "select * from raw_events where event_json like '%"result"%'  AND created_at > datetime('now', '24 hour');"
```

### Step 4: Collect Git and File State:

Understand what changed recently:

1. Check git status and current branch for the repos in question
2. Look at recent commits: git log --oneline -10 for the repos in question, and check on other branches
3. Check uncommitted changes: git diff for the repos in question
4. check for any PRs
5. other relevant research

### Step 5: Present Findings

Based on the investigation, present a focused report:

```markdown

### The issue we worked on

[description of the feature]

[the file or other links to the JIRA issue]

### Relevant files

- ..
- ..

### The Full high level timeline

[short description of all the work that was done]


### Detailed list of sessions

#### Session 1: Performing the research

[description of the session]

files created during the session:


#### Session 2: Creating the plan

[description of the session]

files created during the session:

#### Session 3: Implementing the plan

[description of the session]

Changes made during the session

```

Step 6: Write the file

write the file to shared/reports/YYYY-MM-DD-description.md
