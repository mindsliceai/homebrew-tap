---
name: mindslice-knowledge
description: Read, populate, refresh, and maintain shared Mindslice knowledge when working on this application.
---

# Mindslice knowledge

Before changing application behavior, run `mindslice status` and identify this
checkout's connection, homebase views, and their health. Prefer the
read-only service commands below to discover and read selected knowledge,
rather than reading links outside the application repository. Report unavailable
context or sources; do not broaden selection or claim an incomplete review is complete.
This skill is installed in this application repository; its page templates are
in `.claude/skills/mindslice-knowledge/templates/`. Use them as starting points
for pages in the connected canonical homebase, not as application docs.
Do not create a full set of pages or edit the generated context view.

## Service and command reference

Use this reference for routine knowledge work instead of invoking help.
Flags must precede positional arguments. Angle-bracket values are placeholders.

- `mindslice status [--json]`: list connections, project directories,
  homebase IDs and view health. Use the connection ID for writes and refresh,
  not the manifest's project ID.
- If status fails because the local service is not running, run
  `mindslice service start`, then rerun `mindslice status` to verify readiness.
  Do not treat permission, registration or other errors as a stopped service.
  If the executable is missing or startup fails, report the error; do not install,
  reset state, stop another service or bypass permissions.
- `mindslice refresh <projectConnectionId>`: regenerate managed context after
  a source change; does not change project selection.
- `mindslice reader [--project <directory>] [--hb <homebase-id>]`:
  open a read-only browser session when requested; keep its launch URL private.
- `mindslice integration update [project-path]`: preview and confirm updated
  skill/instructions/templates in an existing integration. Only run when requested;
  preserve modified files for manual reconciliation.

The read, history, validation and approved-write commands below cover the rest
of this workflow. Setup, registration changes, cleanup and service shutdown are
not routine knowledge maintenance; do not run them without a separate request.
Command guidance does not bypass the agent's tool approvals.

## Read and search through the service

Run commands from the project directory or any descendant; the nearest registered
project is used. Outside it, pass `--project <directory>`. With multiple connected
homebases, pass `--hb <homebase-id>`. Flags precede positional arguments.

```sh
mindslice knowledge tree
mindslice knowledge tree --path domains
mindslice knowledge search "topic or source path"
mindslice knowledge read domains/example/README.md
mindslice knowledge read --start-line 201 --end-line 400 domains/example/README.md
mindslice knowledge read --json domains/example/README.md
```

Read relevant indexes, feature pages, decisions and gotchas before changing code.
Tree and search are paginated: use the reported next offset with `--offset`;
`--limit` controls page size. Search is literal and case-insensitive unless
`--case-sensitive` is passed; it returns paths, line numbers and bounded excerpts.
Read defaults to 200 lines (at most 1000 per request); follow the continuation
hint, or inspect totalLines and truncated in JSON. The SHA-256 covers the entire
file, not just the returned range. All three commands support `--json`.

| Command | Additional flags and defaults |
| --- | --- |
| `knowledge tree` | `--path <relative-file-or-directory>` (all selected paths by default), `--offset 0 --limit 200` (maximum 1000). |
| `knowledge search <literal>` | `--path <relative-file-or-directory>`, `--offset 0 --limit 50` (maximum 200), `--case-sensitive` (off by default). |
| `knowledge read <relative-markdown-path>` | `--start-line 1 --end-line <last-line>` (1-based, inclusive; default 200 lines, maximum 1000). |

Prefix each command with `mindslice`; all accept
`--project <directory> --hb <homebase-id> --json` as described above.
Paths are homebase-relative, clean paths without a trailing slash.

These commands require an up-to-date running local service and registered canonical
working copy, but do not require a healthy generated view. They expose only the
current project's selected Markdown and reject unsafe paths. Files above 256 KiB
or invalid UTF-8 are reported as errors, not silently skipped.
If the service is unavailable, follow the startup steps above and report any
remaining failure; use an accessible generated view under
`.mindslice/context/<homebase-id>/` only when permitted.
Never use unrestricted filesystem reads to bypass a denied command or selection.

