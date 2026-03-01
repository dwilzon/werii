# WeriiHQ Locked Decisions (Mar 1, 2026)

This file captures decisions recovered from:

- `sat_feb_28_2026_setting_up_the_weriihq_repository_flow.json`

## 1) Product Direction

- Build **Qordi** as the primary user-facing product.
- Positioning: voice-first idea capture -> organization -> guidance -> action.
- Mascot/brand direction stays: Goldendoodle companion with progress-based evolution.

## 2) Architecture Choice

- **Option A is locked in**:
  - OpenClaw is the internal/personal engine.
  - Qordi is the external customer-facing service.
- Do **not** require end users to install/package OpenClaw themselves.

## 3) Repository Strategy

- Organization/repo split is the intended model:
  - org: `weriihq`
  - repos: `api`, `web`, `core`, `infra`, `docs`
- Shared documentation conventions remain valid:
  - `.copilot/instructions.md`
  - `docs/architecture.md`
  - `docs/api.md`
  - `docs/decisions/`

## 4) Workflow Decisions

- Avoid notebook-centered workflow.
- Use repo files + Copilot Chat with workspace context as source of truth.
- Preserve decisions in markdown docs to avoid loss across sessions.

## 5) Hosting/Execution Preference

- Hosting preference emphasized: **Hostinger VPS + OpenClaw one-click path**.
- Avoid unnecessary learning curve where possible; prioritize practical shipping.

## 6) Delivery Priorities

- Build simple products that deliver direct value quickly.
- Focus on shortest path from idea -> MVP -> user feedback -> iteration.
- Use measurable traction to decide what to continue or stop.

## 7) Immediate Operating Rule

- No major architecture pivots without explicit confirmation against this file.
- New sessions should start by reading this file first.
