# WeriiHQ System Architecture

## Current Implementation Snapshot (Mar 1, 2026)

- `dwilzon/werii` is active and serving as planning/source-of-truth.
- `dwilzon/web` is bootstrapped (Next.js + TypeScript + Tailwind).
- `dwilzon/web` has:
   - minimal Qordi landing page
   - `.copilot/instructions.md`
   - passing lint baseline
- Locked decisions are captured in `LOCKED_DECISIONS_MAR_1_2026.md`.

This document is the architecture + execution reference for moving from current baseline to MVP.

## Overview

WeriiHQ is a personal AI operating system + products ecosystem built around three interconnected layers:

1. **OpenClaw** (Personal Brain OS)
2. **Qordi** (The Product You Sell)
3. **WeriiHQ Hub** (Business Operating System)

---

## Layer 1: OpenClaw (Your Personal Brain OS)

### What It Is
- Self-hosted AI personal assistant gateway
- Runs on your Hotinger VPS (one-click deploy)
- Multi-channel inbox (WhatsApp, Telegram, Discord, Slack, voice)
- NOT exposed to end users (internal tool only)

### Core Capabilities
- **Multi-channel inbox**: One gateway handles multiple messaging platforms
- **Persistent memory**: Retains context across sessions in local database
- **Custom skills**: Modular add-ons for specific tasks
- **Proactive notifications**: Can send reminders, summaries, alerts
- **Media support**: Images, audio, documents through connected apps
- **Web Control UI**: Browser dashboard for management

### Your Custom Skills (What You'll Build)

1. **Idea Capture & Organization**
   - Ingests voice/text/chat
   - Auto-categorizes by projects/goals
   - Assigns priority
   - Extracts actionable tasks

2. **Guidance Generation**
   - "This is worth 2 weeks of dev time"
   - "This could be a $X app"
   - "Merge this with that idea"
   - "Skip this distraction"

3. **Trend Analysis**
   - Scans ideas for patterns
   - Identifies emerging themes
   - Suggests content angles

4. **Content Generation**
   - Auto-writes blog posts
   - Generates email campaigns
   - Creates social media content

5. **Chat Session Archive**
   - Captures all your AI conversations
   - Extracts insights
   - Prevents idea loss
   - Builds institutional memory

6. **Metrics & ROI Tracking**
   - Records what you built
   - Tracks revenue/traction
   - Analyzes what worked

7. **Book Writing Assistant**
   - Organizes ideas by chapter
   - Suggests structure
   - Drafts sections
   - Tracks progress

### Data Flow
```
You (Voice/Text/Chat) 
  ↓
OpenClaw Gateway (VPS)
  ↓
Custom Skills (Process)
  ↓
Insights/Guidance/Actions
  ↓
WeriiHQ Analytics (Feed back to business decisions)
```

---

## Layer 2: Qordi (The Product You Sell)

### What It Is
- Voice-to-insight companion for users
- Hosted on Hotinger (same VPS as OpenClaw backend)
- Frontend: Next.js + Tailwind
- Database: Supabase (auth, vectors, storage)
- AI: OpenAI (Whisper, embeddings, GPT)

### User Experience
1. User signs up for Qordi ($9/mo freemium)
2. User captures ideas (voice/text/PDF)
3. AI organizes into a "second brain"
4. AI provides daily guidance/nudges
5. Goldendoodle mascot grows as user hits milestones
6. User tracks progress visually

### Core Features (MVP → v1)

**MVP (Week 1-2)**
- Landing page with waitlist (qordi.werii.com)
- Voice ingest via Whisper
- Basic vector storage (Supabase)
- Simple RAG query ("Ask my brain")

**v1 (Week 3-8)**
- Multi-source ingest (PDF, chat exports, etc.)
- Predictive guidance (daily nudges)
- Goal tracking + pup evolution visuals
- Asset generation (book outlines, etc.)
- Ethical filters ("awaken layer")
- Stripe integration for payments
- Launch to 100 users

### Data Flow
```
User Idea (Voice/Text)
  ↓
Qordi Frontend (Next.js)
  ↓
Whisper Transcription (OpenAI)
  ↓
Vector Embeddings
  ↓
Supabase Storage
  ↓
RAG Query Engine
  ↓
Guidance Generation
  ↓
Daily Nudges + Progress Tracking
```

---

## Layer 3: WeriiHQ Hub (Business Operating System)

