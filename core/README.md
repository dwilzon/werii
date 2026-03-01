# werii/core

> Shared business logic — skills, models, and reusable utilities.

**Path:** `dwilzon/werii/core/` _(future: `weriicore/werii/core/`)_

---

## What This Does

Houses the shared TypeScript business logic used by both `web` and `api`: idea parsing skills, guidance generation, trend analysis, data models, and utilities. Designed to be imported as a local package by sibling workspaces.

## Planned Folder Structure

```
core/
├── skills/
│   ├── idea-capture.ts            ← Parse idea → tags / goals / projects
│   ├── guidance-gen.ts            ← Generate nudge based on progress
│   ├── trend-analysis.ts          ← Find patterns across ideas
│   ├── metrics.ts                 ← Track ROI, revenue
│   ├── content-gen.ts             ← Generate blogs, emails
│   └── __tests__/                 ← Unit tests (Jest)
│
├── models/
│   ├── types.ts                   ← Shared TypeScript interfaces
│   ├── schema.ts                  ← Database schema definitions
│   └── constants.ts               ← App-wide constants
│
├── utils/
│   ├── formatting.ts              ← Text, date, number formatting
│   ├── math.ts                    ← Calculations
│   └── validators.ts              ← Input validation
│
├── package.json
├── tsconfig.json
└── README.md
```

## Key Interfaces

```typescript
interface Idea {
  id: string;
  content: string;
  tags: string[];
  projectId?: string;
  createdAt: Date;
}

interface GuidanceItem {
  id: string;
  message: string;
  goalId: string;
  generatedAt: Date;
}
```

## Quick Start

```bash
cd core
npm install
npm test              # run unit tests
npm run build         # compile TypeScript
```

## Links

- [API](../api/README.md)
- [Web](../web/README.md)
- [Copilot Guidelines](../COPILOT_INSTRUCTIONS.md)
