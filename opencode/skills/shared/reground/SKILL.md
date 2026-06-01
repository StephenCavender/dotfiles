---
name: reground
description: Re-establish context when an agent is looping, hallucinating, or stuck. Dumps relevant source files and state to break out of bad patterns.
---

# Reground

You're stuck or going in circles. Stop generating and re-read the actual code.

## When to invoke

- You've attempted the same fix 2+ times without progress
- You're generating code that doesn't match the project's actual patterns
- You're unsure what a function does and are guessing instead of reading
- Error messages aren't making sense given what you think the code does

## Steps

1. **Stop.** Don't make another attempt at the fix.

2. **Identify the confusion.** What specifically are you unsure about? Name the file, function, or behavior.

3. **Read the source.** Read the actual files involved — not from memory, from disk:
   - The file you're trying to modify
   - The file that calls it or is called by it
   - The test file (if one exists)
   - Any config that governs behavior (tsconfig, package.json scripts, etc.)

4. **State what you now know.** After reading, summarize in 2-3 sentences:
   - What the code actually does (not what you assumed)
   - How it differs from your assumption
   - What the correct fix/approach is given the actual state

5. **Resume.** Make one more attempt with the corrected understanding.

6. **If still stuck after step 5** — ask the user. Don't loop further.

## The `context-dump` helper

For quick context, run `~/.dotfiles/bin/context-dump` with relevant paths:

```bash
~/.dotfiles/bin/context-dump src/auth/ src/middleware/
```

This concatenates the key files into a single output you can re-read.

## Anti-patterns

- Reading a file and immediately editing it without processing what you read
- Re-reading the same file repeatedly without changing your approach
- Asking the user for help before you've actually read the relevant code
