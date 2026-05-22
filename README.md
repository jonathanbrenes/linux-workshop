# 🐧 Linux Adventure Workshop

## You Don't Just Use Linux — You BUILD With It!

A bilingual (English / Spanish) hands-on workshop for kids to explore the Linux terminal through guided activities. No clicking, no menus — just you and the terminal.

---

## 🎯 What Students Will Learn

- Navigate folders and read files in the terminal
- Copy, move, and create files with commands
- Combine file contents with `cat` and pipes (`|`)
- Write and run their first bash script
- Search files with `grep`
- That Linux is a **builder's tool** — not just something you install

---

## 🗂️ Activities & Objectives

| # | Activity | Time | Key Commands | Learning Objectives |
|---|----------|------|-------------|---------------------|
| 1 | **🗺️ Treasure Hunt** | 8 min | `cd`, `ls`, `ls -a`, `cat`, `pwd` | Navigate folders, read files, find hidden files with `ls -a` |
| 2 | **🤖 Robot Factory** | 8 min | `cp`, `echo`, `cat`, `mv` | Copy files, create files with `echo >`, combine files with `cat >`, move and rename files |
| 3 | **🎮 Terminal Playground** | 5 min | `cowsay`, `figlet`, `echo \|`, `sl`, `cmatrix` | Have fun, learn pipes (`\|`), discover built-in commands (`date`, `cal`, `whoami`) |
| 4 | **📝 First Script** | 7 min | `nano`, `bash`, `read` | Create a file with a text editor, write a bash script, run it, use variables |
| 5 | **🔍 Command Detective** | Bonus | `grep`, `grep -r`, `cat` | Search inside files, search recursively, solve a mystery using evidence |

---

## 💻 Setup

### What You Need
- Windows laptops with **WSL Ubuntu** installed
- Run `setup.sh` on each laptop to create the adventure folders
- Run `bonus/setup-fun.sh` to install fun tools (`cowsay`, `figlet`, `sl`, `cmatrix`)

### Opening the Terminal
1. Press `Windows key`
2. Type `Ubuntu`
3. Press Enter 🎉

---

## 📁 Project Files

| File | Purpose |
|------|---------|
| [`index.html`](index.html) | Main student-facing web app (bilingual, interactive) |
| [`student-guide.html`](student-guide.html) | Printable student guide (bilingual) |
| [`instructor-guide.html`](instructor-guide.html) | Timeline, tips, and troubleshooting for instructors |
| [`welcome.html`](welcome.html) | Welcome/landing page |
| [`setup.sh`](setup.sh) | Creates adventure folders and files on each laptop |
| [`bonus/setup-fun.sh`](bonus/setup-fun.sh) | Installs fun terminal tools |
| [`install-workshop.ps1`](install-workshop.ps1) | PowerShell script for full automated setup |

---

## 👩‍🏫 For Instructors

- Students work in groups of **1–2 per laptop**
- One person types, others help — rotate every few minutes
- Follow the timeline in the [instructor guide](instructor-guide.html)
- Encourage students to figure things out before giving answers
- Celebrate mistakes — they're part of learning

---

## 🌐 Language Support

The workshop supports **English** and **Costa Rican Spanish** (voseo). Students can toggle the language from the web app. All guides, activities, and file contents are fully bilingual.

---

## 🧠 Remember

> **The terminal is not scary. It's your superpower.**

Linux runs phones, servers, robots, and spaceships. Today, it runs YOUR adventure.
