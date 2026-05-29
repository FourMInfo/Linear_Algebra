---
applyTo: '**'
---
# Linear Issue Management

## Data Model

| Linear Concept | Study Hub Meaning |
|---|---|
| Project | Single container for all study hub work: "Math & Tech Study" |
| Milestone | Bounded workplan with a clear completion point (e.g. Workspace Restructure) |
| Issue | Atomic unit of work |
| Label | Topic + Area + Scope + Type + Origin + optional Phase classification |

### Labels

Every issue has exactly one Topic label, one Area label, one Scope label, one Type label, and one Origin label.
When issues belong to a phased workplan, add exactly one Phase label.

**Topic:** `Math Foundations` · `Linear Algebra` · `Calculus` · `Study Website`

**Area:** `Code` · `Documentation` · `Infrastructure`

**Type:** `Feature` · `Refactor` · `Bug` · `Chore` · `Question`

**Origin:** `Local` · `Cross-Project` — whether this issue was triggered by work in this repo (`Local`) or is a propagation of a change from another repo (`Cross-Project`)

**Phase:** `Phase 1` · `Phase 2` · `Phase 3` · `Phase 4` (add more labels if needed for longer plans)

**Scope by Area:**

| Area | Scope options |
|---|---|
| Code | `Module` · `Function` · `Notebook` |
| Documentation | `Guide` · `Basic` · `Intermediate` · `Advanced` · `Website` |
| Infrastructure | `CI` · `Tests` · `Julia Repo` · `DrWatson` · `Franklin` · `Claude Instructions` · `LaTeX` |

### Label Assignment

| Content | Area | Scope |
|---|---|---|
| Changes to `src/` Julia source files | `Code` | `Module` or `Function` |
| Changes to `notebooks/` Jupyter notebooks | `Code` | `Notebook` |
| Changes to `docs/src/` markdown documentation | `Documentation` | `Basic` / `Intermediate` / `Advanced` |
| Changes to study website Franklin content | `Documentation` | `Website` |
| Study guide documents not tied to a specific repo | `Documentation` | `Guide` |
| Changes to `.github/workflows/CI.yml` | `Infrastructure` | `CI` |
| Changes to `test/` files | `Infrastructure` | `Tests` |
| Changes to `Project.toml`, `Manifest.toml`, workspace structure | `Infrastructure` | `Julia Repo` |
| Changes to DrWatson usage or removal | `Infrastructure` | `DrWatson` |
| Changes to Franklin site structure or templates | `Infrastructure` | `Franklin` |
| Changes to `.github/instructions/*.instructions.md` | `Infrastructure` | `Claude Instructions` |
| Changes to LALatex configuration or LaTeX conventions | `Infrastructure` | `LaTeX` |

### Kanban States

- `Todo` — not yet started
- `In Progress` — actively being worked on
- `In Review` — PR open, awaiting CI or self-review
- `Done` — merged to main, deployed where applicable
- `Cancelled` — decided not to do

---

## Core Principles for Milestone Creation

- Milestones are meaningful workplans with a clear completion point, not just arbitrary time-based buckets.
- Milestone titles must be self-explanatory about the goal and scope of the work.
- Milestones should be created when there is a clear set of issues that can be defined to achieve a specific outcome, not before.
- Milestones should be topic-specific (e.g. `Workspace Restructure (Math Foundations)`) to avoid confusion about which issues belong where, especially when work is being propagated across topics.

---

## Core Principles for Issue Creation

- Issues are atomic: completable in one focused session or at most one day. Split anything larger.
- Issue titles must be self-explanatory without opening the issue. Never use terse checklist-style titles.
- Every issue must have exactly one Topic label, one Area label, one Scope label, one Type label, and one Origin label.
- For phased milestones, do not encode phase in the issue title (`[Phase X]`). Use a dedicated `Phase X` label instead.
- If required phase labels do not exist yet, create them first (for example `Phase 1` through `Phase N`) and then assign them to issues.
- Issues triggered by a change in another repo get the `Cross-Project` Origin label and the Topic label of the repo where the work will land (e.g. `Linear Algebra`). They must be linked to the originating issue, and the issue description must record which repo triggered it.
- Issues in this repo should always be assigned to the user 'Aron T'
- Issues in this repo should always be added to the Linear Project 'Math & Tech Study'
- Issues should be added to the current active milestone for their topic unless told to add them to a specific milestone.

---

## Ordering Within a Phase

Use these rules to express execution order inside a single phase:

1. Use `blocked by` / `blocks` links for hard prerequisites where one issue cannot start before another.
2. Use issue `priority` to indicate urgency/value when there is no hard dependency:
    - Higher priority = minimally necessary
    - Lower priority = nice-to-have
3. Keep title wording clean and descriptive; ordering signals belong in relationships and metadata, not title prefixes.

---
## Propagating Changes Across Projects

When a single issue in one topic should be reflected in other topics:

