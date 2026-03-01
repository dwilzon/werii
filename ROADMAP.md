# WeriiHQ & Qordi Roadmap

## Overview

- **Total Timeline:** 8 weeks to public launch
- **MVP Launch:** Week 3 (to 50+ beta users)
- **v1 Launch:** Week 8 (to public audience)
- **Success Metric:** 100+ paid Pro users by end of Month 2

---

## Current Status (Mar 1, 2026)

- `web` baseline is live in repo (Next.js + TypeScript + Tailwind).
- Minimal Qordi landing is implemented.
- Planning baseline is locked:
  - `LOCKED_DECISIONS_MAR_1_2026.md`
  - `SYSTEM_ARCHITECTURE.md`
  - `REPO_STRUCTURE.md`

This roadmap remains valid, but execution now follows a strict order:

1. **Ship the smallest working product loop first** (capture -> insight -> action)
2. **Validate with real users**
3. **Only then expand features and revenue streams**

---

## Execution Priority (Next 14 Days)

### Priority 1: Working Loop (Must Have)

- Landing -> waitlist submit confirmation
- One ingest path (voice or text)
- One insight returned
- One actionable guidance item shown

### Priority 2: Validation (Must Have)

- 10 real users test the loop
- Capture friction + desired outcomes
- Keep/kill decisions logged

### Priority 3: Hardening (Should Have)

- Basic analytics events
- Error states and retries in UI
- Baseline data schema and endpoint contracts

### Deferred Until After Validation

- Merch, advanced animations, multi-channel growth automation
- Additional integrations beyond MVP loop

These are not removed—just intentionally delayed until the core loop proves traction.

---

## Week 1: Foundation & Validation

**Goal:** Prove the core loop works (voice → insight)

### Infrastructure (3-4 hours)
- [ ] Rent Hotinger VPS ($7-10/mo, 1 year prepaid)
- [ ] Deploy OpenClaw via Docker (one-click)
- [ ] Connect personal Telegram/Discord/WhatsApp
- [ ] Test OpenClaw on VPS (can you send yourself a message?)

**Owner:** You + Hotinger docs + AlexFinn YouTube

### Landing Page (4-6 hours)
- [ ] Create qordi.werii.com landing (use Unicorn or code Next.js starter)
- [ ] Copy: "Think Sharper. Live Awake" hero
- [ ] Embed Goldendoodle image (Unsplash)
- [ ] Waitlist form (Tally.so, emails to you)
- [ ] Deploy to Vercel or Hotinger

**Owner:** You + AI tools (Copilot/ChatGPT for design/code)

### Voice Ingest MVP (6-8 hours)
- [ ] Set up Supabase (DB + auth + vector store)
- [ ] Create `/api/transcribe` endpoint (OpenAI Whisper)
- [ ] Create simple upload widget (Next.js component)
- [ ] Test: Upload voice note → See transcript

**Owner:** You + Copilot Chat (code generation)

### Validation (Ongoing)
- [ ] Share qordi.werii.com on X/LinkedIn
- [ ] DM 5 friends + early followers
- [ ] Goal: 50 waitlist signups
- [ ] Track: Waitlist conversion rate

**Deliverables:**
- ✅ qordi.werii.com landing live
- ✅ app.werii.com voice upload working
- ✅ 50+ waitlist signups
- ✅ 10 beta testers validated core loop

---

## Week 2: Core Features & Scale

**Goal:** Build MVP features, onboard 50+ beta users

### Expand Voice Ingest (4 hours)
- [ ] Multi-format upload (voice + text + PDF)
- [ ] Auto-tag by project/goal (simple rules)
- [ ] Basic vector embeddings (OpenAI)
- [ ] Store in Supabase vectors

**Owner:** You + Copilot Chat

### RAG Query (6 hours)
- [ ] Build `/api/query-insights` endpoint
- [ ] Semantic search over ingested ideas
- [ ] UI: Simple search box on dashboard
- [ ] Test: "What did I say about guitar?"

**Owner:** You + Copilot Chat

### Goal Tracking (4 hours)
- [ ] Create goals UI (simple form)
- [ ] Progress bars (visual)
- [ ] Pup evolution (3 stages: puppy, teen, sage)
- [ ] Track: Ideas ingested vs. goals completed

