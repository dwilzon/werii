# OpenClaw Custom Skills Specification

These are the skills you'll build for your personal OpenClaw brain.

**Note:** These are different from Qordi's features. These run on your VPS and help YOU think/decide/build.

---

## Skill 1: Idea Capture & Organization

### What It Does
- Listens on your channels (WhatsApp, Telegram, Discord, Slack)
- Captures ideas you send
- Extracts: tags, goals, projects, priority
- Stores in OpenClaw database

### Trigger
```
You: "Learn minor 7 chords on guitar"
```

### Processing
1. Parse the text
2. Identify intent: Learning? Building? Thinking?
3. Extract tags: `#guitar #learning`
4. Assign to project: "Guitar Progress"
5. Set priority: Medium (depends on patterns)
6. Store in DB

### Output
```
✅ Captured: "Learn minor 7 chords"
📁 Project: Guitar Progress
🏷️ Tags: #guitar, #learning
📊 Priority: Medium
```

### Implementation
- Language: JavaScript (OpenClaw skill)
- Input: User message via Telegram/Discord/etc
- Process: Regex + NLP (local or OpenAI)
- Output: Store in Supabase
- Run: Real-time (on every message)

---

## Skill 2: Guidance Generation

### What It Does
- Analyzes your ideas
- Generates personalized nudges
- Suggests next actions
- Provides priority ranking

### Trigger
- Daily (morning, 8am)
- On-demand ("@openclaw guidance")

### Processing
1. Fetch your ideas from past 7 days
2. Analyze: What's stuck? What's progressing?
3. Apply rules:
   - "If learning X for 2+ weeks without progress → remind to practice"
   - "If 3 ideas about same topic → merge them"
   - "If idea has 0 activity for 30 days → archive it"
4. Generate nudge
5. Send via preferred channel

### Output Example
```
🐕 Daily Guidance

Your guitar learning is 60% done!
Next step: Practice minor 7 chords (video: [link])

📚 Book outline is ready for Chapter 3 editing.
You've done 2/8 chapters. Keep the momentum!

💡 You mentioned "podcast marketing" 3 times this week.
Consider blocking 2 hours Friday to plan that out.

🎯 Priority: Focus on guitar this week. Archive the podcast idea for later.
```

### Implementation
- Language: JavaScript (OpenClaw skill)
- Input: Your ideas (from DB)
- Process: Rules engine + OpenAI
- Output: Send to Telegram/Discord/Email
- Run: Daily cron (8am) + on-demand

---

## Skill 3: Trend Analysis

### What It Does
- Scans your ideas
- Identifies patterns
- Suggests content angles
- Recommends "what to build"

### Trigger
- Weekly (Sunday evening)
- On-demand ("@openclaw trends")

### Processing
1. Fetch all your ideas + OpenClaw chats for past month
2. Use embeddings to cluster similar ideas
3. Identify clusters:
   - "AI tooling" (5 ideas)
   - "Productivity" (7 ideas)
   - "Learning" (12 ideas)
4. For each cluster:
   - What's the theme?
   - Who cares about this?
   - Is there a market?
5. Generate report

### Output Example
```
📊 Weekly Trends

🔥 HOT: Productivity AI (7 ideas)
- "Personal AI brain OS" (your Qordi!)
- "Task prioritization from chat"
- "Meeting transcription + insights"
→ Opportunity: Build "Productivity SaaS" app

🌙 STEADY: Content Creation (5 ideas)
- Blog writing assistance
- Email campaign generation
- Social media scheduling
→ Opportunity: Merch + sponsorships (audience building)

📚 GROWING: Learning (12 ideas)
- Guitar, Hebrew, coding courses
- Book writing
- Skill tracking
→ Opportunity: Partner with course platforms

💰 POTENTIAL: Underexplored (3 ideas)
- New idea: "AI-powered scheduling"
- Not mentioned before, could be promising
→ Worth 1 week exploratory build
```

### Implementation
- Language: JavaScript (OpenClaw skill)
- Input: Your ideas + chats (DB + chat history)
- Process: Embeddings + clustering + analysis
- Output: Weekly report
- Run: Weekly cron (Sunday, 6pm)

---

## Skill 4: Content Generation

### What It Does
- Analyzes trends
- Generates blog posts
- Creates email campaigns
- Schedules to X, LinkedIn, etc

### Trigger
- 3x per week (Mon/Wed/Fri)
- On-demand ("@openclaw write blog on [topic]")

### Processing
1. Pick top trend from trend analysis
2. Generate blog post (1,000 words)
   - Title: Catchy, SEO-friendly
   - Intro: Hook, problem statement
   - Body: 3-5 sections with examples
   - Conclusion: Call-to-action
3. Format: Markdown
4. Schedule: Thursday 9am (optimal posting time)
5. Promote via email

