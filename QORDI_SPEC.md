# Qordi Product Specification

## The Big Picture

Qordi is a voice-first, AI-powered "brain companion" that transforms scattered ideas into actionable momentum.

**Tagline:** "Think Sharper. Live Awake."

**Brand:** Evolving Goldendoodle mascot (starts as fluffy pup, matures as user progresses)

---

## Core Problem

Your brain's "idea firehose" (voice notes, chats, research scraps) scatters energy and focus.

**What Qordi solves:**
- Captures ideas from anywhere
- Organizes chaos into clarity
- Provides proactive guidance ("focus on X next")
- Celebrates progress through pup evolution
- Never loses an insight

---

## Target Users

**Primary:** Solopreneurs, creators, lifelong learners
- Podcasters scripting books
- Musicians tracking progress
- Polymaths learning multiple skills (Hebrew, guitar, coding)
- Entrepreneurs with constant idea flow

**Secondary:** Teams needing a shared "brain"
- Product teams
- Creative studios
- Research groups

**Early Adopters:** Your network
- Law friend (IP advisor)
- X/social followers
- Community members

---

## Monetization

**Model:** Freemium subscription

- **Free Tier:** Basic ingest + limited monthly nudges
- **Pro Tier ($9/mo):** Unlimited ingest, daily guidance, asset generation, analytics

**Expected timeline to first revenue:** Week 3

---

## Core Features (Prioritized for MVP)

### Feature 1: Ingest Anything

**What it does:**
- Voice notes via Whisper transcription
- Text input
- PDF uploads
- Chat exports (coming in v1)

**MVP Scope (Week 1-2):**
- Voice notes + basic text
- Auto-tag by project/goal
- Basic folder organization

**Full v1 Scope (Month 1-2):**
- Browser extension for capturing chat transcripts
- Auto-categorization via embeddings
- Smart duplicate detection

**Qordi Pup Delight:**
- Pup "fetches" the note, drops it with a tail wag animation
- Note glows briefly as it lands in the brain

---

### Feature 2: Ask My Brain (RAG)

**What it does:**
- Query your ingested data with natural language
- "What did I say about guitar chords?"
- "Link my Hebrew learning to my book project"
- Semantic search + exact matching

**MVP Scope (Week 1-2):**
- Simple vector search on transcripts
- Basic relevance ranking

**Full v1 Scope (Month 1-2):**
- Full RAG with context awareness
- Cross-linking between ideas
- Citation of sources

**Qordi Pup Delight:**
- Pup tilts head, "digs" with paw
- Glowing threads reveal connections
- Bounces excitedly when finding something useful

---

### Feature 3: Predictive Guidance

**What it does:**
- Daily feed of AI-generated nudges
- "You're 60% through guitar—next: minor 7s. Play now?"
- "Your book outline has 8 chapters, you've drafted 2. Next: Chapter 3 intro."
- Gentle, truth-aligned reminders (no corporate fluff)

**MVP Scope (Week 1-2):**
- Rule-based nudges from progress tracking
- Simple priority ranking

**Full v1 Scope (Month 1-2):**
- ML-evolved guidance (learns your patterns)
- Ethical filters (truth-checks, no hallucinations)
- User-defined "constitution" (filter via Proverbs, etc.)

**Qordi Pup Delight:**
- Pup drops a "golden ball" at your feet—tap to chase the task
- Eyes glow softly during insights (feels like wise friend)
- Tail wags when you complete a nudge-suggested task

---

### Feature 4: Goal Tracking

**What it does:**
- Visual dashboard of milestones
- Pup evolves as you hit goals
- Progress bars, burndown charts
- Auto-generate goals from ingested ideas

**MVP Scope (Week 1-2):**
- Basic progress bars
- Manual goal creation

**Full v1 Scope (Month 1-2):**
- Dynamic graphs
- Auto-goal generation from ingests
- Milestone celebrations

**Qordi Pup Delight:**
- Pup evolution stages: Puppy curls → Teen floof → Sage mane (with confetti on milestones)
- Visual maturity mirrors user's progress

---

### Feature 5: Asset Generation

**What it does:**
- Generate structured outputs from your ideas
- "Qordi, outline my book" → PDF/Markdown
- "Generate a weekly email summary"
- Code snippets, writing prompts, etc.

**MVP Scope (Week 1-2):**
- Prompt-based outlines
- Markdown export

**Full v1 Scope (Month 1-2):**
- Full asset generation (images via Flux, code snippets)
- Multiple export formats
- Customizable templates

**Qordi Pup Delight:**
- Pup trots back with a "rolled scroll" in mouth
- Asset appears in your inbox
- Confetti on successful generation

---

### Feature 6: Awaken Layer (Ethics)

**What it does:**
- All outputs grounded in truth-seeking
- Optional Scripture filters (if you tag ideas with "faith")
- No hallucinations, no corporate speak
- Transparent reasoning

**MVP Scope (Week 1-2):**
- Basic prompt guards
- Fact-checking layer

**Full v1 Scope (Month 1-2):**
- User-defined "constitution" (your rules)
- Customizable ethical filters
- Audit trail of decisions

**Qordi Pup Delight:**
- Pup's eyes glow softly during insights—feels like talking to a wise friend
- Badge: "✓ Truth-checked" on verified guidance

---