**Owner:** You + Copilot Chat (animations)

### Stripe Integration (3 hours)
- [ ] Set up Stripe account
- [ ] Create `/api/checkout` endpoint
- [ ] Pro tier ($9/mo) form
- [ ] Test payment flow (Stripe test mode)

**Owner:** You + Copilot Chat

### Content Marketing (2 hours)
- [ ] Write first blog post: "Why Voice-First AI Matters"
- [ ] Email template for waitlist
- [ ] Share on X/Reddit (r/SideProject)

**Owner:** You + AI tools

### Beta Launch (2 hours)
- [ ] Invite 50 waitlist users to beta
- [ ] Setup feedback form (Tally or Typeform)
- [ ] Add analytics (Google Analytics or Plausible)
- [ ] Track: DAU, session length, churn

**Owner:** You

**Deliverables:**
- ✅ MVP working (voice → insight → guidance start)
- ✅ 50+ beta users
- ✅ 30%+ Day-7 retention
- ✅ Stripe payments working
- ✅ Google Analytics tracking

---

## Week 3: Predictive Guidance & Growth

**Goal:** Launch predictive nudges, scale to 100+ beta users

### Guidance Generation (6 hours)
- [ ] Create `/api/generate-guidance` endpoint
- [ ] Rule-based nudges (first version)
  - "You're 60% through guitar—next: minor 7s"
  - "Book has 8 chapters, you've done 2—next: Chapter 3"
- [ ] Daily cron job (Vercel cron or APScheduler)
- [ ] Email delivery (Resend.com free tier)

**Owner:** You + Copilot Chat

### Asset Generation (4 hours)
- [ ] Create `/api/generate-assets` endpoint
- [ ] Generate book outlines (Markdown)
- [ ] Generate weekly email summaries
- [ ] Export as PDF/Markdown

**Owner:** You + Copilot Chat

### Pup Animations (4 hours)
- [ ] Fetch animation (idea lands)
- [ ] Dig animation (search)
- [ ] Tail wag (completion)
- [ ] Evolution celebration (milestone hit)

**Owner:** You + AI tools (Framer/Lottie for animations)

### Ethical Filters (2 hours)
- [ ] Add "awaken layer" prompt guard
- [ ] Basic fact-checking layer
- [ ] Option to filter via Scripture (if tagged "faith")

**Owner:** You + Copilot Chat

### Growth (3 hours)
- [ ] Post on ProductHunt (coming soon)
- [ ] Email sequence to waitlist (3-email drip)
- [ ] Reddit AMA in r/Entrepreneur
- [ ] Goal: 100+ beta users by end of week

**Owner:** You

**Deliverables:**
- ✅ Daily predictive nudges working
- ✅ Asset generation (outlines, emails)
- ✅ Pup animations delighting users
- ✅ 100+ beta users
- ✅ Email marketing running

---

## Week 4: Multi-Source Ingest & Feedback Loop

**Goal:** Expand ingest, gather user feedback, refine features

### Browser Extension (6 hours)
- [ ] Build Qordi browser extension
- [ ] Capture chat transcripts (Discord, Twitter Spaces, etc.)
- [ ] Screenshot + auto-caption
- [ ] One-click save to Qordi

**Owner:** You + Copilot Chat (scaffold + polish)

### Chat Export (4 hours)
- [ ] Support Discord export
- [ ] Support ChatGPT export
- [ ] Auto-parse and import
- [ ] Tag by conversation type

**Owner:** You + Copilot Chat

### User Feedback Loop (2 hours)
- [ ] Send survey: "What feature matters most?"
- [ ] Monitor support email (for bugs/feedback)
- [ ] Adjust roadmap based on user requests
- [ ] Publish "We heard you" update post

**Owner:** You

### Metrics Analysis (2 hours)
- [ ] Review DAU, retention, feature usage
- [ ] Identify drop-off points (where users leave)
- [ ] Identify power users (high engagement)
- [ ] Plan fixes for Week 5

**Owner:** You + Data visualization tools

**Deliverables:**
- ✅ Browser extension working
- ✅ Multi-source ingest stable
- ✅ User feedback collected
- ✅ Roadmap adjusted based on feedback

---

## Week 5: Merch Store & Content

