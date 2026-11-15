# Knowledge page templates

These are starting points for pages in the connected, canonical Mindslice
knowledge base. They are installed with the `mindslice-knowledge` skill in the
application repository so the agent can use them while reviewing that
application's source code.

Do not copy this entire set automatically. First agree on the domain scope and
page map, then create only the approved pages in the knowledge-base repository.
A domain can span several application repositories; organize around domain
features and system responsibilities rather than mirroring one repository's
folders.

One possible layout is:

```text
domains/<slug>/
  README.md                 # copy index.md
  overview.md
  glossary.md
  architecture.md
  features/<feature>.md
  systems/<system>.md
  decisions/<decision>.md
  gotchas.md
  testing.md
```

This is a suggested map, not a required schema. Omit layers that do not apply,
and link to related domains instead of duplicating their content.

| Template | Use for |
| --- | --- |
| `index.md` | `domains/<slug>/README.md`: scope, contributing repositories, touchpoints and page map |
| `overview.md` | Purpose, users, business context and cross-system journeys |
| `glossary.md` | Domain vocabulary, aliases and ambiguous terms |
| `architecture.md` | Responsibilities, boundaries, data and cross-system flows |
| `feature.md` | A user or business journey spanning relevant systems |
| `system.md` | One application's or service's role, interfaces and operations |
| `decision.md` | Decision rationale, alternatives and consequences |
| `gotchas.md` | Verified pitfalls, symptoms, causes and safe handling |
| `testing.md` | Actual test locations, coverage, gaps and verification steps |

Adapt or omit headings that do not fit. Keep `sources:` limited to known
repository-relative paths with their actual project IDs. Replace every
`TODO(agent)` with evidence or a specific unresolved question. Do not copy
secrets, environment values, personal data or customer records.

The page outlines use Mindslice review frontmatter. `last_source_check` is
updated only after a complete source check; only a human may set
`review_status: verified` or advance `last_human_review`. A decision's
`status` describes the decision, not its review state.
