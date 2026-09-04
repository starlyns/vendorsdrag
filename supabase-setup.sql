-- Victory Floor Plan — one-time database setup.
-- Paste this whole file into the Supabase SQL Editor and press Run.

create table if not exists public.assignments (
  vendor_id  text primary key,
  name       text not null,
  booth      text,
  slot       smallint not null default 0,
  custom     boolean not null default false,
  updated_at timestamptz not null default now()
);

alter table public.assignments enable row level security;

-- Anyone with the page link may place and move vendors. This is the whole
-- point of the board, but it does mean the link is the only gate: treat it
-- like a shared document link and give it out accordingly.
drop policy if exists "read assignments"   on public.assignments;
drop policy if exists "insert assignments" on public.assignments;
drop policy if exists "update assignments" on public.assignments;
drop policy if exists "delete assignments" on public.assignments;

create policy "read assignments"   on public.assignments for select using (true);
create policy "insert assignments" on public.assignments for insert with check (true);
create policy "update assignments" on public.assignments for update using (true) with check (true);
create policy "delete assignments" on public.assignments for delete using (true);

-- Push changes to every open browser instantly. Safe to re-run: if it errors
-- with "already member of publication", the table is already set up.
alter publication supabase_realtime add table public.assignments;
