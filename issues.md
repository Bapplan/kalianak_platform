# Issues & edits to project

I need you to make a new "part" of the platform that goes in the member_app.
First make sure to make a GIT sub repo. and add to the platform (.gitmodules), like the other sub repos
The full develop plan and description is in @member_app.md.
Because it is a big and important side project, I need you to make your own step by step develop plan, that fits you and were you can mark the steps done, after you finish them, etc.
Also update all files necessary to make `member_app` part of the platform, for example: @README.md, @GEMINI.md, etc.

I successfully ran the makemigrations and migrate users, etc. and before we continue, you should navigate http://localhost:5173/menu and http://localhost:5173/history and http://localhost:5173/profile and check the console... and check backend logs (docker)

yes continue with Phase 5

From now on I want some more structure in my life, and because I am in front of the computer working all the time is perfect that we start to have some structure in our daily develop workflow, so lets clarify
A Session is a group of tasks (normally regarding the same topic)
And end of every session doesn't matter how small, we will do the `Documentation & Dev Logs` in the `DEVLOG.md` and a `Agent Instructions for Git`, so end of a session result in git add, commit and push, for all sub repos and the main Monorepo, plus a Session documentation in `DEVLOG.md`
So what we need for that is a skill that first run `Agent Instructions for Git` with whats we been working on in the "session" and after `Documentation & Dev Logs`, etc.
Because all sessions has a plan what needs to be done, etc. and if we have to finish the session early for some reason, the start of the session title should look loke like this `## 🔴 Session:` instead of this `## 🟢 Session:`  
So when I say something like, "lets end this session", you can ask me first if we should give the session a "🟢" or a "🔴", etc.

So by making this skill we clean up the @GEMINI.md file from stuff not needed all the time, so use `Documentation & Dev Logs` and `Git Configuration & Monorepo Structure` for the skill, etc. 

Just make the files and put in this dir. and I can move the to `/Users/andershedborg/.gemini/skills` dir. later, if you not have access to that dir.