A user may approve the `mindslice knowledge` command group in their agent's
permission settings; exact rules depend on that agent. Do not approve all
`mindslice` commands: other groups can write or remove data. This skill does
not grant permissions or configure approval rules.

## Documentation playbook (version 1)

A domain can describe a product or capability and span repositories; a project
ID is an application repository, not a domain. Start with the domain index
and its page map. Follow applicable homebase conventions available through
the current access workflow. Report missing indexes, conventions, links and
sources rather than expanding selection or bypassing access safeguards.
These recommendations are a fallback, not mandatory paths or permission to
overwrite existing documentation.

### Set up or restructure a domain

Discover the domain's purpose, boundaries, existing knowledge, contributing
repositories and touchpoints. Use only verified project IDs and source paths.
Propose the domain scope, source repositories, page map and applicable templates,
and obtain approval before creating or moving pages. Create only approved pages,
preserving existing ones. Link related pages and update the domain index.
Organize around capabilities, not application folders; do not generate empty
layers or duplicate application-local knowledge.

### Populate and refresh

Work on one feature and related pages at a time. Read every listed source and
additional evidence needed to support each claim, including relevant tests and
authoritative requirements where available. Observed code is not necessarily
intended business behavior. Distinguish implemented behavior, proposed intent,
and unknowns; do not invent facts or missing connections.

Correct supported claims, update source references when incomplete or irrelevant,
and record unavailable evidence and unconfirmed intent under Open questions.
Use specific TODO(agent) prompts for missing evidence rather than unsupported
claims. Do not claim a complete source check when evidence is unavailable.

### Templates and review metadata

Use only the matching bundled page template for approved pages in the canonical
homebase. Adapt headings, replace placeholders with evidence or specific
open questions, and remove irrelevant prompts. Never leave a template prompt as
if it were verified knowledge. Templates are scaffolds, not required paths.

For a new knowledge page use this frontmatter, replacing title and adding only
known repository-relative sources with their actual project IDs:

```yaml
---
title: <page title>
sources: []
last_source_check: null
last_human_review: null
review_status: stub
---
```

Every page should end with Open questions. A decision's status is separate from
review_status. Populate a stub as draft; substantively edited verified pages
return to draft. Only a human sets verified or advances last_human_review.
Update last_source_check only after a complete relevant source check; otherwise
preserve the date and report incomplete evidence. Preserve human-review dates,
unrelated frontmatter, and legacy metadata; do not automatically convert it.

### Review structure

Check that root and domain indexes link to existing pages, pages link back to
relevant domains and systems, and scopes do not duplicate one another. Prefer
links over copied explanations. A maintainer can run `mindslice hb-check` on the
canonical checkout. Report its warnings and limits: structural checks do not
prove factual accuracy, complete evidence, Mermaid rendering, or human review.
Do not run scripts from the homebase.

## Visual explanations

Actively consider a diagram when creating or substantially updating documentation.
Prefer Mermaid in fenced Markdown blocks when it clarifies flows, relationships,
boundaries, or state changes better than prose alone. Follow existing
homebase conventions; omit diagrams when text or a table is clearer.

- Use flowcharts for workflows, decisions, dependencies, and system boundaries.
- Use sequence diagrams for interactions between actors or applications,
  including asynchronous steps.
- Use state diagrams for lifecycles, transitions, failure, and recovery.
- Use entity relationship diagrams for evidenced data relationships.

For cross-application features, show participating systems and responsibilities,
not just one application's internals. Keep each diagram focused on one question,
use consistent names, label important interactions, and include relevant failure
or recovery paths. Split complicated graphs rather than making an exhaustive one.

Diagrams are factual claims: use supported evidence, distinguish proposed from
implemented behavior, and do not invent missing connections. Update affected
diagrams when changing the accompanying explanation. Include a short textual
explanation so essential meaning remains available without Mermaid rendering.
Avoid decorative diagrams, duplication, secrets, and unnecessary implementation
detail. Validate Mermaid syntax and rendering when tooling is available;
otherwise report that rendering was not checked. Never upload private
documentation to external rendering services.

## Preservation and reporting