1. Complete the originating issue and close it.
2. For each target repo, create a new issue with:
   - Topic label: the target repo (e.g. `Linear Algebra`)
   - Origin label: `Cross-Project`
   - Type label: same as originating issue
   - Area and Scope labels: same as originating issue
   - Title: `Replicate [change description] from [source topic]`
   - Description must state: which repo triggered this, a link to the originating issue, and any adaptations needed for the target repo
3. Link each new issue to the originating closed issue.
4. Add each new issue to `Todo` (backlog) unless explicitly told to place it in a specific milestone.

When an entire milestone needs to be propagated across topics:

1. Create a dedicated cross-project milestone in the target topic before creating propagated issues.
2. Use this naming convention:
    - `Cross-Project: [Source Milestone] ([Source Topic] -> [Target Topic])`
    - Example: `Cross-Project: Workspace Restructure (Math Foundations -> Linear Algebra)`
3. In the milestone description, include explicit source and target markers:
    - `Source Topic: ...`
    - `Target Topic: ...`
    - `Source Milestone: ...`
4. Create and link propagated issues following the single-issue rules above (Origin = `Cross-Project`, Topic = target repo).
5. Attach all propagated issues for that source milestone to the new cross-project milestone.


---

## Issue Description Template

For non-trivial issues use this structure:

```
**Goal:** One sentence describing what this accomplishes and why.

**Context:** Background needed — which workplan phase, what depends on it, what it unblocks.

**Acceptance criteria:**
- Specific, verifiable conditions for closing this issue
- Reference CI passing, docs building, or tests passing as appropriate

**References:** Links to related issues, PRs, or workplan documents.
```

Simple one-action issues do not need the full template — a single clear sentence is sufficient.

---

## Replicating a Milestone Across Topics

When asked to copy a completed milestone from one topic to another (e.g. applying the Math Foundations workspace restructure to Linear Algebra):

1. Read all closed issues in the source milestone via MCP to understand what was done.
2. Identify which issues are identical, which need adaptation, and which are already done in the target topic.
3. Create the new milestone using the cross-project naming convention from `Propagating Changes Across Projects`.
4. Create adapted issues — do not mechanically copy titles, adjust for the target topic's specifics (package name, UUIDs, file paths), and attach them to the new cross-project milestone.
5. Present a count summary of proposed issues to the user for review before creating anything.

---

## GitHub PR Integration

When writing or reviewing a PR description for work that closes Linear issues:

- Reference every Linear issue closed by the PR using magic words in the PR description: `Closes FOU-12, FOU-13, FOU-14`
- When a PR covers an entire milestone, still enumerate the individual issue IDs in the PR `Closes ...` list. Do not rely on milestone linkage alone.
- If asked to generate a PR description, include the closes list automatically based on the open issues in the active milestone.
- After merge (and deployment where applicable), explicitly reconcile milestone issue state in Linear:
    - verify which issues auto-closed from PR keywords
    - manually close any remaining issues that were completed by the milestone PR
    - keep genuinely incomplete follow-up work open (or move it to a new issue/milestone)

When work is delivered by direct commit and push (without a PR):

- Do not wait for PR auto-close behavior; it will not apply.
- After each push (and deployment where applicable), manually close every issue completed by that pushed change set.
- If a push only partially completes an issue, leave the issue open and update its description or comments with remaining work.
- For milestone execution using commit-and-push batches (for example, phase-by-phase delivery), reconcile issue states after each pushed batch so Linear always reflects real progress.

---

## Milestone Sequencing (Current)

This section is a reference for the current sequencing of milestones as we execute the Linear restructuring workplan. This will evolve as we complete milestones and create new ones, but it serves as a snapshot of the current plan.

```
LaTeX Restructure (Linear Algebra)         ← current active milestone
    ↓
Workspace Restructure (Math Foundations)
    ↓
Workspace Restructure (Linear Algebra)     ← copy milestone from Math Foundations via MCP
    ↓
Calculus Repo Setup (Calculus)             ← new repo built from scratch in new structure
```

---

## Creating Issues from Markdown Workplans

**NB:** This section is only relevant until we have migrated all current Markdown Workplans.

When asked to migrate a markdown workplan to Linear:

1. Read the full document first to understand the overall goal before creating any issues.
2. Map phases to `Phase` labels (`Phase 1`, `Phase 2`, etc.) where the phase structure is meaningful.
3. Create missing `Phase` labels before creating/updating issues if the workplan requires phases.
4. Expand terse checklist items — use context from the surrounding section to write a description clear to someone reading the issue months later.
5. Done items `[x]` → create as closed issues.
6. Not-done items `[ ]` → create as open issues in `Todo`.
7. Identify cross-project items and create them with the `Cross-Project` Origin label, using the target repo as the Topic label, and link back to the source issue.
8. After creating all issues, report a count summary: total issues created, how many closed, how many open, how many cross-project, and any ambiguous items that needed a judgment call. Verify this count against the number of checklist items in the source document before reporting. If the counts do not match, identify and resolve the discrepancy before declaring the migration complete.
