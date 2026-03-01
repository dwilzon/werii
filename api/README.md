# werii/api

> Backend API functions — transcription, embeddings, RAG queries, guidance generation.

**Path:** `dwilzon/werii/api/` _(future: `weriicore/werii/api/`)_

---

## What This Does

Serverless-style API endpoints that power Qordi's backend: voice transcription via Whisper, vector embeddings, RAG-based insight queries, daily guidance generation, and Stripe billing.

## Tech Stack

- **Language:** TypeScript
- **AI:** OpenAI (Whisper, embeddings, GPT)
- **Database:** Supabase (auth + vectors + Postgres)
- **Payments:** Stripe
- **Hosting:** Hostinger VPS

## Planned Folder Structure

```
api/
├── functions/
│   ├── transcribe.ts              ← Voice → text (Whisper)
│   ├── embed.ts                   ← Text → vector (OpenAI embeddings)
│   ├── query-insights.ts          ← RAG query over stored ideas
│   ├── generate-guidance.ts       ← Daily nudge generation
│   ├── generate-assets.ts         ← Outline/email generation
│   ├── auth.ts                    ← Supabase auth helpers
│   └── webhook.ts                 ← Stripe + other webhooks
│
├── lib/
│   ├── openai.ts                  ← OpenAI API wrapper
│   ├── supabase.ts                ← Supabase client
│   ├── embeddings.ts              ← Vector store operations
│   └── validators.ts              ← Input validation
│
├── types/
│   ├── idea.ts
│   ├── guidance.ts
│   └── user.ts
│
├── .env.example
├── package.json
└── README.md
```

## Endpoint Summary

| Method | Endpoint | Description |
|--------|----------|-------------|
| `POST` | `/api/v1/transcribe` | Upload audio → returns transcript |
| `POST` | `/api/v1/ideas` | Store a new idea (text or transcript) |
| `GET`  | `/api/v1/ideas` | List user's ideas |
| `POST` | `/api/v1/query` | RAG query — "ask my brain" |
| `GET`  | `/api/v1/guidance` | Fetch today's nudges |
| `POST` | `/api/v1/checkout` | Stripe payment session |

## Quick Start

```bash
cd api
npm install
cp .env.example .env        # fill in OPENAI_API_KEY, SUPABASE_URL, STRIPE_KEY
npm run dev
```

## Links

- [System Architecture](../SYSTEM_ARCHITECTURE.md)
- [Web](../web/README.md)
- [Core](../core/README.md)
