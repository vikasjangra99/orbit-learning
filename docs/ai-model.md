# AI Model And Learning Intelligence

## Current truth

Orbit Learning does not contain a trained machine-learning model yet. The current recommendation cards, percentages, insights, and practice content are illustrative foundation behavior. They must not be presented as measured learner mastery.

The current release deliberately uses deterministic UI behavior so the product and account workflow can be tested without inventing a training dataset or claiming educational effectiveness.

## Planned model path

The first real learning engine should begin with interpretable, non-neural methods:

1. Skill graph with explicit prerequisites.
2. Attempt events containing correctness, confidence, hint usage, response time, item version, and timestamps.
3. Spaced-review scheduler.
4. Bayesian Knowledge Tracing or another evaluated mastery estimator.
5. Deterministic recommendation policy with a stored reason and model version.

A contextual bandit may later choose activity types after enough consented interaction data exists. Reinforcement learning is not justified before rewards, safety constraints, and offline evaluation are defined.

## Data collection

No external dataset is required to start the learning engine. Content is authored or openly licensed and versioned. Synthetic learner traces can test edge cases but cannot prove that the model improves learning. Real pilot events require consent, minimization, deletion, anonymization, and a retention policy.

## Training location

There is no training job or model artifact in the current repository. A future training pipeline should run as an explicit versioned job in a controlled cloud environment, produce an evaluation report and model artifact, and register the model version before it can affect recommendations. The runtime should be able to fall back to the prior approved model.

## Generative AI boundary

An LLM may later generate explanations, hints, or reviewed content drafts. It must not silently decide mastery, infer protected or sensitive attributes, or override the deterministic learning policy. External prompts must exclude unnecessary learner history.

## Release gate

No claim that Orbit is adaptive AI is allowed until a model version has:

- Separate train, validation, and evaluation data.
- Baseline comparison against random and fixed progression.
- Delayed-retention or transfer evaluation.
- Error analysis and known limitations.
- Reproducible configuration and artifact hash.
- Human review for educational and safety impact.
