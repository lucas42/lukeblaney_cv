# Evidence stories

Concrete situation → action → result stories for paragraph 2. Pick based on JD keywords; one well-told story beats three vague mentions.

Each story has:
- a **short** version (1–2 sentences) for letters with a tight word budget
- a **long** version (3–5 sentences) for letters where evidence is the centrepiece
- **tags**: JD types where the story lands well
- **gaps**: placeholders in `[BRACKETS]` where a specific number or detail would sharpen the story, with a note on what's still needed

---

## 1. Technical standards rationalisation

**Tags**: governance, technical leadership, cyber security, platform standards, cross-organisation coordination, ownership

**Short**:
> In my role as Cyber Security Director, I took on enterprise-wide technical standards governance: an area that had previously been lacking ownership. I deprecated a substantial number of obsolete standards, established annual-review ownership for the rest, and consolidated them into a central documentation hub.

**Long**:
> In my role as Cyber Security Director, I proactively took on responsibility for governance of enterprise-wide technical standards, an area which had previously been lacking clear ownership. I collated existing standards from sources across the organisation, identified obsolete ones and took them to our technical governance group for sign-off on their deprecation. For the remainder, I established a process where every standard had named ownership and an annual review cadence, and consolidated the full list into a central documentation hub. The result was engineering teams across the company having a clearer understanding of what was expected of them, and a much shorter list of standards that actually mattered.

**Gaps** (priority; best story in the pack; worth sharpening):
- Roughly how many standards total before, and roughly how many after the cull?
- How long did the project run end-to-end?
- Anything measurable downstream: audit pass rates, fewer security findings, faster engineering onboarding?

---

## 2. On-prem-to-SaaS migration coordination

**Tags**: platform engineering, vendor management, SaaS strategy, org-wide migration, project management, cloud transition

**Short**:
> I led the company-wide migration of several engineering tools from on-premise to SaaS: self-hosted Bitbucket to SaaS GitHub for ~300 engineers, self-hosted Jira to SaaS Jira for ~400 people across engineering and product, and a bespoke in-house SSO (which I had originally architected) to Okta for ~3000 end users. For each, I owned the vendor relationship, led the technical migration strategy, and project-managed the end-to-end move.

**Long**:
> As Principal Engineer at the Financial Times, I led the company-wide migration of several engineering tools from on-premise software to SaaS alternatives. Code Hosting moved from self-hosted Bitbucket to SaaS GitHub, covering roughly 300 engineers. Issue Tracking moved from self-hosted Jira to SaaS Jira, covering roughly 400 people across engineering, project management, and product. Single Sign-On moved from a bespoke in-house system (one I had originally architected years before) to Okta, with around 3000 end users to migrate. For each, I owned the vendor relationship, led the technical migration strategy, and project-managed the end-to-end move across every affected team. The cumulative effect was an engineering environment where every supporting tool was managed externally with better vendor support, freeing in-house effort for product work.

**Gaps** (still useful but parked):
- Any measurable outcome (cost? velocity? deployment frequency? incident reduction?)
- Roughly how long did each of the three migrations take end-to-end?

---

## 3. Universal Publishing Platform architecture

**Tags**: architect, platform engineering, microservices, multi-team, scale, legacy migration, architectural decision-making, consultative leadership

**Short**:
> As architect for the Financial Times' Universal Publishing Platform (100+ microservices delivering content from editorial tools to web, apps, and B2B clients), I made architectural decisions across six engineering squads while pivoting the architect role from decision bottleneck to consultative partner, giving squads more day-to-day autonomy.

**Long**:
> As architect for the Financial Times' Universal Publishing Platform, I was responsible for architectural decisions across six engineering squads working on a platform of 100+ microservices. The platform delivered content from a range of editorial tools to FT's websites, apps, and B2B clients: the central spine of the company's product. I planned and co-ordinated a multi-team, multi-year programme to replace a suite of legacy on-premise business-critical software with a mix of SaaS solutions and cloud-hosted bespoke microservices, and led a migration to Kubernetes that simplified operations across five squads. I also pivoted the architect role itself from a decision bottleneck into a more consultative one, designing decision boundaries so individual squads had autonomy for day-to-day calls while keeping cross-cutting concerns under architectural review.

**Gaps** (medium priority; story has good numbers already):
- How long did the legacy-replacement programme run end-to-end (you describe it as "multi-year")?
- Any measurable outcome (uptime, deploy frequency, time-to-feature, reader traffic served)?
- One specific legacy system that was replaced (without naming the supplier): what was the business function it served?

---

## 4. Reliability Engineering team from scratch

**Tags**: team-building, SRE, reliability, DevOps culture, recruitment, platform engineering, observability

