# WeriiHQ Development Guidelines

**For:** GitHub Copilot (and ChatGPT/Claude when building code)

**Purpose:** Ensure consistent, high-quality development across all repos

---

## Core Philosophy

We're building a personal AI operating system that:
- **Captures** scattered ideas
- **Organizes** chaos into clarity
- **Guides** action with gentle nudges
- **Measures** impact
- **Iterates** based on data

Everything we code should reflect this philosophy.

---

## Code Principles

### 1. TypeScript Everywhere
- Type safety > speed
- No implicit `any` types
- All function parameters typed
- All return types declared
- Use `interface` for data models, `type` for unions/aliases

**Good:**
```typescript
interface Idea {
  id: string;
  content: string;
  createdAt: Date;
  projectId: string;
}

function createIdea(idea: Idea): Promise<Idea> {
  // ...
}
```

**Bad:**
```typescript
function createIdea(idea: any) {
  // ...
}
```

### 2. Error Handling
- Never silently fail
- Always log errors (but never log API keys)
- Return meaningful error messages to users
- Fail fast, fail loudly

**Good:**
```typescript
try {
  const transcript = await transcribeAudio(audioUrl);
} catch (error) {
  console.error('Transcription failed:', error.message);
  throw new Error('Failed to transcribe audio. Please try again.');
}
```

**Bad:**
```typescript
const transcript = await transcribeAudio(audioUrl);
// Hope it worked...
```

### 3. Security First
- Never commit `.env` files
- Never log API keys or secrets
- Validate ALL user input
- Sanitize outputs (XSS protection)
- Rate-limit endpoints
- Use HTTPS everywhere

**Good:**
```typescript
function validateEmail(email: string): boolean {
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return emailRegex.test(email);
}

if (!validateEmail(userEmail)) {
  throw new Error('Invalid email address');
}
```

### 4. API Design
- RESTful conventions
- Clear, descriptive endpoint names
- Versioning (`/api/v1/...`)
- Consistent response format
- Document every endpoint

**Good:**
```
POST /api/v1/ideas
GET /api/v1/ideas/:id
PUT /api/v1/ideas/:id
DELETE /api/v1/ideas/:id
```

**Good Response:**
```json
{
  "success": true,
  "data": { /* idea object */ },
  "error": null
}
```

### 5. Performance
- No premature optimization
- But: Don't load everything into memory
- Cache appropriately
- Monitor: Query performance, bundle size
- Lazy-load components

### 6. Testing
- Unit tests for business logic
- Integration tests for APIs
- E2E tests for user flows
- Aim for 80%+ coverage on critical paths
- Run tests before pushing

---

## Frontend (Next.js + React)

### Structure
```
app/
├── (pages)/          ← Grouped routes
│   ├── dashboard/
│   ├── api/          ← API routes (call /api handlers)
│   └── ...
├── components/       ← Reusable components
├── lib/             ← Utilities
└── layout.tsx       ← Root layout
```

### Component Guidelines
- **Functional components only** (no class components)
- **Use TypeScript interfaces** for props
- **Extract custom hooks** for reusable logic
- **Keep components small** (<200 lines)
- **Use Tailwind** (no custom CSS unless necessary)

**Good:**
```typescript
interface CardProps {
  title: string;
  children: React.ReactNode;
  onClick?: () => void;
}

export function Card({ title, children, onClick }: CardProps) {
  return (
    <div className="p-4 border rounded-lg cursor-pointer hover:bg-gray-50" onClick={onClick}>
      <h2 className="text-lg font-bold">{title}</h2>
      {children}
    </div>
  );
}
```

### Styling
- **Tailwind CSS** for styling
- **No inline styles**
- **Consistent spacing** (use Tailwind scale)
- **Dark mode support** (via Tailwind)
- **Responsive design** (mobile-first)

### State Management
- Use **React hooks** (useState, useContext)
- **Supabase hooks** for data (custom useIdea, useGuidance, etc.)
- Keep state as local as possible
- Lift state only when needed

---

## Backend (API Routes & Functions)

