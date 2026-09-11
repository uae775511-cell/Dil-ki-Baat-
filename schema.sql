create extension if not exists "pgcrypto";

create table if not exists profiles (
 id uuid primary key references auth.users(id) on delete cascade,
 display_name text not null,
 gender text check (gender in ('male','female','other')),
 date_of_birth date,
 bio text,
 city text,
 photo_url text,
 verified boolean default false,
 active boolean default true,
 created_at timestamptz default now()
);

create table if not exists likes (
 id uuid primary key default gen_random_uuid(),
 from_user uuid references profiles(id) on delete cascade,
 to_user uuid references profiles(id) on delete cascade,
 created_at timestamptz default now(),
 unique(from_user,to_user)
);

create table if not exists conversations (
 id uuid primary key default gen_random_uuid(),
 user_a uuid references profiles(id) on delete cascade,
 user_b uuid references profiles(id) on delete cascade,
 created_at timestamptz default now(),
 unique(user_a,user_b)
);

create table if not exists messages (
 id uuid primary key default gen_random_uuid(),
 conversation_id uuid references conversations(id) on delete cascade,
 sender_id uuid references profiles(id) on delete cascade,
 body text not null,
 created_at timestamptz default now(),
 read_at timestamptz
);

create table if not exists blocks (
 blocker_id uuid references profiles(id) on delete cascade,
 blocked_id uuid references profiles(id) on delete cascade,
 created_at timestamptz default now(),
 primary key(blocker_id,blocked_id)
);

create table if not exists reports (
 id uuid primary key default gen_random_uuid(),
 reporter_id uuid references profiles(id) on delete cascade,
 reported_user_id uuid references profiles(id) on delete cascade,
 reason text not null,
 details text,
 status text default 'open',
 created_at timestamptz default now()
);

create table if not exists subscriptions (
 id uuid primary key default gen_random_uuid(),
 user_id uuid references profiles(id) on delete cascade,
 provider text,
 provider_customer_id text,
 provider_subscription_id text,
 status text,
 current_period_end timestamptz,
 created_at timestamptz default now()
);

create table if not exists site_settings (
 key text primary key,
 value jsonb not null,
 updated_at timestamptz default now()
);

-- Enable realtime for messages in Supabase dashboard:
-- Database > Replication > add messages table.