**Short**:
> I built the Reliability Engineering function at the Financial Times from a blank slate: defining the remit, recruiting the team, and embedding DevOps principles across the wider engineering organisation.

**Long**:
> I built the Reliability Engineering function at the Financial Times from a blank slate. I defined the remit (`[scope: SRE, observability, incident response, performance, …?]`), recruited engineers from `[mix of internal moves and external hires?]`, and set the team's first-year focus on `[what was the lead-in goal?]`. The team's mandate was both delivery (running the platforms it owned: observability tooling, edge delivery) and enablement (embedding DevOps practices across the broader engineering organisation). One concrete result: `[specific outcome: incident MTTR? alert noise reduction? new observability practice rolled out?]`.

**Gaps** (high priority; currently underdeveloped):
- What was the team's headcount when it stabilised?
- What did "year one" actually focus on?
- One specific result that would resonate with an SRE-leadership reader?

**Pairs with**: [Story 8: Mixed-estate monitoring](#8-mixed-estate-monitoring--observability-platform). Story 4 sells the team-formation; Story 8 sells what the team built. If a JD wants both leadership and technical-output evidence, consider stacking them as the short-form versions across two sentences.

---

## 5. Cyber security at FT-scale (single-sentence credibility anchor)

**Tags**: scale, cyber security, public-target organisation, nation-state threat actors, resilience under traffic spikes; use as a *one-line* credibility anchor inside any cyber-flavoured letter

**Verbatim** (no edits; this line works as-is):
> "Working for over a decade at the Financial Times has meant designing and delivering platforms that handle audiences in the millions, operating them to withstand huge traffic spikes during moments of national significance (elections, budgets, wars, and pandemics), and defending them against a wide range of cyber threats, including from nation-state actors."

*Adapted from Luke's civil-service personal statement. The "13 years" version in the original phrasing also works; "over a decade" is the safer general-purpose form. Use either depending on whether the JD wants tenure foregrounded.*

---

## 6. Tokyo secondment / Nikkei product-security collaboration

**Tags**: international, cross-cultural, security, parent-subsidiary collaboration, knowledge transfer, stakeholder relationships beyond your direct team

**Short**:
> I spent three months on secondment to the FT's parent company, Nikkei, in Tokyo: supporting their product security function and strengthening operational ties between the two security teams.

**Long**:
> I spent three months on secondment to the FT's parent company, Nikkei, in Tokyo. The remit was to support their product security function (specifically: `[what did you work on with them?]`) and to strengthen operational ties between the two security teams, which had historically operated independently. `[Outcome: did the relationship continue? Any joint working practices established? Particular projects you completed?]`

**Gaps** (high priority; currently a bit abstract):
- One specific thing you worked on with the Nikkei team
- One concrete outcome: was there a follow-up arrangement, a shared standard, a continued contact route?

---

## 7. Centralised cyber security function (interim VP)

**Tags**: security leadership, organisational change, restructuring, multi-discipline team, budget consolidation, stakeholder breadth, reaching disengaged stakeholders

**Short**:
> As Interim VP of Cyber Security, I built a new centralised security function (bringing together people, process, and budgets from across the organisation), which removed communication barriers and improved security outcomes across the company.

**Long**:
> As Interim VP of Cyber Security, I led the formation of a new centralised cyber security function, bringing together people, process, and budgets that had previously been distributed across `[N business units / departments]`. I line-managed the resulting mixed-discipline team of `[12, confirm count?]` people, spanning Engineers, Risk Analysts, and IT governance roles. The consolidation removed communication barriers between security activities that had historically operated independently, gave the organisation a single point of accountability for security strategy, and led to better-aligned security outcomes across the technology department and the wider business. It also gave me a remit to engage proactively across the widest range of stakeholders, from junior engineers to senior execs, including parts of the organisation that hadn't historically engaged with cyber security of their own accord.

**Gaps** (medium priority):
- Where did the pre-existing teams sit before centralisation (which BUs / functions)?
- Anything measurable that improved post-centralisation (faster incident response? Better risk-decision throughput? Fewer duplicate efforts?)

**Pairs with**: [Story 9: Incident management programme](#9-incident-management-programme). Story 7 sells the org structure; Story 9 sells what got built inside it.

---

## 8. Mixed-estate monitoring / observability platform

**Tags**: observability, monitoring, SRE, platform engineering, heterogeneous systems, legacy + cloud, stakeholder coordination, adoption-by-pull

**Short**:
> Leading the Reliability Engineering team at the FT, I owned an observability platform spanning a mixed estate (Nagios for legacy on-prem, CloudWatch and Graphite/Grafana for newer systems), giving engineers a consistent user experience regardless of which underlying monitoring system was generating the signal.

**Long**:
> As Principal Engineer leading Reliability Engineering at the FT, I owned the team responsible for an observability platform built to span a mixed estate: Nagios for older on-premise systems, CloudWatch and Graphite/Grafana for newer cloud-native services, and a range of third-party tools throughout. Rather than forcing standardisation, the platform was designed to bridge between monitoring systems so engineers got a consistent user experience regardless of where the signal came from. A key design decision was the "System Code" identifier: making the easiest path to register a service the correct path, so platform adoption was pulled by engineering teams rather than pushed by mandate. I presented this work at QCon London 2020 and on InfoQ Live 2020.

**Gaps** (medium priority):
- How many services or system codes registered, roughly?
- Any measurable outcome: faster incident response, reduction in unmonitored systems, fewer "who owns this?" questions?

**Pairs with**: [Story 4: Reliability Engineering team from scratch](#4-reliability-engineering-team-from-scratch). Story 8 sells the platform; Story 4 sells the team that owns it.

---

## 9. Incident management programme

**Tags**: incident management, crisis management, cyber incident response, operational incidents, tabletop exercises, executive stakeholder communication, mission-critical systems, asset inventory, ownership and accountability

**Short**:
> At the FT I led the rollout of a new company-wide security incident management process and the work to ensure every mission-critical system was documented, monitored, backed-up, classified by importance, and had clear technical ownership. I've run live incidents across operational, cyber, and crisis-management contexts, and coordinated tabletop exercises for executives.

**Long**:
> At the FT I rolled out a new company-wide security incident management process and built the foundations underneath it. That meant org-wide initiatives to make sure every system in our estate was documented, monitored, backed-up, classified by importance (so we knew which were mission-critical), and had identified technical ownership with appropriate security protections in place. I've also run live incidents across operational, cyber, and crisis-management contexts: responsible for the processes, tooling and comms, coordinating tabletop exercises for executives, and aligning the technical incident processes with the wider enterprise crisis-management framework.

**Gaps** (medium priority):
- Any specific reference incident (anonymised) worth flagging?
- Roughly how many systems were brought into the asset / ownership / classification regime?
- Frequency of executive tabletop exercises (annual? quarterly? per-team rotation?)
- Any measurable outcome: MTTD / MTTR change, reduction in unowned systems, audit improvement?

**Pairs with**: [Story 7: Centralised cyber security function](#7-centralised-cyber-security-function-interim-vp). Story 7 sells the org structure; Story 9 sells what got built inside it.

---

## Backlog: story candidates not yet drafted

Stories worth remembering as JD-triggered material. Draft a full version when a real JD calls for one.

- **CMDB rewrites at the FT.** Luke owned two separate CMDB rewrites during his FT tenure: once in the Operational Intelligence team (Dec 2015 – Oct 2016), and again in the Reliability Engineering team (Feb 2018 – Mar 2022). A third rewrite happened in between, by a different team, while Luke was working on the Content Platform. Worth drafting if a JD specifically mentions CMDB, asset inventory, configuration management, or service catalogue work.
- **Multi-factor authentication solution.** Talked about at Varnish Summit & Awards, Los Angeles 2016. Predates the formal Cyber Security titles but is a concrete security-engineering shipping story. Worth drafting if a JD calls for hands-on identity / authentication work.
- **Kubernetes migration across 5 squads.** Mentioned in the Architect - Content role; could be a standalone story for any platform / container / orchestration role.
- **Mobile apps cloud migration (FT Integration Engineer, Jan – Nov 2015).** "Architected & developed a cloud-native zero-downtime deployment pipeline." Strong story for any role calling for hands-on cloud or DevOps origin-story material.

---

## Story-selection cheat sheet

Match the story to the JD's primary signal:

| JD signal | Best primary story | Good secondary |
|---|---|---|
| "Drives technical standards / governance" | #1 standards | #7 centralised function |
| "Manages SaaS / vendor relationships" | #2 SaaS migrations | #3 UPP (legacy replacement) |
| "Architecture / large microservice platforms" | #3 UPP | #2 SaaS migrations |
| "Reliability / SRE / DevOps" | #4 Reliability Eng | #5 FT-scale anchor |
| "Cyber security leadership" | #7 centralised function | #5 FT-scale anchor |
| "Platform team built from scratch" | #4 Reliability Eng | #7 centralised function |
| "International / cross-cultural" | #6 Tokyo | (combine with #5) |
| "Stakeholder management beyond engineering" | #1 standards | #7 centralised function |
| "Observability / monitoring at scale" | #8 mixed-estate monitoring | #4 Reliability Eng |
| "Incident management / crisis management" | #9 incident management | #7 centralised function |

Avoid stacking three stories in one paragraph; pick one or two, tell them properly.
