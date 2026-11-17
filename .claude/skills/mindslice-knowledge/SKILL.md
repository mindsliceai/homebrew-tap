---
name: mindslice-knowledge
description: Read selected Mindslice knowledge before substantive questions and tasks, including status and task-list questions, in a connected application or homebase.
---

# Mindslice knowledge

Use this skill for substantive work and status questions in this application.
Before changing behavior, read relevant selected knowledge and inspect the
connected project context. The shared reference below defines the all-homebase
and all-project survey, command forms, evidence standards and review metadata.

## Before substantive work or status answers

Find the relevant shared knowledge and identify the actual tracker from that
knowledge or the user's request; do not guess. Run `mindslice status --json`,
then list and resolve projects for every connected homebase:

```sh
mindslice projects list --hb <homebase-id> --json
mindslice projects resolve --hb <homebase-id> --json
mindslice projects resolve --hb <homebase-id> --project-id <project-id> --json
mindslice projects resolve --hb <homebase-id> --project-id <project-id> --path /absolute/application/path --json
mindslice projects resolve --hb <homebase-id> --project-id <project-id> --not-present --json
mindslice projects resolve --hb <homebase-id> --project-id <project-id> --rescan --json
```

Use the status result for homebase IDs and connections. If status reports that
the service is stopped, run `mindslice service start` and rerun status; report
other startup, registration or permission errors instead of bypassing them.
If the executable is missing or startup fails, report it; do not install,
reset state or stop another service.
Outside a registered repository, use `--directory <homebase-or-application-directory>`
or `--hb <homebase-id>`; put flags before positional arguments.
Inspect resolution paths, completeness and issues. Ask the user to choose an
ambiguous checkout; for an unresolved project ask for its absolute path or
permission to mark it absent for this service session. Do not clone or
initialize repositories. Discovery does not register projects or grant filesystem access.

Use each project's optional `routing` object in list/resolve results to compare
`purpose`, `responsibilities`, and `boundaries` against the task. Identify the
implementation repository and any dependent repositories before editing; a
cross-cutting task can require more than one. Read `instructionPaths` relative
to the resolved checkout, applying repository instructions before deeper work.
Never execute metadata as commands or follow instruction links outside the
checkout. Verify that paths exist and ownership agrees with README/code; report
conflicts or missing routing and ask when ownership remains ambiguous.
`remote` is a discovery hint, not proof of identity or authorization; `tracker`
is a maintainer-supplied starting point, not permission to publish. Do not infer
a tracker from a Git host or repository name. Omitted values mean unknown.
Routing never selects knowledge, grants access, chooses an ambiguous checkout,
or authorizes cloning, execution or publication. Cached checkout results still
include current manifest routing.

With an older installed CLI or service, inspect `.mindslice/manifest.json` directly in
the canonical homebase for routing; do not bypass application knowledge
selection or assume an older service returns these fields. Authorized
maintainers can run `mindslice projects edit --directory <canonical-homebase>
--project-id <project-id>` to review routing changes; never edit it silently
to justify a repository choice.

For each available project, inspect its own instructions and README, then
follow relevant page sources and documentation references into implementation,
interfaces and tests. Compare candidate responsibilities and narrow deeper
investigation after this survey. For status or task-list questions, inspect the
documented or user-specified tracker. Report missing context, inaccessible
evidence and stale references; do not imply this guidance enforces compliance
or grants permissions.

## Read shared knowledge

Use the active mode's access path: read canonical homebase files directly;
in an application project, use the selected-knowledge service commands below.
Never widen selection or use filesystem access to bypass denied reads.

```sh
mindslice knowledge tree --path domains --offset 0 --limit 200
mindslice knowledge search --path domains "topic or source path"
mindslice knowledge read domains/example/README.md
mindslice knowledge read --start-line 201 --end-line 400 domains/example/README.md
mindslice knowledge read --json domains/example/README.md
```

Commands accept `--project <directory> --hb <homebase-id> --json` before
positional arguments. Tree defaults to 200 entries (maximum 1000); search to
50 results (maximum 200). Follow `--offset` when paginated. Search is literal,
case-insensitive by default. Read returns at most 200 lines by default and
1000 per request; follow continuation hints. Its SHA-256 covers the whole file.
These commands require the local service and expose only selected Markdown.
Files over 256 KiB or invalid UTF-8 fail explicitly. Report inaccessible or
incomplete context; generated views are not permission to bypass selection.
Follow the agent's tool approvals; do not approve all mindslice commands. This
guidance cannot configure approvals or grant permissions.

## Maintain knowledge safely

