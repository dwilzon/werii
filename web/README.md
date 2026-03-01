# werii/web

> Next.js frontend for Qordi — voice-to-insight companion.

**Path:** `dwilzon/werii/web/` _(future: `weriicore/werii/web/`)_

---

## What This Does

Provides the user-facing interface for Qordi: landing page, waitlist form, voice ingest UI, dashboard, goal tracking, and the evolving Goldendoodle mascot.

## Tech Stack

- **Framework:** Next.js 14+ (App Router)
- **Language:** TypeScript
- **Styling:** Tailwind CSS
- **Database:** Supabase (auth + vectors + storage)
- **AI:** OpenAI (Whisper, embeddings, GPT)

## Planned Folder Structure

```
web/
├── app/
│   ├── page.tsx                   ← Landing page (qordi.werii.com)
│   ├── dashboard/
│   │   ├── page.tsx               ← Main dashboard
│   │   ├── goals/                 ← Goal tracking UI
│   │   └── brain/                 ← "Ask my brain" interface
│   └── layout.tsx
│
├── components/
│   ├── VoiceRecorder.tsx          ← Voice recording widget
│   ├── PupAnimation.tsx           ← Qordi Goldendoodle mascot
│   ├── ProgressBar.tsx            ← Goal progress
│   └── NudgeCard.tsx              ← Daily guidance card
│
├── lib/
│   ├── supabase.ts                ← Supabase client
│   ├── api.ts                     ← API helpers
│   └── hooks/                     ← useAuth, useIdeas, useGuidance
│
├── public/
│   └── pup/                       ← Goldendoodle images (puppy, teen, sage)
│
├── .env.example
├── package.json
└── README.md
```

## Quick Start

```bash
cd web
npm install
cp .env.example .env        # fill in SUPABASE_URL, OPENAI_API_KEY, etc.
npm run dev                 # http://localhost:3000
```

## Links

- [System Architecture](../SYSTEM_ARCHITECTURE.md)
- [Qordi Spec](../QORDI_SPEC.md)
- [Roadmap](../ROADMAP.md)
- [API](../api/README.md)
