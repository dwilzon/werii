# werii/infra

> Infrastructure as code — OpenClaw VPS setup, Docker configs, and deployment scripts.

**Path:** `dwilzon/werii/infra/` _(future: `weriicore/werii/infra/`)_

---

## What This Does

Everything needed to bring up and maintain the Hostinger VPS that runs OpenClaw (personal AI brain) and hosts the Qordi backend. Includes Docker Compose configs, custom OpenClaw skills, monitoring scripts, and one-click deploy automation.

## Planned Folder Structure

```
infra/
├── docker-compose.yml             ← OpenClaw container definition
│
├── openclaw/
│   ├── skills/
│   │   ├── idea-capture.js        ← Capture ideas from WhatsApp/Telegram
│   │   ├── guidance-gen.js        ← Generate personal nudges
│   │   ├── trend-analysis.js      ← Analyze idea trends
│   │   ├── content-gen.js         ← Write blog posts / emails
│   │   ├── chat-archive.js        ← Archive AI conversations
│   │   ├── metrics-tracking.js    ← Track revenue and adoption
│   │   └── SKILL.md               ← Skill template and docs
│   │
│   ├── config/
│   │   └── .env.example           ← OpenClaw env vars template
│   │
│   └── README.md                  ← OpenClaw setup guide
│
├── monitoring/
│   ├── docker-logs.sh
│   └── health-check.sh
│
├── scripts/
│   ├── deploy.sh                  ← One-click deploy to Hostinger
│   ├── backup.sh                  ← Backup OpenClaw data
│   └── update.sh                  ← Update OpenClaw version
│
├── .env.example
└── README.md
```

## Quick Start (VPS Setup)

```bash
# 1. SSH into your Hostinger VPS
ssh user@your-vps-ip

# 2. Clone the repo
git clone https://github.com/dwilzon/werii.git
cd werii/infra

# 3. Configure environment
cp .env.example .env
# Fill in: OPENAI_API_KEY, VPS_IP, etc.

# 4. Deploy OpenClaw
docker-compose up -d

# 5. Verify it's running
bash monitoring/health-check.sh
```

## Links

- [OpenClaw Skills](../OPENCLAW_SKILLS.md)
- [System Architecture](../SYSTEM_ARCHITECTURE.md)
- [Docs](../docs/README.md)