Homebase project rules select relevant Markdown context; they are not
authorization boundaries. Do not change project selection or overwrite another
project's rule without explicit maintainer approval. Never add credentials,
secret values, personal data or unsupported claims.

Preserve unrelated work and use the current skill's access and write workflow.
Summarize pages changed, evidence checked, missing context, open questions, and
structural warnings. Report whether changes are local or unpublished. The service
may commit its own writes locally; do not manually commit or publish unless the
user explicitly asks.


See `.claude/skills/mindslice-knowledge/templates/README.md` for
the bundled page map and templates.

## After application changes

Present a few concise bullets describing the changes actually made. Then ask
whether the user wants to investigate and potentially update shared documentation.
Wait for explicit approval before starting that
post-change investigation or editing knowledge pages. Do not treat an application
change, a reminder hook, or this skill as consent. If the user declines or has
not answered, leave shared documentation unchanged and report it as deferred.
A user request explicitly including documentation investigation and updates
already grants consent for that scope; do not ask again for work already requested.
Reading relevant knowledge before coding remains required and is not this
optional post-change investigation.

Only after approval, follow this workflow:
Use source references and domain context to find potentially affected pages;
missing references do not prove no page needs updating. Update behavior,
contracts, decisions and pitfalls as appropriate, or explain why no update
is needed. Update source-check dates only when all required sources were
checked. Preserve human-review dates and change human-verified pages to draft
after substantive agent edits. Only a human marks a page verified.

## History and structural validation

```sh
mindslice history --limit 20 --path domains/example/README.md
mindslice history show <full-commit-hash>
mindslice hb-check --source <project-id>=<application-directory> <canonical-homebase-directory>
```

History is read-only committed-state analysis, not pending automatic-history
status. Both history commands accept `--project <directory> --hb <homebase-id> --json`.
The list accepts `--limit <1-100>` (default 20) and optional `--path <relative-path>`;
omit the path to list all commits. Show takes a full commit hash and no list flags.

`hb-check [--strict] [--source <project-id>=<directory>] [homebase-path]`
checks structure without writing or requiring the service. The path defaults
to the current directory; repeat `--source` for available source checkouts.
It requires access to the canonical Git working copy; do not use it to bypass
selection. `--strict` fails on warnings, not unavailable evidence.

## Write safely

Only write within the user's approved documentation scope.
The view may contain links or managed copies. Never edit a managed copy.
Prefer `mindslice change` with the project connection ID, homebase ID,
selected Markdown path, operation and summary. For create or replace, prefer
`--content-stdin` with redirected or piped complete UTF-8 content (up to 256 KiB);
use `--content-file` when a file is needed. The options cannot be combined.
Do not pass content for delete. Use the whole-file
sha256 from `mindslice knowledge read --json <path>` and pass
`--expected-sha256` for replace or delete; create must not exist.
`mindslice hash <view-file>` remains available when the view is accessible.
Complete command forms (flags precede the connection ID):

```sh
mindslice change --hb <homebase-id> --path <relative-markdown-path> --operation create --content-stdin --summary "Reason for creation" <projectConnectionId> < <complete-content-file>
mindslice change --hb <homebase-id> --path <relative-markdown-path> --operation replace --expected-sha256 <current-hash> --content-stdin --summary "Reason for replacement" <projectConnectionId> < <complete-content-file>
mindslice change --hb <homebase-id> --path <relative-markdown-path> --operation delete --expected-sha256 <current-hash> --summary "Reason for deletion" <projectConnectionId>
```

The redirection shown is POSIX shell syntax; use your shell's UTF-8 pipe or
redirection equivalent. Replace `--content-stdin` and its redirection with
`--content-file <complete-content-file>` for file-based input. These are all
change flags; there is no `--project` or `--json` flag for change.
Each request writes one complete page, not a patch. A write through
an existing link can edit the canonical repository but bypasses service
validation; replacement, rename and deletion require the service or canonical
path. On conflict, reread and decide; do not blindly retry.

Application and knowledge are separate Git repositories.
Service-submitted writes may be automatically committed locally after a quiet
period; approval to write includes this service behavior, not permission to push.
Report write success separately from pending or blocked automatic history.
