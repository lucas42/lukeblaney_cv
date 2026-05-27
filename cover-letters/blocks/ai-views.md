# AI views

Reusable opinion content for textarea questions asking Luke's *views* on AI in engineering, as distinct from his *evidence* (see `evidence-stories.md`).  Used for questions like *"What are the biggest challenges you see in AI driven engineering practices?"* or *"What's your perspective on AI tooling in engineering workflows?"*

**Rule for drafting** (the lesson from previous sessions): lead with a specific observation Luke is actually grappling with; reach for concrete engineering primitives over abstract concept-names; tie to his existing craft tradition (platform engineering) rather than treating AI as generic discourse.  Shorter and sharper beats longer and surveying.

---

## Block: complexity-not-being-managed + platform-engineering-primitives

**Tags**: opinion-textarea, AI in engineering, agentic coding agents, complexity management, platform-engineering framing

**Verbatim** (Luke's own drafting from a previous Principal-level application, ~155 words):

> The big high level challenge in AI engineering that I'm currently grappling with is the tendency to keep adding complexity to a system, rather than looking for ways to simplifying things.  A good engineering team will instinctively reach for templating, abstractions and other automation when tasks become too repetitive.  LLMs, on the other hand, will continue copy & pasting very similar chunks of code indefinitely, unless explicitly told not to.
>
> A lot of the other challenges I've encountered with LLM coding agents have been solvable by applying platform engineering approaches.  I've found things like Configuration Management, least-privilege permissions, instructions in source control and Architectural Decision Records are all approaches which make coding agents more effective and mitigate some of their inherent risks.  If done well, these guardrails benefit both humans and AI agents who are interacting with the system.
>
> I've written in more detail about some of these challenges: https://blog.lukeblaney.co.uk/posts/guardrails-for-ai-coding-agents/

**When to use**:

- Opinion-style textarea questions on AI / agentic coding agents / AI in engineering practices
- When the form gives ~3–5 rows of textarea space (~150–250 words)
- When Luke wants the answer to read as his own current thinking rather than a textbook survey

**Adaptations**:

- For tighter word budgets, lead with the first paragraph only and trim the platform-engineering paragraph to one sentence.
- For non-coding-agent AI questions (e.g. AI safety, AI ethics, model performance), the complexity-not-managed observation doesn't transfer — pick a different specific observation Luke's currently grappling with.

---

## Backlog: opinion-textarea topics not yet drafted

Topics worth a library block when a real JD asks the question:

- *"What's your view on engineering culture in a remote / hybrid team?"* — could draw on the FT reorg / Tokyo secondment / cross-cultural experience
- *"How do you approach technical debt?"* — could draw on the legacy-replacement programme at UPP and the SaaS migrations
- *"What does 'engineering excellence' mean to you?"* — could draw on the consultative-architect / engineers-as-customers framing
