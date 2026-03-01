# WeriiHQ Repository Structure

## GitHub Organization

```
weriicore (GitHub User)
└── weriihq (Organization)
    ├── web (repo)
    ├── api (repo)
    ├── core (repo)
    ├── infra (repo)
    └── docs (repo)
```

Each repo is independent but interconnected.

---

## Detailed Structure

### weriihq/web

**Purpose:** Next.js frontend for Qordi (landing + app)

```
weriihq/web/
├── app/                           ← Next.js 14+ App Router
│   ├── page.tsx                   ← Landing page (qordi.werii.com)
│   ├── dashboard/                 ← User dashboard
│   │   ├── page.tsx               ← Main dashboard
│   │   ├── goals/                 ← Goal tracking UI
│   │   └── brain/                 ← "Ask my brain" interface
│   ├── api/                       ← Next.js API routes (call weriihq/api)
│   │   ├── ingest/route.ts        ← Handle voice uploads
│   │   ├── query/route.ts         ← RAG queries
│   │   └── guidance/route.ts      ← Daily nudges
│   └── layout.tsx                 ← Root layout
│
├── components/                    ← Reusable UI
│   ├── VoiceRecorder.tsx          ← Voice recording widget
│   ├── PupAnimation.tsx           ← Qordi pup component
│   ├── ProgressBar.tsx            ← Goal progress
│   ├── NudgeCard.tsx              ← Daily guidance card
│   └── shared/                    ← Buttons, forms, etc.
│
├── lib/                           ← Utilities
│   ├── supabase.ts                ← Supabase client
│   ├── api.ts                     ← API helpers
│   ├── hooks/                     ← React hooks
│   │   ├── useAuth.ts
│   │   ├── useIdeas.ts
│   │   └── useGuidance.ts
│   └── utils.ts                   ← General utilities
│
├── public/                        ← Static assets
│   ├── pup/                       ← Goldendoodle images
│   │   ├── puppy.png
│   │   ├── teen.png
│   │   └── sage.png
│   ├── icons/                     ← Icons
│   └── fonts/                     ← Custom fonts (if any)
│
├── styles/                        ← Global styles
│   └── globals.css                ← Tailwind + custom CSS
│
├── .copilot/
│   └── instructions.md            ← "Build like Qordi: warm, playful, voice-first"
│
├── package.json
├── tsconfig.json
├── tailwind.config.js
├── next.config.js
├── .env.example                   ← Template for env vars
└── README.md                      ← Setup guide
```

**Key Files:**
- `app/page.tsx` - Landing page (waitlist form)
- `app/dashboard/page.tsx` - Main user interface
- `components/VoiceRecorder.tsx` - Voice capture UI
- `components/PupAnimation.tsx` - Mascot animations
- `lib/supabase.ts` - Database client
- `.copilot/instructions.md` - Development guidelines

---

### weriihq/api

**Purpose:** Backend functions (serverless or VPS endpoints)

```
weriihq/api/
├── functions/                     ← API endpoints
│   ├── transcribe.ts              ← Voice → text (Whisper)
│   ├── embed.ts                   ← Text → vector (OpenAI embeddings)
│   ├── query-insights.ts          ← RAG query
│   ├── generate-guidance.ts       ← Daily nudge generation
│   ├── generate-assets.ts         ← Outline/email generation
│   ├── auth.ts                    ← Supabase auth helpers
│   └── webhook.ts                 ← Incoming webhooks (Stripe, etc.)
│
├── lib/                           ← Utilities
│   ├── openai.ts                  ← OpenAI API wrapper
│   ├── supabase.ts                ← Supabase client
│   ├── openclaw.ts                ← OpenClaw skill communication
│   ├── embeddings.ts              ← Vector store operations
│   └── validators.ts              ← Input validation
│
├── types/                         ← TypeScript interfaces
│   ├── idea.ts
│   ├── guidance.ts
│   └── user.ts
│
├── .env.example                   ← Template (OPENAI_KEY, SUPABASE_KEY, etc.)
├── .copilot/
│   └── instructions.md            ← "Serverless best practices, handle errors, security-first"
├── package.json
├── tsconfig.json
└── README.md                      ← API documentation
```