**Goal:** Launch merch + boost audience via content

### Merch Store Setup (4 hours)
- [ ] Set up Printful account
- [ ] Design first batch: Qordi hoodies, t-shirts, hats
- [ ] Integrate into werii.com
- [ ] Setup payment flow (Stripe + Printful API)

**Owner:** You + Copilot Chat (design prompts)

### Content Generation Skill (4 hours)
- [ ] Build OpenClaw skill: content-gen
- [ ] Auto-write blog posts from trends
- [ ] Auto-generate email campaigns
- [ ] Schedule posts to X/LinkedIn

**Owner:** You + Copilot Chat

### Content Marketing Sprint (3 hours)
- [ ] Publish 3 blog posts (1 per day)
  - "Why AI Needs Ethics"
  - "Voice Over Text: Why It Matters"
  - "The Future of Personal AI"
- [ ] Email sequence to waitlist
- [ ] Share on X, Reddit, HackerNews

**Owner:** You + AI tools

### Refine v1 Features (3 hours)
- [ ] Polish pup animations
- [ ] Improve guidance quality
- [ ] Add user preferences (ethics, frequency, etc.)
- [ ] Bug fixes from Week 4

**Owner:** You + Copilot Chat

**Deliverables:**
- ✅ Merch store live (first revenue stream)
- ✅ Content generation running
- ✅ 3 blog posts published
- ✅ v1 feature refinement 50% done

---

## Week 6: OpenClaw Skills & Analytics

**Goal:** Build OpenClaw skills, set up analytics hub

### OpenClaw Custom Skills (8 hours)

#### 1. Idea Capture Skill (2 hours)
- [ ] Parse voice → extract tags/goals/projects
- [ ] Auto-categorize by intent
- [ ] Extract action items

#### 2. Guidance Generation Skill (2 hours)
- [ ] Your personal nudges (not user nudges)
- [ ] Analyze your idea trends
- [ ] Suggest "this could be a $X app"

#### 3. Trend Analysis Skill (2 hours)
- [ ] Scan your ideas for patterns
- [ ] Identify emerging themes
- [ ] Suggest content angles

#### 4. Metrics Tracking Skill (2 hours)
- [ ] Track revenue by stream
- [ ] Track user adoption
- [ ] Suggest pivots based on ROI

**Owner:** You + AlexFinn YouTube + Copilot Chat

### WeriiHQ Analytics Dashboard (4 hours)
- [ ] Build dashboard page (Next.js)
- [ ] Display metrics:
  - Qordi revenue, users, churn
  - Merch sales, trends
  - Blog engagement (views, shares)
  - Email list growth
- [ ] Daily digest email

**Owner:** You + Copilot Chat

### Launch Preparation (2 hours)
- [ ] Write public launch announcement
- [ ] Prepare ProductHunt page
- [ ] Create demo video (30 sec)
- [ ] Email sequence ready

**Owner:** You

**Deliverables:**
- ✅ OpenClaw skills working (your personal brain)
- ✅ Analytics dashboard live
- ✅ Launch assets ready

---

## Week 7: Final Polish & Community

**Goal:** Polish v1, build community, prepare launch

### Final Feature Polish (4 hours)
- [ ] User onboarding flow
- [ ] Mobile responsiveness
- [ ] Accessibility review (a11y)
- [ ] Performance optimization

**Owner:** You + Copilot Chat

### Community Building (4 hours)
- [ ] Launch Discord/Slack community
- [ ] Early user group (power users)
- [ ] FAQ/knowledge base
- [ ] Support email setup

**Owner:** You

### Launch Marketing (2 hours)
- [ ] ProductHunt launch prep (final check)
- [ ] Email list segmentation
- [ ] Social media scheduled posts (7 days out)
- [ ] Press outreach (tech blogs, newsletters)

**Owner:** You + AI tools

**Deliverables:**
- ✅ v1 feature complete and polished
- ✅ Community channels live
- ✅ Launch marketing ready

---

## Week 8: Public Launch!

**Goal:** Launch to public, reach 100+ users, measure success

### Launch Day (Week 8, Monday)
- [ ] ProductHunt launch (morning)
- [ ] Twitter/LinkedIn threads (morning)
- [ ] Email sequence (throughout day)
- [ ] Monitor: Signups, feedback, errors
- [ ] Support: Respond to feedback within 2 hours

