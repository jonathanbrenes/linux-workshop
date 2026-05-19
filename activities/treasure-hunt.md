# 🗺️ Treasure Hunt

## The Story

You are an explorer. You've just arrived at a mysterious island. Somewhere on this island, a treasure is hidden. Your only tool? The terminal.

Nobody is going to tell you where the treasure is. You have to **find it yourself**.

---

## Getting Started

Open your terminal and go to the treasure hunt:

```bash
cd ~/linux-adventure/treasure-hunt
```

Now look around. What do you see?

```bash
ls
```

> **💡 Tip:** Notice the colors! Names in **blue** are **folders** you can enter with `cd`. Names in **white** are **files** you can read with `cat`.

There are folders and files here. Your adventure begins with `start-here.txt`. Read it:

```bash
cat start-here.txt
```

---

## Your Mission

1. Read the first clue
2. Follow the clues from folder to folder
3. Find the **treasure**

### Rules
- Read every file you find — some are clues, some are traps!
- If you get lost, type `pwd` to see where you are
- To go back, type `cd ..`
- The treasure might be **hidden**... 👀

---

## Commands You'll Need

| Command | What It Does |
|---------|-------------|
| `ls` | See what's in the current folder |
| `ls -a` | See EVERYTHING — even hidden files! |
| `cd foldername` | Go into a folder |
| `cd ..` | Go back one folder |
| `cat filename` | Read a file |
| `pwd` | See where you are right now |

---

## Go!

Start exploring. Read the clues. Follow the trail.

Can you find the treasure? 🏆

---

---

## 🔒 Instructor Hints (Don't show students!)

<details>
<summary>Click to reveal the solution path</summary>

### The Clue Trail

1. **Start:** `cat start-here.txt` → tells them to explore
2. **Clue 1:** `cd cave` → `cat clue1.txt` → points to the forest/old-tree
3. **Clue 2:** `cd ../forest/old-tree` → `cat clue2.txt` → points to mountain/secret-peak
4. **Clue 3:** `cd ../../mountain/secret-peak` → `cat clue3.txt` → points to beach/hidden-cove
5. **Treasure:** `cd ../../beach/hidden-cove` → `ls -a` → `cat .treasure`

### Key Teaching Moment
The treasure is a **hidden file** (`.treasure`). Students must use `ls -a` instead of just `ls` to see it. This is the "aha!" moment.

### Bonus
There's also a `.secret-star` hidden in `forest/`. Students who explore extra will find it!

### Common Student Mistakes
- Forgetting to use `cd ..` to go back before going to a new folder
- Not using `ls -a` (they'll see an empty-looking folder and think it's a dead end)
- Typing folder names wrong (remind them: Tab key auto-completes!)

</details>