**Key Files:**
- `functions/transcribe.ts` - Whisper integration
- `functions/embed.ts` - OpenAI embeddings
- `functions/query-insights.ts` - RAG engine
- `lib/supabase.ts` - Database queries
- `lib/openai.ts` - LLM wrapper
- `types/` - Shared TypeScript definitions

---

### weriihq/core

**Purpose:** Shared business logic (skills, models, reusable code)

```
weriihq/core/
├── skills/                        ← Qordi's logic (not OpenClaw specific)
│   ├── idea-capture.ts            ← Parse idea → tags/goals/projects
│   ├── guidance-gen.ts            ← Generate nudge based on progress
│   ├── trend-analysis.ts          ← Find patterns in ideas
│   ├── metrics.ts                 ← Track ROI, revenue
│   ├── content-gen.ts             ← Generate blogs, emails
│   └── __tests__/                 ← Unit tests
│
├── models/                        ← Data models
│   ├── types.ts                   ← Shared TypeScript interfaces
│   ├── schema.ts                  ← Database schema definitions
│   └── constants.ts               ← App constants
│
├── utils/                         ← General utilities
│   ├── formatting.ts              ← Text, date, number formatting
│   ├── math.ts                    ← Calculations
│   └── validators.ts              ← Input validation
│
├── .copilot/
│   └── instructions.md            ← "Core logic, reusable, well-tested"
├── package.json
├── tsconfig.json
└── README.md
```

**Key Files:**
- `skills/idea-capture.ts` - Idea parsing logic
- `skills/guidance-gen.ts` - Nudge generation
- `skills/trend-analysis.ts` - Pattern detection
- `models/types.ts` - Shared interfaces
- `models/schema.ts` - Database schema

---

### weriihq/infra

**Purpose:** Infrastructure as code (VPS setup, Docker, OpenClaw skills)

```
weriihq/infra/
├── docker-compose.yml             ← OpenClaw deployment
├── openclaw/
│   ├── skills/                    ← Your custom OpenClaw skills
│   │   ├── idea-capture.js        ← Capture ideas from WhatsApp, Telegram, etc.
│   │   ├── guidance-gen.js        ← Generate your personal nudges
│   │   ├── trend-analysis.js      ← Analyze your idea trends
│   │   ├── content-gen.js         ← Write your blog posts
│   │   ├── chat-archive.js        ← Archive all AI conversations
│   │   ├── metrics-tracking.js    ← Track your metrics
│   │   └── SKILL.md               ← Skill template/docs
│   │
│   ├── config/
│   │   └── .env                   ← OpenClaw env vars (OpenAI key, model, etc.)
│   │
│   └── README.md                  ← Setup guide for AlexFinn's YouTube
│
├── monitoring/                    ← Logs, health checks
│   ├── docker-logs.sh
│   └── health-check.sh
│
├── scripts/
│   ├── deploy.sh                  ← One-click deploy (Hotinger)
│   ├── backup.sh                  ← Backup OpenClaw data
│   └── update.sh                  ← Update OpenClaw version
│
├── .env.example                   ← Template (VPS creds, API keys, etc.)
├── .copilot/
│   └── instructions.md            ← "Infrastructure as code, security-first, documented"
└── README.md                      ← VPS setup guide
```

**Key Files:**
- `docker-compose.yml` - OpenClaw container
- `openclaw/skills/` - Your custom skills
- `scripts/deploy.sh` - Deployment automation
- `README.md` - VPS setup (step-by-step)

---

### weriihq/docs

**Purpose:** Documentation, decisions, specifications

