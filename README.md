# WeriiHQ (`dwilzon/werii`)

> Monorepo — planning, architecture, and all sub-projects for the WeriiHQ ecosystem.

**WeriiHQ** is a personal AI operating system + products platform built around [Qordi](./QORDI_SPEC.md) — a voice-first companion that captures scattered ideas and turns them into actionable momentum.

**Tagline:** "Think Sharper. Live Awake."

> **Note on username:** This repo lives at `dwilzon/werii` for now. The intended home is `weriicore/werii` once that username is recovered.

---

## Monorepo Structure

All sub-projects live as folders inside this repo:

```
dwilzon/werii/          ← this repo  (future: weriicore/werii/)
├── web/                ← Next.js frontend for Qordi
├── api/                ← Backend API (transcription, RAG, guidance)
├── core/               ← Shared business logic (skills, models, utils)
├── infra/              ← OpenClaw VPS setup, Docker, deploy scripts
├── docs/               ← Architecture decisions and full specifications
└── (planning docs)     ← SYSTEM_ARCHITECTURE.md, ROADMAP.md, etc.
```

## Sub-project Descriptions

| Folder | Description |
|--------|-------------|
| [web/](./web/README.md) | Next.js frontend for Qordi (voice-to-insight companion) |
| [api/](./api/README.md) | Backend API functions — transcription, embeddings, RAG, guidance |
| [core/](./core/README.md) | Shared business logic — skills, models, utilities |
| [infra/](./infra/README.md) | OpenClaw VPS setup, Docker configs, deployment scripts |
| [docs/](./docs/README.md) | Architecture decisions, roadmap, and full specifications |

---

## Planning Docs (Root Level)

| File | Purpose |
|------|---------|
| [SYSTEM_ARCHITECTURE.md](./SYSTEM_ARCHITECTURE.md) | Full system design — OpenClaw, Qordi, WeriiHQ layers |
| [REPO_STRUCTURE.md](./REPO_STRUCTURE.md) | Detailed folder layout for every sub-project |
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

- `werii/` monorepo — initialized ✅
- `werii/web/` — Next.js + TypeScript + Tailwind baseline in progress 🔲
- `werii/api/` — planned, pending build 🔲
- `werii/core/` — planned, pending build 🔲
- `werii/infra/` — planned, pending build 🔲
- `werii/docs/` — planned, pending build 🔲
- Locked decisions captured in [LOCKED_DECISIONS_MAR_1_2026.md](./LOCKED_DECISIONS_MAR_1_2026.md) ✅

---

## Quick Links

- [Roadmap](./ROADMAP.md) — week-by-week plan
- [Qordi Spec](./QORDI_SPEC.md) — product definition
- [Architecture](./SYSTEM_ARCHITECTURE.md) — system design
- [Dev Guidelines](./COPILOT_INSTRUCTIONS.md) — coding standards
