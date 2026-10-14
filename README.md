# Group 15 – Full Stack Recipe App

A full-stack recipe app: a **React Native (Expo) mobile app** backed by a **Node.js / Express REST API** and a **Neon (serverless PostgreSQL)** database.
Browse recipes by category, search, view recipe details, and save your favorites to your account.

## Features

- Sign-up, sign-in and email verification (Clerk)
- Browse recipes and filter by category
- Search with debounced input
- Recipe detail screen
- Save and view favorite recipes
- Database migrations with Drizzle ORM
- Scheduled keep-alive job (cron) so a free-tier host doesn't put the API to sleep

## Tech Stack

| Layer    | Tools |
| -------- | ----- |
| Mobile   | React Native 0.86, Expo SDK 57, Expo Router, Clerk (`@clerk/expo`), Reanimated |
| Backend  | Node.js (ES modules), Express 5, CORS, `cron`, `dotenv` |
| Database | Neon serverless PostgreSQL, Drizzle ORM + Drizzle Kit |
| Tooling  | npm, Make, GitHub Actions |

## Project Structure

```
.
├── backend/                # REST API
│   ├── drizzle.config.js   # Drizzle Kit configuration
│   └── src/
│       ├── config/         # env.js, db.js, cron.js
│       ├── db/             # schema.js + SQL migrations
│       └── server.js       # app entry point
├── mobile/                 # Expo app
│   ├── app/                # screens: (auth), (tabs), recipe/[id]
│   ├── assets/             # images and styles
│   ├── components/         # reusable UI components
│   ├── constants/          # api.js (API URL), colors.js
│   ├── hooks/              # custom hooks (useDebounce)
│   └── services/           # mealAPI.js (recipe data client)
├── .github/workflows/      # CI
├── Makefile                # common dev commands
├── LICENSE
└── README.md
```

## Prerequisites

- [Node.js](https://nodejs.org/) 20.19 or newer (22 LTS recommended) and npm
- A [Neon](https://neon.tech) project (free tier works) for the database
- A [Clerk](https://clerk.com) application for authentication
- [Expo Go](https://expo.dev/go) on your phone, or an iOS simulator / Android emulator
- `make` (preinstalled on macOS and most Linux distros)

## Getting Started

### 1. Clone and install

```bash
git clone https://github.com/mrrdxn/Group-15-Full-Stack-Recipe.git
cd Group-15-Full-Stack-Recipe
make install
```

### 2. Configure environment variables

**Backend**

```bash
cp backend/.env.example backend/.env
```

| Variable       | Description | Default |
| -------------- | ----------- | ------- |
| `PORT`         | Port the API listens on | `5001` |
| `DATABASE_URL` | Neon PostgreSQL connection string | _required_ |
| `NODE_ENV`     | `development` or `production` | `development` |
| `API_URL`      | Optional. Public URL of the deployed API; only needed if `src/config/cron.js` reads it | _unset_ |

**Mobile**

```bash
cp mobile/.env.example mobile/.env
```

pk_test_bmF0aW9uYWwtY2F0dGxlLTg3MzIuY2xlcmsuYWNjb3VudHMuZGV2JA

### 3. Set up the database

```bash
make db-migrate
```

### 4. Run the app

In two terminals:

```bash
make backend   # API with auto-reload (nodemon)
make mobile    # Expo dev server, then scan the QR code with Expo Go
```

## Make Commands

Run `make help` to list everything.

| Command            | What it does |
| ------------------ | ------------ |
| `make install`     | Install dependencies for backend and mobile |
| `make backend`     | Run the API in development mode (`npm run dev`) |
| `make start`       | Run the API in production mode (`npm start`) |
| `make mobile`      | Start the Expo dev server |
| `make db-generate` | Generate a new migration from schema changes |
| `make db-migrate`  | Apply migrations to the database |
| `make clean`       | Remove `node_modules` and Expo caches |

## Deployment

- **Backend:** deploy `backend/` to any Node host (for example Render). Root directory `backend`, build command `npm install`, start command `npm start`. Add `DATABASE_URL` and `NODE_ENV=production` as environment variables.
- **Mobile:** set the deployed API URL in `mobile/constants/api.js`, then build with [EAS Build](https://docs.expo.dev/build/introduction/).

## Team

| Name | Role | GitHub |
| ---- | ---- | ------ |
| Mensah Stephen Tetteh (11165084)_ |Architecture and Context Lead| [@mrrdxn](https://github.com/mrrdxn) |
| Richard Nana Kwame Boham (22378694)| Product/Client Manager & Documentation/Evidence Lead| [@Chronomystical]
| Emmanuel Niah (22273456)| QA / Validation Lead 
| Kevin Owusu Oduro (22397341)| DevOps / Release Lead
| Joseph Osei Owusu (22389021) | Implementation Lead
| Agnes Amponsah Owusuaa (22242223)| UX / Research Lead| 
| Kenneth Godson Setorglo (22497350)| Implementation Lead| [@kenismy1]



## License

Released under the [MIT License](LICENSE).