**Owner:** You + monitoring tools

### Launch Week (Week 8, Mon-Fri)
- [ ] Reddit AMAs (r/SideProject, r/Entrepreneur)
- [ ] Podcast interviews (if any opportunities)
- [ ] Daily blog posts (capitalize on momentum)
- [ ] Community calls (Zoom with early users)
- [ ] Track: Signups per day, conversion rate, churn

**Owner:** You + community

### Launch Weekend (Week 8, Sat-Sun)
- [ ] Catch up on support emails
- [ ] Monitor analytics
- [ ] Celebrate milestones (50 users, 100 users)
- [ ] Plan Week 9 improvements

**Owner:** You

**Success Metrics for Public Launch:**
- ✅ 100+ signups (public launch)
- ✅ 30+ paid Pro conversions
- ✅ $270/mo MRR ($30 × 9/mo)
- ✅ Positive user feedback (NPS > 50)
- ✅ 0 critical bugs
- ✅ ProductHunt top 10 ranking (goal)

---

## Month 2 (Weeks 9-12): Iterate & Scale

### Week 9-10: Data-Driven Iteration
- [ ] Analyze metrics: What features do users love?
- [ ] Fix bugs reported by users
- [ ] Add top-requested features
- [ ] Email campaign: "Thank you for launching with us"
- [ ] Goal: 150+ users

### Week 11-12: Scale & Expand
- [ ] Expand merch (new designs based on user feedback)
- [ ] Plan next SaaS app (based on trending ideas from your OpenClaw)
- [ ] Consider: Teams/collab mode for Qordi
- [ ] Goal: 200+ users, $1,800/mo MRR

---

## Beyond Month 2: Scale & New Revenue Streams

### Month 3+: Sustainable Growth
- [ ] Build second SaaS app (from trending ideas)
- [ ] Expand Qordi features (mobile app?)
- [ ] Analyze merch data → optimize designs
- [ ] Consider: Affiliate partnerships (AI tools, productivity apps)
- [ ] Goal: $5,000/mo MRR (50% Qordi, 30% apps, 20% merch)

---

## Key Metrics to Track

### Qordi (SaaS)
- **Acquisition:** Signups per day, traffic source, conversion rate (free → pro)
- **Engagement:** DAU, session length, feature usage
- **Retention:** Day-7, Day-30, Day-60 churn
- **Revenue:** MRR, LTV, CAC, payback period

### Merch
- **Sales:** Orders per week, avg order value, profit margin
- **Customer:** Repeat rate, review score
- **Trend:** Which designs sell best?

### Content
- **Blog:** Views, shares, email captures
- **Email:** Open rate, click rate, unsubscribe rate
- **Social:** Followers, engagement, traffic

### Overall
- **User Feedback:** NPS, support tickets, feature requests
- **Market:** Competitive landscape, emerging trends
- **Financial:** MRR by stream, runway, profitability timeline

---

## Risk Mitigation

| Risk | Mitigation |
|------|-----------|
| Users don't adopt voice | Offer text + PDF upload by Week 4 |
| Competition emerges | Focus on ethical AI + pup differentiation |
| Payment processor issues | Have Stripe + PayPal ready |
| Server downtime | Backups + monitoring (Week 2+) |
| User churn | Weekly cohort analysis + feature pivots |

---

## Decision Gates

**Week 3 (MVP Launch):**
- If DAU < 10 or churn > 50%: Pivot feature priority
- If no bugs: Continue full speed
- If bugs: Spend Week 4 fixing before feature work

**Week 8 (Public Launch):**
- If signups < 50: Double marketing spend
- If conversion (free → pro) < 20%: Revise pricing or features
- If DAU drops > 30%: Investigate churn reason

---

## Success Definition

**Launch Week Success:**
- 100+ public signups
- 30+ Pro conversions
- Zero critical bugs
- Positive user sentiment

**Month 2 Success:**
- 200+ users
- $1,800/mo MRR
- 40% churn rate or lower
- Users calling it "indispensable"

**Long-term (6+ months):**
- Product-market fit (viral coefficient > 1)
- 1,000+ users
- $5,000+ MRR
- Ready to scale or raise funding