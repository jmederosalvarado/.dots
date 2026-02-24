---
description: Fetch origin and merge the default branch into the current branch
---

The default branch is: $1

Perform the following steps:

1. Fetch the latest changes from origin
2. Merge the default branch from origin using `--no-commit` to stage changes without committing
3. If there are conflicts, resolve them intelligently. Ask me questions if anything is unclear.
4. Commit with message format: `merge: origin/<default-branch> into <current-branch>`. If there were conflicts, add a description with concise bullet points explaining what conflicts occurred and why you resolved them that way.
