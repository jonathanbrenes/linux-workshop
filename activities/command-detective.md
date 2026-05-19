# 🔍 Command Detective (Bonus Challenge)

## The Case

Someone stole the last cookie from the jar. There are witnesses and suspects. Your job: search through the evidence and figure out **who did it**.

---

## Getting Started

Go to the detective folder:

```bash
cd ~/linux-adventure/detective
```

Read the case file:

```bash
cat case-file.txt
```

---

## Investigate the Evidence

Look at what you have:

```bash
ls evidence/
ls suspects/
```

### Read the witness statements

```bash
cat evidence/witness1.txt
cat evidence/witness2.txt
cat evidence/witness3.txt
cat evidence/witness4.txt
```

### Read the suspect files

```bash
cat suspects/alex.txt
cat suspects/sam.txt
cat suspects/jordan.txt
cat suspects/riley.txt
```

---

## Use `grep` — Your Secret Weapon

Instead of reading every file one by one, you can **search** for clues!

### Search for who likes cookies:

```bash
grep "cookies" suspects/*
```

### Search for who was in the kitchen:

```bash
grep "kitchen" suspects/*
```

### Search for mentions of specific evidence:

```bash
grep "chocolate" evidence/*
```

### Search EVERYWHERE at once:

```bash
grep -r "cookie" ~/linux-adventure/detective/
```

---

## Solve the Case!

Based on the evidence, answer these questions:

1. Who was in the kitchen?
2. Who likes cookies?
3. Who had chocolate on their shirt?
4. **Who stole the cookie?**

---

## New Power: `grep`

| Command | What It Does |
|---------|-------------|
| `grep "word" file` | Search for a word in one file |
| `grep "word" folder/*` | Search all files in a folder |
| `grep -r "word" folder/` | Search everything, including subfolders |
| `grep -i "word" file` | Search but ignore uppercase/lowercase |

`grep` is one of the most powerful commands in Linux. Real hackers and engineers use it every day!

---

---

## 🔒 Instructor Notes (Don't show students!)

<details>
<summary>Click to reveal the answer</summary>

### The Answer: **Alex** stole the cookie!

Evidence:
- Alex was in the **kitchen** (`suspects/alex.txt`)
- Alex's favorite food is **cookies** (`suspects/alex.txt`)
- Witness 3 found **chocolate on Alex's shirt** (`evidence/witness3.txt`)
- Riley is a red herring — also likes cookies and was in the kitchen, but no physical evidence

### Teaching Points
- `grep` is incredibly useful for searching through lots of data quickly
- It's much faster than reading every file manually
- This is how real security analysts and developers work

</details>
