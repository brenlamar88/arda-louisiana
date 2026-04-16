# ADRD Louisiana — Website

**Alzheimer's & Related Dementia Association of Louisiana**

A fully static, multi-page educational website organized around three clinical pillars: Prevention, Diagnosis, and Treatment.

## Pages

| Page | Description |
|---|---|
| `index.html` | Homepage — hero, 3-pillar cards, verified Louisiana stats |
| `prevention.html` | 12 risk factor cards, APOE genetics, MIND diet + action plan |
| `diagnosis.html` | 10 warning signs, dementia types, 6-step diagnostic process, FAQ |
| `treatment.html` | Symptomatic meds, Leqembi/Kisunla cards, clinical trials, goals of care |
| `resources.html` | National + Louisiana orgs, caregiver support guide |
| `about.html` | Mission, Dr. Foundas bio card, Louisiana health context |
| `contact.html` | Contact form, helpline banner, Dr. Foundas direct contact |

## Data Sources

All statistics are sourced from:
- **Alzheimer's Association Louisiana Chapter** — alz.org/louisiana
- **2025 Alzheimer's Disease Facts & Figures** — alz.org/facts
- **Well-Ahead Louisiana / 2023–2028 Louisiana ADRD State Plan** — wellaheadla.com
- **CDC National Center for Health Statistics** (2024)

### Key verified figures
- **94,700** Louisianans living with Alzheimer's (current; projected 110,000 by 2025)
- **168,000** unpaid family caregivers in Louisiana
- **256 million** hours of unpaid care annually
- **12.4%** prevalence rate — among the nation's highest
- **6th** leading cause of death nationally (5th among adults 65+)
- **2×** higher risk for Black Americans
- **40%** of dementia cases potentially linked to modifiable risk factors

## Quick Deploy

```bash
# One-command setup (requires gh CLI + vercel CLI)
chmod +x deploy.sh && ./deploy.sh
```

### Manual deploy

**GitHub:**
```bash
git init
git add -A
git commit -m "ADRD Louisiana initial deploy"
gh repo create brenlamar88/adrd-louisiana --public --source . --push
```

**Vercel:**
```bash
vercel deploy --prod --scope v8-technologies-projects
```

## Tech Stack

- Pure HTML/CSS/JavaScript — no frameworks, no build step
- Google Fonts (Cormorant Garamond + DM Sans)
- Mobile-responsive with hamburger nav
- IntersectionObserver scroll animations
- FAQ accordion via vanilla JS
- Contact form with client-side validation

## To Do / Future Enhancements

- [ ] Connect contact form to backend (Supabase or Jotform)
- [ ] Add Google Analytics or privacy-friendly analytics
- [ ] Custom domain (e.g. adrdlouisiana.org)
- [ ] Add blog/news section for Dr. Foundas to publish updates
- [ ] Spanish-language versions of key pages