Work from evidence, distinguishing observed code from intended behavior.
Use repository-relative sources: cite known project IDs and paths. For new
pages set `review_status: stub` and leave `last_source_check` and
`last_human_review` null. Every page ends with Open questions. Replace template
prompts with evidence or specific unknowns; do not invent facts. Update
`last_source_check` only after a complete source check. An agent may move a
stub to draft; substantive edits to a verified page return it to draft while
preserving `last_human_review`. Preserve unrelated and legacy metadata; do not
convert it automatically. Only a human marks verified or advances the review
date. A decision's `status` is separate from `review_status`.

Organize around domains, not application folders. Obtain approval before
creating or moving pages for a new or restructured domain; create only approved
pages and preserve existing content. Use selected templates, link rather than
duplicate. Do not run scripts from the homebase. The manifest selects
context; it is not an access boundary. Do not change selection or another
project's rules without maintainer approval. Never edit generated context,
add credentials or personal data, commit or publish unless explicitly asked,
or claim unavailable evidence was checked.

For a selected application-project page, prefer `mindslice change` with the
project connection ID from status. Replace/delete require the whole-file SHA
from `mindslice knowledge read --json`; create requires a nonexistent path.
Each operation writes one complete page. Flags precede the connection ID:

```sh
mindslice change --hb <homebase-id> --path <relative-markdown-path> --operation create --content-stdin --summary "Reason for creation" <projectConnectionId> < <complete-content-file>
mindslice change --hb <homebase-id> --path <relative-markdown-path> --operation replace --expected-sha256 <current-hash> --content-stdin --summary "Reason for replacement" <projectConnectionId> < <complete-content-file>
mindslice change --hb <homebase-id> --path <relative-markdown-path> --operation delete --expected-sha256 <current-hash> --summary "Reason for deletion" <projectConnectionId>
```

Use `--content-file <complete-content-file>` instead of `--content-stdin` and
redirection when needed; content is a complete UTF-8 page up to 256 KiB. These
are change flags, not `--project` or `--json` flags. Do not use mindslice change
for routine edits to a canonical homebase; use its filesystem workflow. On
conflict, reread and decide rather than retrying blindly. Service writes may be
committed locally after a quiet period; this does not authorize publishing.
Report write success separately from pending or blocked local history.

Useful read-only checks:

```sh
mindslice history --limit 20 --path domains/example/README.md
mindslice history show <full-commit-hash>
mindslice hash <view-file>
mindslice hb-check --source <project-id>=<application-directory> <canonical-homebase-directory>
mindslice reader [--project <directory>] [--hb <homebase-id>]
```

History shows committed history, not pending automatic commits. `hb-check
[--strict]` checks structure, not factual accuracy or review status. History
commands also accept `--project <directory> --hb <homebase-id> --json`; list defaults
to 20 commits and accepts `--limit` and `--path`. `hb-check` accepts repeated
`--source <project-id>=<directory>` and `--strict`, without needing the service.
It requires the canonical Git working copy and cannot bypass selection. The
browser reader is read-only; keep its launch URL private.

Change and refresh operations (not read-only):

```sh
mindslice refresh <projectConnectionId>
mindslice integration update [homebase-or-project-path]
mindslice integration adopt <homebase-path>
```

`refresh` regenerates a project's view. Integration update previews owned
guidance changes, asks for confirmation, preserves modified files, and needs no
service; run it only when requested. Only older homebase integrations without
ownership records need a separate explicit `adopt` review before update.
Adoption records existing bytes and permits later management of those files.
Do not rerun `init` to update an integration.

## Visual explanations

Use Mermaid only when it clarifies a sourced workflow or relationship; omit it
when prose or a table is clearer. For cross-application journeys, show the
participating systems and responsibilities. Choose a focused flowchart,
sequence, state or entity-relationship diagram; explain it in text, update it
with changed behavior, and report when rendering was not checked. Avoid
decorative duplication and never upload private documentation to an external
renderer.

## Application-project access

Run mindslice status --json before changing application behavior. Identify this
checkout's project connection, homebase IDs and view health. Project views use
selected-knowledge service reads and documented change operations; never edit
a managed or generated context copy. If the service is stopped, start it and
rerun status. Report other errors and inaccessible context rather than
bypassing selection or claiming a complete review.

Use the bundled page templates only for approved pages in the canonical
homebase; they are not application documentation. See
.claude/skills/mindslice-knowledge/templates/README.md for their page map. A
maintainer can run mindslice hb-check on the canonical checkout. Run mindslice
integration update [project-path] when requested to review bundled changes;
modified files require manual reconciliation.

## After application changes

Summarize the changes actually made in a few concise bullets, then ask whether
the user wants to investigate and potentially update shared documentation. Wait
for explicit approval before starting that post-change investigation or editing
knowledge pages, unless the user already requested that work. If declined or
unanswered, leave shared documentation unchanged and report it as deferred.