### Output Example
**Blog Post:**
```
Title: "Why Voice-First AI is the Future of Productivity"

Abstract: 87% of ideas never get executed because writing takes too much friction. Here's why voice-first AI changes everything.

[1,000+ words of content]

Call-to-Action: "Join Qordi's waitlist to try voice-first thinking"
```

**Email Campaign:**
```
Subject: "Why You Should Dump Your Ideas via Voice"

Hi [Subscriber],

Today I'm sharing something that changed how I capture ideas...

[Email body]

CTA: Start your free Qordi trial
```

### Implementation
- Language: JavaScript (OpenClaw skill)
- Input: Trend analysis output
- Process: OpenAI GPT-4 + prompt engineering
- Output: Blog post (Markdown) + Email (HTML)
- Integration: GitHub Pages (blog), SendGrid (email)
- Run: 3x per week

---

## Skill 5: Chat Session Archive

### What It Does
- Captures all your AI conversations
- Extracts insights
- Prevents idea loss
- Builds knowledge base

### Trigger
- Real-time (on every chat)
- Weekly digest

### Processing
1. Intercept your chats:
   - ChatGPT sessions
   - Claude conversations
   - Copilot Chat in VS Code
   - Any AI interaction
2. Store: Full conversation + metadata
3. Extract:
   - Key insights
   - Action items
   - Decisions made
4. Index for search
5. Weekly digest: "Here's what you asked AI this week"

### Output Example
**Chat Archive (searchable):**
```
Date: March 1, 2026
Platform: ChatGPT
Topic: "How to structure a SaaS pricing model"

Key Insights:
- Freemium works for bottom-up adoption
- $9/mo is sweet spot for solo creators
- Need 60%+ retention to be profitable

Action Items:
- [ ] Implement Stripe for Qordi
- [ ] A/B test pricing
- [ ] Track LTV/CAC

Decision: Go with Freemium model for Qordi
```

**Weekly Digest:**
```
📚 This Week in AI Chats

17 conversations, 3 key decisions made:
1. Decided on Hotinger VPS (over AWS, GCP)
2. Locked tech stack (Next.js, Supabase, OpenAI)
3. Planned 8-week roadmap

Top Topics:
- Architecture (5 chats)
- Pricing (4 chats)
- Marketing (3 chats)

Search: All chats indexed and searchable
```

### Implementation
- Language: JavaScript (OpenClaw skill) + integrations
- Input: Chat APIs (ChatGPT, Claude, GitHub API for Copilot)
- Process: Real-time capture + weekly digest
- Output: Searchable DB + Weekly email
- Run: Real-time + weekly cron

---

## Skill 6: Metrics & ROI Tracking

### What It Does
- Tracks revenue by stream
- Measures traction
- Calculates ROI
- Suggests pivots

### Trigger
- Daily (revenue dashboard)
- Weekly (ROI analysis)
- Monthly (strategy report)

### Processing
1. Fetch metrics:
   - Qordi users, churn, revenue
   - Merch sales, profit margin
   - Blog traffic, email opens
   - Twitter followers, engagement
2. Calculate:
   - MRR (monthly recurring revenue)
   - CAC (cost of acquisition)
   - LTV (lifetime value)
   - ROI per channel
3. Analyze: What's working? What's not?
4. Suggest: "Double down on X, kill Y, try Z"

### Output Example
**Daily Dashboard:**
```
💰 Revenue Today: $47
MRR: $1,341
Goal: $5,000/mo (27% there)

📊 By Channel:
- Qordi SaaS: $900/mo (67%)
- Merch: $320/mo (24%)
- Sponsorships: $121/mo (9%)

📈 Trending Up:
- Qordi churn: ↓ 15% (good)
- Email list: ↑ 200 subscribers/week

📉 Trending Down:
- Blog traffic: ↓ 30% (needs content)

🎯 Action Items:
- Publish 2 blog posts this week
- A/B test Qordi pricing
- Follow up with 3 sponsorship prospects
```

**Weekly ROI Analysis:**
```
Which ideas → revenue?
- "Voice-first productivity" → Qordi users ✓
- "Goldendoodle mascot" → $50K meme potential (test)
- "Ethical AI brand" → Premium positioning ✓

Which ideas → flopped?
- "Podcast sponsorship" (0 revenue, kill)
- "Complex analytics" (nobody uses, simplify)

Next week focus:
- Qordi: Fix churn (interviews with churned users)
- Merch: New design based on trending ideas
- Content: Series on "building in public"
```

### Implementation
- Language: JavaScript (OpenClaw skill)
- Input: Revenue streams (Stripe, Printful API, Google Analytics)
- Process: Aggregation + calculation + analysis
- Output: Daily dashboard + Weekly report + Monthly strategy
- Run: Daily cron (6pm) + weekly (Sunday 7pm) + monthly (1st of month)

