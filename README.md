# WeriiHQ (`dwilzon/werii`)

> Planning, architecture, and source-of-truth for the WeriiHQ ecosystem.

**WeriiHQ** is a personal AI operating system + products platform built around [Qordi](./QORDI_SPEC.md) — a voice-first companion that captures scattered ideas and turns them into actionable momentum.

**Tagline:** "Think Sharper. Live Awake."

---

## Repositories

| Repo | Description |
|------|-------------|
| [dwilzon/werii](https://github.com/dwilzon/werii) | Planning hub, architecture docs, and source-of-truth (this repo) |
| [dwilzon/web](https://github.com/dwilzon/web) | Next.js frontend for Qordi (voice-to-insight companion) |
| dwilzon/api | Backend API functions — transcription, embeddings, RAG, guidance |
| dwilzon/core | Shared business logic — skills, models, utilities |
| dwilzon/infra | OpenClaw VPS setup, Docker configs, deployment scripts |
| dwilzon/docs | Architecture decisions, roadmap, and full specifications |

---

## What's in This Repo

| File | Purpose |
|------|---------|
| [SYSTEM_ARCHITECTURE.md](./SYSTEM_ARCHITECTURE.md) | Full system design — OpenClaw, Qordi, WeriiHQ layers |
| [REPO_STRUCTURE.md](./REPO_STRUCTURE.md) | Detailed folder layout for every repo |
| [QORDI_SPEC.md](./QORDI_SPEC.md) | Qordi product specification — features, users, monetization |
| [ROADMAP.md](./ROADMAP.md) | 8-week execution plan to public launch |
| [OPENCLAW_SKILLS.md](./OPENCLAW_SKILLS.md) | Custom OpenClaw skill specifications |
| [REVENUE_STREAMS.md](./REVENUE_STREAMS.md) | Business model and revenue stream breakdown |
| [LOCKED_DECISIONS_MAR_1_2026.md](./LOCKED_DECISIONS_MAR_1_2026.md) | Locked architectural and product decisions |
| [COPILOT_INSTRUCTIONS.md](./COPILOT_INSTRUCTIONS.md) | Development guidelines for AI-assisted coding |

---

## Architecture Overview

WeriiHQ is built on three layers:

1. **OpenClaw** — self-hosted personal AI brain (runs on your VPS, not exposed to end users)
2. **Qordi** — the voice-first product you sell ($9/mo freemium SaaS)
3. **WeriiHQ Hub** — business analytics and content engine

See [SYSTEM_ARCHITECTURE.md](./SYSTEM_ARCHITECTURE.md) for the full design.

---

## Current Status (Mar 1, 2026)

- `dwilzon/werii` — planning hub initialized ✅
- `dwilzon/web` — bootstrapped with Next.js + TypeScript + Tailwind ✅
- Locked decisions captured in [LOCKED_DECISIONS_MAR_1_2026.md](./LOCKED_DECISIONS_MAR_1_2026.md) ✅
- `dwilzon/api`, `dwilzon/core`, `dwilzon/infra`, `dwilzon/docs` — planned, pending setup 🔲

---

## Quick Links

- [Roadmap](./ROADMAP.md) — week-by-week plan
- [Qordi Spec](./QORDI_SPEC.md) — product definition
- [Architecture](./SYSTEM_ARCHITECTURE.md) — system design
- [Dev Guidelines](./COPILOT_INSTRUCTIONS.md) — coding standards
