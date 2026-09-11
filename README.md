# Dil Ki Baat ❤️

A production-oriented dating-site starter built with Next.js, TypeScript, Tailwind, Supabase, Stripe and Twilio Verify.

## Included
- Landing page
- Registration/login UI
- Phone OTP verification flow using Twilio Verify
- Supabase-ready user/profile schema
- Private 1-to-1 chat schema and realtime-ready architecture
- Stripe checkout endpoint for memberships
- Protected admin area starter
- Profile/photo/report/block data model
- Environment variable template

## Run
1. `npm install`
2. Copy `.env.example` to `.env.local`
3. Create a Supabase project and run `supabase/schema.sql`
4. Configure Twilio Verify and Stripe credentials
5. `npm run dev`

This is a starter/MVP codebase. Before accepting real payments or launching publicly, add production security review, legal/privacy pages, moderation workflows, rate limits, abuse prevention, webhook signature verification, logging, backups, and age/identity controls.