---

## Skill 7: Book Writing Assistant

### What It Does
- Organizes your ideas by book chapter
- Suggests structure
- Drafts sections
- Tracks progress

### Trigger
- Weekly (outline + progress)
- On-demand ("@openclaw write chapter 3 intro")

### Processing
1. Fetch ideas tagged with "book"
2. Organize by chapter (from your outline)
3. For each chapter:
   - Extract related ideas
   - Suggest structure (intro, body, conclusion)
   - Auto-generate rough draft
4. Track progress (% complete)
5. Send draft for review

### Output Example
**Weekly Book Progress:**
```
📖 Book: "Think Sharper. Live Awake"

Progress: 3 of 8 chapters drafted (37%)

Chapter 1: ✅ DONE (3,500 words)
- Intro to scattered ideas
- Why voice matters
- Your journey with Qordi

Chapter 2: ✅ DONE (2,800 words)
- How AI organizes chaos
- The second brain metaphor
- Why it matters

Chapter 3: 🔄 IN PROGRESS (1,200 words)
- Predictive guidance
- Daily nudges
- Staying accountable
→ Next: Add case studies (2 more sections)

Chapter 4-8: 📋 PLANNED (outlines ready)
```

**Auto-Generated Draft (Chapter 3 Intro):**
```
## Chapter 3: Predictive Guidance

When you capture 50 ideas a day, prioritization becomes the bottleneck.

You might ask: Which idea should I work on first?
- The urgent one? (Not always the best)
- The one with most potential? (Hard to judge upfront)
- The one I'm most excited about? (Enthusiasm fades)

Qordi answers this by learning your patterns. Over time, it understands:
- What kinds of ideas typically convert to revenue
- What your productivity patterns are
- When you're most likely to take action

[Continue with examples...]
```

### Implementation
- Language: JavaScript (OpenClaw skill)
- Input: Ideas tagged "book" + your chapter outline
- Process: Organization + structure suggestion + draft generation
- Output: Weekly progress + chapter drafts
- Run: Weekly cron (Tuesday 9am) + on-demand

---

## Skill Architecture

### Common Pattern
```
All skills follow this pattern:

1. TRIGGER
   - What causes the skill to run? (time-based, event-based, on-demand)

2. INPUT
   - What data does it need?

3. PROCESS
   - What logic does it apply?

4. OUTPUT
   - What does it produce?

5. SIDE EFFECTS
   - What else happens? (sends email, posts to Twitter, updates DB)
```

### Skill Template
```javascript
// openclaw/skills/[skill-name].js

export default {
  name: "My Skill",
  description: "What this skill does",
  triggers: {
    schedule: "0 8 * * *", // 8am daily (cron format)
    event: "message", // or "on_demand"
    keywords: ["@openclaw", "skill-name"]
  },
  
  async execute(input) {
    // Your logic here
    const result = await processInput(input);
    return result;
  },
  
  async onOutput(output) {
    // Send results (email, Telegram, etc)
    await notifyUser(output);
  }
};
```

---

## Integration Points

### Incoming Data
- **Telegram:** Messages to your bot
- **Discord:** Messages in your private channel
- **WhatsApp:** Voice notes + text
- **Slack:** Messages in private thread
- **Email:** Ideas sent to [email]

### Outgoing Data
- **Telegram:** Bot sends nudges/reports
- **Discord:** Embeds results in channel
- **Email:** Daily digest, weekly reports
- **Supabase:** Store all data
- **Social:** Auto-post content to X/LinkedIn

### External APIs
- **OpenAI:** Embeddings, transcription, generation
- **Stripe:** Revenue data
- **Printful:** Merch sales data
- **Google Analytics:** Blog traffic
- **SendGrid:** Email sending

---

## Success Metrics for Skills

| Skill | Success Metric |
|-------|----------------|
| Idea Capture | 100 ideas captured per month |
| Guidance | You follow 50%+ of suggestions |
| Trend Analysis | 3+ emerging trends identified monthly |
| Content Gen | 12+ blog posts published per month |
| Chat Archive | 0 insights lost (100% capture rate) |
| Metrics | You review daily and adjust strategy |
| Book Writing | 1 chapter drafted per week |

---

## Development Timeline

- **Week 1-2:** Ideas Capture + Guidance (MVP)
- **Week 3-4:** Trend Analysis + Content Gen
- **Week 5:** Chat Archive + Metrics (polish)
- **Week 6-8:** Book Writing + refinements

---

## Notes

- These run on your VPS (not exposed to Qordi users)
- You can test locally before deploying
- Each skill is independent (can enable/disable)
- Combine skills for powerful workflows
- Document what you learn (for future team)