# werii/docs

> Architecture decisions, roadmap, specifications, and setup guides.

**Path:** `dwilzon/werii/docs/` _(future: `weriicore/werii/docs/`)_

---

## What This Does

The canonical reference for the entire WeriiHQ system — why every decision was made, how every component works, and how to set up and deploy from scratch.

## Planned Folder Structure

```
docs/
├── README.md                      ← Start here (this file)
├── QUICK_START.md                 ← Get running in 5 minutes
│
├── architecture.md                ← System design (OpenClaw, Qordi, WeriiHQ)
├── api.md                         ← API endpoint reference
├── database.md                    ← Schema, migrations, queries
├── qordi-spec.md                  ← Product spec (features, roadmap, users)
├── openclaw-skills.md             ← What each skill does (detailed)
├── revenue-streams.md             ← Business model breakdown
│
├── roadmap.md                     ← Week-by-week plan
├── setup-guide.md                 ← How to set up locally
├── deployment.md                  ← How to deploy to Hostinger
│
├── decisions/
│   ├── why-nextjs.md
│   ├── why-supabase.md
│   ├── why-hostinger.md
│   ├── why-option-a.md            ← OpenClaw personal vs. Qordi product
│   ├── why-voice-first.md
│   └── why-freemium.md
│
└── images/
    ├── architecture-diagram.png
    ├── data-flow.png
    ├── user-flow.png
    └── wireframes/
        ├── landing.png
        ├── dashboard.png
        └── onboarding.png
```

## Key Docs (root-level planning files)

These planning files live in the repo root until the `docs/` folder is fully built out:

| File | Description |
|------|-------------|
| [../SYSTEM_ARCHITECTURE.md](../SYSTEM_ARCHITECTURE.md) | Full system design |
| [../QORDI_SPEC.md](../QORDI_SPEC.md) | Product specification |
| [../ROADMAP.md](../ROADMAP.md) | 8-week execution plan |
| [../OPENCLAW_SKILLS.md](../OPENCLAW_SKILLS.md) | OpenClaw skill specs |
| [../REVENUE_STREAMS.md](../REVENUE_STREAMS.md) | Revenue model |
| [../LOCKED_DECISIONS_MAR_1_2026.md](../LOCKED_DECISIONS_MAR_1_2026.md) | Locked decisions |
| [../COPILOT_INSTRUCTIONS.md](../COPILOT_INSTRUCTIONS.md) | Dev guidelines |

## Links

- [Web](../web/README.md)
- [API](../api/README.md)
- [Core](../core/README.md)
- [Infra](../infra/README.md)
