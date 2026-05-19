# 👩‍🏫 Instructor Guide

## Workshop at a Glance

| Detail | Info |
|--------|------|
| Duration | 30 minutes |
| Students | 24–37 (ages 11–13) |
| Laptops | 15 |
| Groups | 2–3 students per laptop |
| Setup | Windows + WSL Ubuntu |

---

## ⏱️ Timeline (30 Minutes)

| Time | Duration | Activity | Notes |
|------|----------|----------|-------|
| 0:00 | 2 min | **Welcome & Intro** | Open terminals, quick pep talk |
| 0:02 | 8 min | **Treasure Hunt** | Navigation: `ls`, `cd`, `cat` |
| 0:10 | 8 min | **Robot Factory** | File creation: `touch`, `mv`, `wc` |
| 0:18 | 5 min | **Terminal Playground** | Fun commands: `cowsay`, `sl`, etc. |
| 0:23 | 7 min | **First Script** | Write and run a bash script |
| 0:30 | — | **Wrap-up** | Quick celebration, key message |

> **Command Detective** is a bonus activity for groups that finish early.

---

## 🚀 Before the Workshop

### On Every Laptop

1. Open **Ubuntu** (from the Start menu)
2. Run the setup script:
   ```bash
   cd /path/to/linux-workshop
   bash setup.sh
   ```
3. Verify setup worked:
   ```bash
   ls ~/linux-adventure/
   ```
   You should see: `treasure-hunt/`, `robot-factory/`, `detective/`, `playground/`, `my-scripts/`

4. (Optional) Install fun tools:
   ```bash
   bash bonus/setup-fun.sh
   ```

### Print/Display

- Print the **cheatsheet** (one per group, or display on projector)
- Have this guide open on your device

---

## 🎤 Welcome Script (2 minutes)

Keep it SHORT and energetic. Something like:

> "Today, you're not just using a computer. You're going to **control** it. No mouse. No menus. Just you, the terminal, and your brain. Linux runs servers, phones, robots, even spaceships. And today — it runs YOUR adventure. Let's go!"

Then:
1. Make sure every group has Ubuntu open
2. Have them type `cd ~/linux-adventure` and press Enter
3. Start Activity 1

---

## 📋 Activity-by-Activity Tips

### 1. Treasure Hunt (8 min)

- **Goal:** Navigate folders and find hidden clues
- **Key commands:** `ls`, `ls -a`, `cd`, `cat`
- **Big reveal:** The treasure is a hidden file (`.treasure`) — they need `ls -a` to see it!
- **Don't** give away the hidden file trick right away — let them struggle for 1-2 minutes
- If a group is stuck after 2 minutes, hint: "Have you tried seeing ALL the files?"

### 2. Robot Factory (8 min)

- **Goal:** Create files, rename them, count them
- **Key commands:** `touch`, `ls`, `mv`, `wc -l`
- Students get creative with robot part names — encourage it!
- Challenge fast groups: "Can you build a robot with 10 parts?"

### 3. Terminal Playground (5 min)

- **Goal:** Have FUN, see the terminal can be playful
- **Requires:** `cowsay`, `sl`, `fortune`, `cmatrix` (install via `bonus/setup-fun.sh`)
- If tools aren't installed, students can still try `echo`, `cal`, `date`, `whoami`
- `cmatrix` is a crowd favorite — let them enjoy it! Press `q` to quit

### 4. First Script (7 min)

- **Goal:** Write and run a bash script in nano
- **Key moment:** When they run their script and it WORKS — celebrate it!
- Walk them through nano: type, then `Ctrl+O` to save, `Enter`, `Ctrl+X` to exit
- Emphasize: "You just wrote a PROGRAM. You are now a programmer."

### 5. Command Detective (Bonus)

- Only for groups that finish everything early
- Uses `grep` to search through evidence files
- Great for curious/advanced students

---

## 🛠️ Troubleshooting

| Problem | Solution |
|---------|----------|
| Ubuntu won't open | Try: Start menu → search "Ubuntu" |
| "Permission denied" | Try adding `bash` before the script name |
| "command not found" for fun tools | Run `bash bonus/setup-fun.sh` first |
| Student deleted files by accident | Re-run `bash setup.sh` — it resets everything |
| nano is confusing | Walk them through: type → `Ctrl+O` → Enter → `Ctrl+X` |
| Terminal looks frozen | They might be in a program — try `Ctrl+C` or `q` |
| "No such file or directory" | Check spelling, use `ls` to see what's available |

---

## 👥 Group Management

### Rotation Rule
- Every activity, a **different person** types
- Other group members help by reading instructions and suggesting commands
- No one should type for more than one activity in a row

### Energy Management
- If energy drops: switch to Terminal Playground (fun commands wake everyone up)
- If groups are racing ahead: give them the Command Detective bonus
- If groups fall behind: skip Terminal Playground and go to First Script

### Noise Management
- Terminal excitement is GOOD — students should be reacting to what they see
- Only redirect if groups are distracting each other
- "Indoor hacker voices" is a good phrase if needed

---

## 🎯 When to Help vs. When to Observe

| Situation | Action |
|-----------|--------|
| Student is thinking and trying commands | **Observe** — let them figure it out |
| Student has been stuck for 2+ minutes | **Hint** — don't give the answer, give a direction |
| Student typed something wrong and got an error | **Encourage** — "Errors are normal! Read the message." |
| Student accidentally broke something | **Help** — re-run `setup.sh` |
| Student is excited and wants to explore | **Encourage** — "Try it! See what happens!" |
| Student is afraid to type | **Reassure** — "You can't break anything. Try it!" |

---

## 🏁 Wrap-Up Script (1 minute)

> "You just navigated a Linux terminal, created files, searched through evidence, and WROTE YOUR OWN PROGRAM. That's what builders do. Linux runs the world — and now you know how to use it. Keep exploring. Keep building. 🐧"

---

## 📦 Key Message to Leave With

**Linux is not just used. Linux is controlled. Linux is built with.**
