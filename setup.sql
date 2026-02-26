-- ============================================
-- 体重打卡应用 - Supabase 数据库建表脚本
-- 在 Supabase 控制台 → SQL Editor 中执行
-- ============================================

-- 1. 成员表
create table members (
  id uuid default gen_random_uuid() primary key,
  nickname text not null,
  group_code text not null,
  created_at timestamptz default now()
);

-- 2. 体重记录表
create table weight_logs (
  id uuid default gen_random_uuid() primary key,
  member_id uuid references members(id) on delete cascade not null,
  weight numeric(5,1) not null check (weight > 0 and weight < 500),
  log_date date not null default current_date,
  created_at timestamptz default now(),
  unique(member_id, log_date)
);

-- 3. 索引
create index idx_members_group on members(group_code);
create index idx_logs_member on weight_logs(member_id);
create index idx_logs_date on weight_logs(log_date);

-- 4. 启用 RLS 并设置开放策略（匿名访问）
alter table members enable row level security;
alter table weight_logs enable row level security;

create policy "Allow all access to members"
  on members for all
  using (true)
  with check (true);

create policy "Allow all access to weight_logs"
  on weight_logs for all
  using (true)
  with check (true);