```
weriihq/docs/
├── README.md                      ← Start here (overview)
├── QUICK_START.md                 ← "Get running in 5 mins"
│
├── architecture.md                ← System design (OpenClaw, Qordi, WeriiHQ)
├── api.md                         ← API endpoints (what weriihq/api exposes)
├── database.md                    ← Schema, migrations, queries
├── qordi-spec.md                  ← Product spec (features, roadmap, target users)
├── openclaw-skills.md             ← What each skill does (detailed)
├── revenue-streams.md             ← Business model breakdown
│
├── roadmap.md                     ← Week-by-week plan
├── setup-guide.md                 ← How to set up locally
├── deployment.md                  ← How to deploy to Hotinger
│
├── decisions/                     ← Why we chose what
│   ├── why-nextjs.md              ← Frontend framework choice
│   ├── why-supabase.md            ← Backend database choice
│   ├── why-hotinger.md            ← VPS hosting choice
│   ├── why-option-a.md            ← OpenClaw personal vs. Qordi product
│   ├── why-voice-first.md         ← Voice priority (not text)
│   └── why-freemium.md            ← Monetization model choice
│
├── images/
│   ├── architecture-diagram.png   ← System overview
│   ├── data-flow.png              ← How data moves
│   ├── user-flow.png              ← User journey
│   └── wireframes/                ← UI mockups
│       ├── landing.png
│       ├── dashboard.png
│       └── onboarding.png
│
└── GLOSSARY.md                    ← Terms (Qordi, OpenClaw, WeriiHQ, etc.)
```

**Key Files:**
- `README.md` - Start here
- `architecture.md` - Full system design
- `qordi-spec.md` - Product definition
- `roadmap.md` - Timeline
- `decisions/` - Rationale for every choice
- `images/` - Diagrams and mockups

---

## Shared Files Across Repos

### .copilot/instructions.md

Each repo has its own `.copilot/instructions.md` specific to that repo's purpose.

**Example:** `weriihq/web/.copilot/instructions.md`
```markdown
# Qordi Web Frontend Instructions

Build like Qordi: warm, playful, voice-first.

- Use Tailwind for styling (no custom CSS unless necessary)
- Animations should delight (not distract)
- Voice recording should feel natural and easy
- Pup should react to user actions (positive feedback)
- Follow the color palette: Indigo/Gold
```

**Example:** `weriihq/api/.copilot/instructions.md`
```markdown
# Qordi API Instructions

- TypeScript everywhere (type safety > speed)
- Error handling: Never silently fail
- Security: Never log API keys
- Validate all user input
- Document all endpoints
```

---

## .gitignore (for all repos)

```
node_modules/
dist/
build/
.next/
.env
.env.local
.env*.local
*.log
.DS_Store
.idea/
.vscode/
*.swp
coverage/
.nyc_output/
```

---

## README.md Template (for each repo)

```markdown
# weriihq/web (or api, core, infra)

## What This Repo Does

[1-2 sentence description]

## Quick Start

1. Clone: `git clone https://github.com/weriihq/web.git`
2. Install: `npm install`
3. Setup: `cp .env.example .env` (fill in your secrets)
4. Run: `npm run dev`
5. Visit: `http://localhost:3000`

## Folder Structure

[Brief overview of key folders]

## Architecture

[How this fits into the larger system]

## Development

[How to contribute, run tests, deploy]

## Links

- [System Architecture](../docs/architecture.md)
- [API Documentation](../docs/api.md)
- [Roadmap](../docs/roadmap.md)
```

---

## Initialization Commands

### Create Local Setup

```bash
# Create workspace folder
mkdir -p ~/local/code/weriicore/weriihq-workspace
cd ~/local/code/weriicore/weriihq-workspace

# Clone all repos
git clone https://github.com/weriihq/web.git
git clone https://github.com/weriihq/api.git
git clone https://github.com/weriihq/core.git
git clone https://github.com/weriihq/infra.git
git clone https://github.com/weriihq/docs.git

# Install dependencies (each repo)
cd web && npm install && cd ..
cd api && npm install && cd ..
cd core && npm install && cd ..
```

---

## Key Principles

1. **Each repo is independent but interconnected**
   - Can clone and work on just `web` without `api`
   - But they integrate at runtime

2. **Clear separation of concerns**
   - `web`: User interface only
   - `api`: Backend logic only
   - `core`: Shared business logic
   - `infra`: Your personal OpenClaw instance
   - `docs`: Everything written down

3. **Copilot instructions in every repo**
   - Ensures consistent code style
   - Guides AI when generating code

4. **Environment variables isolated**
   - Each repo has `.env.example`
   - Never commit `.env` file