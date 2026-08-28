-- Orbit Learning cloud schema
-- Run this in Supabase SQL Editor before publishing the frontend.

create table if not exists public.learner_profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  display_name text not null check (char_length(display_name) between 1 and 80),
  domains text[] not null default '{}',
  goal text not null default 'Explore widely',
  preferences jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.learning_attempts (
  id uuid primary key default gen_random_uuid(),
  learner_id uuid not null references public.learner_profiles(id) on delete cascade,
  item_id text not null,
  item_version text not null,
  correctness boolean not null,
  confidence smallint check (confidence between 1 and 3),
  hint_used boolean not null default false,
  response_time_ms integer check (response_time_ms is null or response_time_ms >= 0),
  created_at timestamptz not null default now()
);

alter table public.learner_profiles enable row level security;
alter table public.learning_attempts enable row level security;

create policy "learners can read their profile" on public.learner_profiles for select using (auth.uid() = id);
create policy "learners can create their profile" on public.learner_profiles for insert with check (auth.uid() = id);
create policy "learners can update their profile" on public.learner_profiles for update using (auth.uid() = id) with check (auth.uid() = id);
drop policy if exists "learners can delete their profile" on public.learner_profiles;
create policy "learners can delete their profile" on public.learner_profiles for delete using (auth.uid() = id);

create policy "learners can read their attempts" on public.learning_attempts for select using (auth.uid() = learner_id);
create policy "learners can create their attempts" on public.learning_attempts for insert with check (auth.uid() = learner_id);
create policy "learners can delete their attempts" on public.learning_attempts for delete using (auth.uid() = learner_id);

create index if not exists learning_attempts_learner_id_idx on public.learning_attempts(learner_id);