## Tech Stack (Locked)

### Frontend
- **Framework:** Next.js 14+ (App Router)
- **Styling:** Tailwind CSS
- **Language:** TypeScript
- **Deployment:** Hotinger (initially), Vercel (if scaling)

### Backend
- **Serverless:** Vercel Functions (or VPS endpoints on Hotinger)
- **Database:** Supabase (PostgreSQL + pgvector)
- **Auth:** Supabase Auth (GitHub/Email)
- **Storage:** Supabase Storage (voice files, PDFs)

### AI & ML
- **Transcription:** OpenAI Whisper API
- **Embeddings:** OpenAI text-embedding-3-small
- **LLM:** OpenAI GPT-4 or gpt-4o
- **Image Generation (v1):** Flux or Midjourney

### Infrastructure
- **VPS:** Hotinger (one-click OpenClaw deploy)
- **Monitoring:** Simple logs + Sentry for errors
- **Payments:** Stripe (Qordi Pro)

---

## User Flow

### Signup & Onboarding (Day 1)
1. Land on qordi.werii.com
2. Sign up (GitHub or email)
3. 2-minute onboarding ("What do you want to learn/build?")
4. Connect first channel (Telegram, Discord, or voice)
5. Record first idea
6. See pup fetch and organize it ✨

### Daily Usage (Week 1+)
1. User captures ideas throughout day (voice/text)
2. Qordi ingests, tags, organizes
3. Evening: User opens dashboard
4. Sees daily nudge ("You're 60% through guitar—minor 7s next")
5. Views pup (now slightly more mature)
6. Taps nudge → task marked complete
7. Pup does celebratory animation
8. Next day: Repeat

### Weekly Review (Friday)
1. User sees week's progress
2. Pup visibly more mature
3. Assets generated (book outline progress, etc.)
4. Email summary sent
5. Decides next week's focus

---

## Roadmap

### Week 1 (Prototype)
- Landing page (qordi.werii.com with waitlist)
- Basic app on app.werii.com (voice ingest test)
- Validate with 10 users
- Goal: Prove the core loop works (voice → transcript → insight)

### Week 2-3 (MVP)
- Core loop working (voice → insight)
- Basic RAG query
- Goal tracking + progress bars
- Pup evolution (3 stages minimum)
- Stripe integration (payment handling)
- Beta with 50+ users

### Week 4-8 (v1)
- Multi-source ingest (PDFs, chats)
- Predictive guidance (ML-based)
- Asset generation (outlines, emails)
- Ethical filters (user-defined constitution)
- Pup animations (full evolution, celebrations)
- Public launch
- Goal: 100 users by end of Month 2

### Month 3+ (Scale & Iterate)
- Based on metrics, double down on features users love
- Kill features users ignore
- Expand to teams (collaborative mode)
- Build mobile app (if demand)
- Consider OpenClaw integration for power users

---

## Differentiation

**vs. Notion:** Not corporate, not sterile, has personality (pup)
**vs. Roam:** Voice-first, proactive guidance, ethical AI
**vs. Apple Notes:** Smarter (AI), more motivating (pup), guidance-focused
**vs. ChatGPT:** Persistent memory, proactive nudges, personalized to YOUR goals

**Qordi's Edge:** Truth-seeking companion that grows with you

---

## Launch Strategy

### Pre-MVP (Week 1)
- Launch waitlist on qordi.werii.com
- Share on X/LinkedIn ("Building Qordi: Voice-to-insight AI companion. Who's tired of idea scatter?")
- DM 5 friends (law buddy, X followers, community)
- Goal: 50 waitlist signups

### MVP Launch (Week 3)
- Invite waitlist to beta (500 limit)
- Get feedback: "Voice or text first? What feature matters most?"
- Track: DAU, retention, churn
- Share wins on X/Reddit (r/SideProject, r/Entrepreneur)
- Goal: 50-100 active beta users

### v1 Launch (Week 8)
- Public launch (remove beta tag)
- Announce on ProductHunt
- Email list outreach
- Content marketing (blog posts on "why voice matters", "AI ethics", etc.)
- Goal: 100+ paid users within month

### Metrics to Track
- **Engagement:** DAU, session length, feature usage
- **Retention:** Day-7, Day-30 churn
- **Monetization:** Conversion rate (free → pro), MRR, CAC, LTV
- **Content:** Blog engagement, email open rates, social shares

---

## IP Protection

- **Provisional Patent:** Voice-ingest RAG + ethical pup evolution ($75, filed Week 1)
- **Trademark:** Qordi name + Goldendoodle logo (searched, clear)
- **Copyright:** All Midjourney/Flux pup assets
- **NDAs:** For early beta feedback (HelloSign template)

---

## Success Criteria

**MVP Success (Week 3):**
- 50+ active users
- 30%+ Day-7 retention
- Core loop working (no bugs)
- Users suggesting features (sign of engagement)

**v1 Success (Week 8):**
- 100+ paid Pro users
- $900/mo MRR (100 users × $9/mo)
- 50%+ Day-30 retention
- Positive NPS (willing to recommend)

**Product-Market Fit (Month 3+):**
- Sustainable growth (viral coefficient > 1 or strong CAC/LTV ratio)
- Feature requests outpacing bugs
- Users calling it indispensable
- Ready to scale to teams