### What It Is
- Command center for all revenue streams
- Analytics dashboard (what made money, what didn't)
- Product idea generator
- Content/email marketing engine
- Merch store integration

### Revenue Streams

1. **Qordi SaaS** ($9/mo freemium)
   - Primary revenue
   - Launch: Week 3
   - Target: 100 users by Week 8

2. **Email List** (Building audience)
   - Content marketing via email
   - Audience capture
   - Sponsor relationships
   - Launch: Week 2

3. **Merch Store** (Print-on-demand)
   - Trend-tied t-shirts, hats, etc.
   - Printful integration
   - Direct sales
   - Launch: Week 5

4. **Custom SaaS Apps** (Build based on ideas)
   - Parse your idea firehose
   - OpenClaw suggests "this could be a $X app"
   - Build, launch, measure ROI
   - Iterate based on traction

### Analytics & Feedback Loop

```
All Revenue Streams
  ↓
WeriiHQ Dashboard
  ↓
Metrics: Revenue, Users, Retention, Churn, Trends
  ↓
Analysis: What worked? What didn't?
  ↓
Decisions: Scale this, kill that, try something new
  ↓
Iterate & Improve
```

---

## How They Connect

### The Full Loop

```
1. You capture ideas in OpenClaw (personal brain)
   ↓
2. OpenClaw analyzes trends, provides guidance
   ↓
3. You decide: "Build this as Qordi feature" or "This could be a new app"
   ↓
4. WeriiHQ Hub suggests: "This matches trend X, could have audience Y"
   ↓
5. You build and ship (to Qordi, merch store, or new SaaS app)
   ↓
6. Users adopt (or don't)
   ↓
7. WeriiHQ Dashboard measures: Revenue, Traction, User Behavior
   ↓
8. Metrics feed back into OpenClaw for next iteration
   ↓
Loop repeats
```

### Option A: OpenClaw Personal, Qordi Product (CHOSEN)

- **Clean separation**: Your tool vs. customer product
- **Faster to market**: Don't need to package OpenClaw for users
- **Easier operations**: Hostinger-first path with minimal moving parts
- **Scalable**: Can add OpenClaw features to Qordi later if needed

---

## Technology Decisions

### Why This Stack?

**Frontend: Next.js + Tailwind**
- Fast, responsive, modern
- Easy to deploy on Hotinger
- Great TypeScript support
- Familiar to AI tools (Copilot, ChatGPT, etc.)

**Backend: Supabase**
- Built-in auth (no custom logic)
- Vector storage (for RAG)
- Real-time updates (Postgres)
- Free tier generous enough for MVP

**AI: OpenAI API**
- Whisper: Best speech-to-text
- Embeddings: Best for semantic search (RAG)
- GPT: Solid reasoning for guidance generation

**VPS: Hotinger**
- One-click OpenClaw deploy
- Affordable ($7-10/mo)
- Full control over environment
- AlexFinn YouTube tutorials available

**Hosting: Hostinger-first execution**
- Keep initial deployment simple and centralized.
- Defer platform changes until user traction requires it.
- Prioritize speed-to-feedback over infra sophistication.

---

## Security & Data

### Data Privacy
- OpenClaw: Runs on YOUR VPS (you control the data)
- Qordi: Users' data in Supabase (encrypted, GDPR-compliant)
- No third-party data sharing
- Ethical AI: Truth-first, no hallucinations

### IP Protection
- Provisional patent ($75, USPTO)
- NDA templates for early feedback
- Copyright custom Midjourney/Flux assets
- Brand lock-in via Goldendoodle mascot

---

## Roadmap

### Week 1-2: MVP
- OpenClaw setup on VPS (personal engine)
- Qordi landing page live (waitlist capture)
- Voice ingest test path working end-to-end
- 10 beta users validating direction

### Week 3-4: v1 Features
- Predictive guidance
- Goal tracking + pup visuals
- Multi-source ingest
- Ethical filters
- Beta with 50+ users

### Week 5-8: Launch & Scale
- Stripe integration
- Merch store live
- Content generation running
- Email marketing active
- Launch publicly → 100 users target
- Measure what works

### Week 8+: Iterate & Expand
- Based on metrics, double down on winners
- Kill experiments that don't convert
- Build next revenue stream
- Scale Qordi or launch new app

---

## Execution Blueprint (Next 14 Days)

### Track A: Product Surface (`web`)

1. Replace waitlist form stub with real submit handler.
2. Add one simple "voice ingest" UI flow (record/upload -> success state).
3. Add one "ask my brain" placeholder flow with mocked response.
4. Add analytics events for landing CTA + submit success.

### Track B: Data + Backend Path (API/Supabase)

1. Define minimal schema for:
   - users
   - ideas
   - insights
   - guidance_items
2. Implement one ingest endpoint contract.
3. Implement one query endpoint contract.
4. Wire endpoints to frontend with explicit error states.

### Track C: OpenClaw Personal Loop

1. Bring up OpenClaw on Hostinger VPS.
2. Enable one inbound channel first (single-channel start).
3. Add one custom skill: idea capture normalization.
4. Export structured outputs usable by the Qordi stack.

### Track D: Validation

1. Recruit first 10 users.
2. Run one structured feedback loop:
   - capture pain point
   - capture desired output
   - capture whether user would return
3. Decide keep/kill for each feature based on usage evidence.

---

## Definition of Done (MVP Gate)

MVP is considered complete when all are true:

1. A user can land, join waitlist, and get confirmation.
2. A user can submit one voice/text idea and receive one generated insight.
3. Daily guidance feed returns at least one actionable item.
4. Foundational metrics are visible (signup, submit, return activity).
5. At least 10 real users have tested and feedback is documented.

---

## Success Metrics

**Short-term (Week 1-8)**
- DAU (Daily Active Users)
- Signups
- Waitlist conversion rate
- Early user retention

**Medium-term (Month 3-6)**
- Churn rate
- Revenue per user
- Content engagement (blog, email)
- Merch sales

**Long-term (6+ months)**
- NPS (Net Promoter Score)
- Lifetime Value (LTV)
- Cost of Acquisition (CAC)
- Profitability

---

## Questions & Next Steps

- ✅ Architecture locked
- ✅ Tech stack locked
- ✅ Roadmap locked
- 🔲 OpenClaw VPS setup (in progress)
- 🔲 Qordi MVP build (active)
- 🔲 First users onboarded (target: Week 2)