### Endpoint Structure
```typescript
// /api/ideas/route.ts

export async function POST(req: Request) {
  try {
    // 1. Parse request
    const body = await req.json();
    
    // 2. Validate input
    if (!body.content || typeof body.content !== 'string') {
      return Response.json({ error: 'Invalid content' }, { status: 400 });
    }
    
    // 3. Execute business logic
    const idea = await createIdea(body);
    
    // 4. Return result
    return Response.json({ data: idea }, { status: 201 });
  } catch (error) {
    console.error('POST /api/ideas error:', error);
    return Response.json({ error: 'Internal server error' }, { status: 500 });
  }
}
```

### External API Calls
- **OpenAI:** Use environment variables for API key
- **Supabase:** Use typed client library
- **Stripe:** Use official npm package
- **Always handle rate limits** (exponential backoff)

**Good:**
```typescript
const openai = new OpenAI({
  apiKey: process.env.OPENAI_API_KEY, // Never inline
});

const transcript = await openai.audio.transcriptions.create({
  file: audioBuffer,
  model: 'whisper-1',
});
```

### Database Queries
- **Parameterize all queries** (prevent SQL injection)
- **Use Supabase query builder** (not raw SQL)
- **Index frequently-queried columns**
- **Optimize: SELECT only needed columns**

**Good:**
```typescript
const ideas = await supabase
  .from('ideas')
  .select('id, content, createdAt')
  .eq('userId', userId)
  .order('createdAt', { ascending: false });
```

---

## Documentation

### README.md (Every Repo)
```markdown
# weriihq/web (or api, core, infra)

## What This Does

[1-2 sentences]

## Quick Start

1. Clone: `git clone https://github.com/weriihq/web.git`
2. Install: `npm install`
3. Setup: `cp .env.example .env`
4. Run: `npm run dev`

## Folder Structure

[Brief overview]

## Development

[How to contribute, run tests]

## Links

[Links to docs, API, etc.]
```

### Code Comments
- Comment **why**, not **what**
- Keep comments up-to-date
- Use JSDoc for complex functions

**Good:**
```typescript
// Prioritize ideas by recency (newer = better chance to act on)
const sortedIdeas = ideas.sort((a, b) => b.createdAt - a.createdAt);
```

**Bad:**
```typescript
// Sort ideas
const sortedIdeas = ideas.sort((a, b) => b.createdAt - a.createdAt);
```

### API Documentation
- Describe each endpoint
- Example request/response
- Error codes
- Rate limits

**Good:**
```markdown
## POST /api/ideas

Create a new idea.

**Request:**
```json
{
  "content": "Learn minor 7 chords",
  "projectId": "guitar-001"
}
```

**Response (201):**
```json
{
  "id": "idea-123",
  "content": "Learn minor 7 chords",
  "projectId": "guitar-001",
  "createdAt": "2026-03-01T12:00:00Z"
}
```

**Errors:**
- 400: Invalid content
- 401: Unauthorized
- 500: Server error
```

---

## Git & GitHub

### Commit Messages
- Clear, descriptive
- Imperative mood ("Add feature" not "Added feature")
- Reference issues if applicable

**Good:**
```
feat: Add voice upload to ideas endpoint

- Integrate Whisper for transcription
- Store audio in Supabase
- Closes #42
```

**Bad:**
```
Fixed stuff
```

### Branch Naming
- `feature/voice-upload`
- `fix/pup-animation-stutter`
- `docs/readme-update`
- `chore/upgrade-dependencies`

### Pull Requests
- One feature per PR
- Clear description (what, why, how to test)
- Link related issues
- Request review
- Self-review before submitting

---

## Performance & Optimization

### Frontend
- **Code splitting:** Import only what's used
- **Image optimization:** Use Next.js Image component
- **Font loading:** Use system fonts or Google Fonts optimized
- **Bundle size:** Monitor with `next/bundle-analyzer`
- **Lazy loading:** Load heavy components on scroll/interaction

**Good:**
```typescript
import Image from 'next/image';

