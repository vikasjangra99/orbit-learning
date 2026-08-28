-- Orbit Learning versioned knowledge base
-- Run after the base schema in supabase/schema.sql.
-- Content wording is original; legal items are educational only, not legal advice.

create table if not exists public.learning_items (
  id text primary key,
  version text not null,
  domain text not null,
  subject text not null,
  topic text not null,
  skill text not null,
  prompt text not null,
  options jsonb not null,
  correct_option text not null,
  explanation text not null,
  hint text not null,
  misconception text,
  difficulty smallint not null check (difficulty between 1 and 5),
  prerequisites text[] not null default '{}',
  source_name text not null,
  source_url text,
  provenance text not null,
  review_status text not null check (review_status in ('draft','reviewed','approved')) default 'draft',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

alter table public.learning_items enable row level security;
drop policy if exists "approved learning items are public" on public.learning_items;
create policy "approved learning items are public" on public.learning_items for select using (review_status = 'approved');

create index if not exists learning_items_domain_status_idx on public.learning_items(domain, review_status);

insert into public.learning_items (id,version,domain,subject,topic,skill,prompt,options,correct_option,explanation,hint,misconception,difficulty,prerequisites,source_name,source_url,provenance,review_status) values
('math.percent.change.001','2026-08-28.1','Mathematics','Mathematics','Percentages','Percentage change','A price changes from 80 to 100. What is the percentage increase?','["20%","25%","30%","80%"]','25%','The increase is 20. Divide the increase by the original value: 20 / 80 = 0.25, or 25%.','Compare the change with the original value, not the new value.','Using the new value as the denominator gives 20%.',2,'{}','Original Orbit item',null,'Original wording; reviewed arithmetic; separate evaluation item required','approved'),
('math.ratio.001','2026-08-28.1','Mathematics','Mathematics','Ratios','Equivalent ratios','A recipe uses 2 cups of flour for 5 people. How much flour is needed for 10 people?','["2 cups","3 cups","4 cups","5 cups"]','4 cups','Ten people is twice five people, so the flour amount also doubles: 2 x 2 = 4 cups.','Find how many times the number of people changes.','Adding 5 cups instead of multiplying by 2 loses the ratio.',1,'{}','Original Orbit item',null,'Original wording; reviewed arithmetic; separate evaluation item required','approved'),
('math.fraction.001','2026-08-28.1','Mathematics','Mathematics','Fractions','Fraction comparison','Which fraction is greater: 3/4 or 2/3?','["3/4","2/3","They are equal","Not enough information"]','3/4','Cross-multiplication gives 3 x 3 = 9 and 2 x 4 = 8, so 3/4 is greater.','Compare 3 x 3 with 2 x 4.','Comparing only the denominators reverses the result.',2,'{}','Original Orbit item',null,'Original wording; reviewed arithmetic; separate evaluation item required','approved'),
('math.linear.001','2026-08-28.1','Mathematics','Mathematics','Algebra','One-step equations','If x + 7 = 15, what is x?','["7","8","22","105"]','8','Subtract 7 from both sides: x = 15 - 7 = 8.','Undo the addition by subtracting 7.','Adding 7 again moves farther from the solution.',1,'{}','Original Orbit item',null,'Original wording; reviewed arithmetic; separate evaluation item required','approved'),
('law.contract.offer.001','2026-08-28.1','Law','Indian Contract Law','Essentials of a contract','Offer and acceptance','In basic contract analysis, which sequence best describes the starting point for agreement?','["Offer followed by acceptance","Payment followed by advertising","Silence followed by delivery","Dispute followed by negotiation"]','Offer followed by acceptance','An offer is a proposal capable of being accepted; acceptance is assent to the proposal. The exact legal effect depends on the facts and applicable law.','Look for a proposal followed by clear assent.','Treating an advertisement as automatically being an accepted offer can oversimplify the facts.',2,'{}','The Indian Contract Act, 1872','https://www.indiacode.nic.in/','Original educational wording; concepts checked against the official India Code source; not legal advice','approved'),
('law.contract.consideration.001','2026-08-28.1','Law','Indian Contract Law','Essentials of a contract','Consideration','In a basic contract-law study question, consideration is best described as:','["Something of value exchanged in support of a promise","A judge opinion after a dispute","A person signing as a witness","A public advertisement"]','Something of value exchanged in support of a promise','Consideration is studied as an element connected to a promise or agreement. The legal rule has statutory wording and exceptions, so apply the statute and facts rather than this summary alone.','Ask what is exchanged in support of the promise.','Confusing consideration with the reason a court gives for its judgment.',2,'{}','The Indian Contract Act, 1872','https://www.indiacode.nic.in/','Original educational wording; concepts checked against the official India Code source; not legal advice','approved'),
('law.contract.capacity.001','2026-08-28.1','Law','Indian Contract Law','Essentials of a contract','Capacity to contract','Why does capacity matter before relying on an agreement?','["The law may limit who can make an enforceable contract","It determines the font used in the contract","It replaces the need for consent","It guarantees every promise is performed"]','The law may limit who can make an enforceable contract','Capacity concerns whether the parties are legally competent to contract. A real conclusion requires the applicable statute and facts.','Separate legal competence from whether a promise was performed.','Assuming that signing alone resolves every capacity question.',2,'{}','The Indian Contract Act, 1872','https://www.indiacode.nic.in/','Original educational wording; concepts checked against the official India Code source; not legal advice','approved'),
('law.contract.consent.001','2026-08-28.1','Law','Indian Contract Law','Essentials of a contract','Free consent','Which question belongs in a basic free-consent analysis?','["Was consent affected by factors recognized by contract law?","Was the document printed in color?","Did the parties use the same phone model?","Was the agreement discussed on a holiday?"]','Was consent affected by factors recognized by contract law?','Contract analysis asks whether consent was freely given under the applicable legal rules. Do not infer the legal result without examining the facts.','Focus on how agreement was obtained.','Treating any disagreement after signing as proof that consent was not free.',3,'{}','The Indian Contract Act, 1872','https://www.indiacode.nic.in/','Original educational wording; concepts checked against the official India Code source; not legal advice','approved')
on conflict (id) do update set version=excluded.version,options=excluded.options,correct_option=excluded.correct_option,explanation=excluded.explanation,hint=excluded.hint,misconception=excluded.misconception,difficulty=excluded.difficulty,prerequisites=excluded.prerequisites,review_status=excluded.review_status,updated_at=now();
