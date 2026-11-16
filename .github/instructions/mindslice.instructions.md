---
applyTo: "**"
description: "Use selected Mindslice knowledge when answering or changing this application."
---

# Mindslice knowledge

For substantive tasks and status questions, consult relevant shared knowledge,
identify the documented or user-specified tracker, and survey every connected
homebase and known project before answering or acting.

```sh
mindslice status --json
mindslice projects list --hb <homebase-id> --json
mindslice projects resolve --hb <homebase-id> --json
```

Repeat list and resolve for each homebase ID from status. If the service is
stopped, run mindslice service start and repeat mindslice status --json. Ask
the user to choose an ambiguous checkout or provide an absolute path for an
unresolved project; report permission errors and stale references.
Follow .claude/skills/mindslice-knowledge/SKILL.md for selected reads. Inspect
project instructions, README and relevant code, interfaces and tests; narrow
deeper research after that survey.
Report missing context and inaccessible evidence.

This is guidance, not enforcement and grants no access. Do not bypass selection
or edit generated context. After an application change, summarize it and ask
whether the user wants to investigate and potentially update shared
documentation. Wait for explicit approval before that work unless already
requested; if declined or unanswered, leave documentation unchanged and report
it as deferred.