export function PupAvatar() {
  return (
    <Image
      src="/pup.png"
      alt="Qordi pup"
      width={100}
      height={100}
      priority={false}
    />
  );
}
```

### Backend
- **Query optimization:** Use indexes, select specific columns
- **Caching:** Cache frequently-accessed data (Redis, Supabase cache)
- **Rate limiting:** Prevent abuse
- **Pagination:** Don't load all records at once

**Good:**
```typescript
const ideas = await supabase
  .from('ideas')
  .select('id, content')
  .eq('userId', userId)
  .limit(20)
  .offset((page - 1) * 20);
```

---

## Testing

### Unit Tests (Jest)
- Test business logic
- Test edge cases
- Test error handling

**Good:**
```typescript
describe('parseIdeaContent', () => {
  it('should extract tags from content', () => {
    const content = 'Learn #guitar #music by #friday';
    const tags = parseIdeaContent(content);
    expect(tags).toContain('guitar');
  });

  it('should return empty array if no tags', () => {
    const content = 'Just a regular idea';
    const tags = parseIdeaContent(content);
    expect(tags).toEqual([]);
  });
});
```

### Integration Tests
- Test API endpoints
- Test database queries
- Test external API calls (mock)

### E2E Tests (Playwright)
- Test user flows
- Test critical paths (signup, upload idea, view guidance)

---

## Monitoring & Debugging

### Logging
- **Development:** Log to console
- **Production:** Use structured logging (Sentry, LogRocket)
- **Never log:** API keys, passwords, sensitive data

**Good:**
```typescript
console.log('Idea created:', ideaId, 'for user:', userId);
```

**Bad:**
```typescript
console.log('Database password:', process.env.DB_PASSWORD);
```

### Error Tracking
- Use Sentry for production errors
- Monitor: Error rate, user impact, stack traces
- Alert on critical errors

### Performance Monitoring
- Monitor: Page load time, API response time
- Track: Bundle size, query performance
- Use tools: Google Lighthouse, New Relic

---

## Qordi-Specific Guidelines

### Voice Recording
- Should feel natural and easy
- Clear visual feedback (waveform, timer)
- Cancel/retry buttons
- Auto-stop after silence (configurable)

**Good UX:**
```
[🎤 Recording...]  (visual waveform)
[Cancel] [Stop]
Duration: 0:15
```

### Pup Animations
- Delight without distraction
- Smooth transitions (not jarring)
- Respect user's animation preferences (prefers-reduced-motion)
- Load asynchronously (don't block UI)

### Error Messages
- User-friendly (no stack traces)
- Actionable (suggest how to fix)
- Contextual (relate to what user was doing)

**Good:**
```
"Failed to transcribe audio. Please ensure your microphone is working and try again."
```

**Bad:**
```
"Error: ENOENT: open '/tmp/audio.wav'"
```

---

## Review Checklist

Before merging, check:

- [ ] **Code Quality**
  - [ ] TypeScript: No `any` types
  - [ ] No console.logs (except debug mode)
  - [ ] Error handling present
  - [ ] Security: No secrets in code

- [ ] **Testing**
  - [ ] Tests written
  - [ ] Tests passing
  - [ ] Coverage maintained

- [ ] **Documentation**
  - [ ] README updated
  - [ ] API docs updated
  - [ ] Comments where needed

- [ ] **Performance**
  - [ ] Bundle size OK
  - [ ] Queries optimized
  - [ ] No memory leaks

- [ ] **UX**
  - [ ] Mobile responsive
  - [ ] Accessible (a11y)
  - [ ] Error states handled
  - [ ] Loading states clear

---

## When Stuck

1. **Check the docs:** `/docs/architecture.md`, `/docs/api.md`
2. **Check existing code:** Look for similar patterns in the repo
3. **Ask Copilot:** "How do I...?" and reference `.copilot/instructions.md`
4. **Ask the team:** Post in Discord/Slack

---

## Updates to These Guidelines

These guidelines evolve as the project grows.

- Found a better pattern? Create an issue to discuss
- Guidelines unclear? Ask for clarification
- Disagree? Let's talk and decide together

**Last Updated:** March 1, 2026