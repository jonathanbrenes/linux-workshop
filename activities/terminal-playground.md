# 🎮 Terminal Playground

## The terminal isn't just for work — it can be FUN!

Go to the playground:

```bash
cd ~/linux-adventure/playground
```

Try these commands and see what happens! 🎉

---

## 🐄 Cowsay — Make a Cow Talk!

```bash
cowsay "I love Linux!"
```

A cow will say whatever you type! Try different messages:

```bash
cowsay "Hello World"
cowsay "I am a hacker"
cowsay "Mooooo"
```

Want a different animal? Try:

```bash
cowsay -f dragon "I breathe fire"
cowsay -f tux "I am the Linux penguin"
```

See all available animals:

```bash
cowsay -l
```

---

## 🔮 Fortune — Get a Random Quote

```bash
fortune
```

Run it again — you get a different one every time!

Combine it with cowsay:

```bash
fortune | cowsay
```

Now a cow is saying a random wise thing. 🐄✨

---

## 🚂 SL — Oops, You Typed It Wrong!

Ever type `sl` instead of `ls` by accident?

```bash
sl
```

Watch what happens! 🚂

(Just wait for it to finish, or press `Ctrl+C` to stop)

---

## 💻 CMatrix — Become The Matrix

```bash
cmatrix
```

You are now in The Matrix. Green code rains down your screen.

Press `q` to quit.

---

## 🕐 Built-In Fun (No Install Needed)

These work on any Linux system:

### What's today's date?
```bash
date
```

### See a calendar
```bash
cal
```

### Who are you?
```bash
whoami
```

### How long has the computer been on?
```bash
uptime
```

### Make the terminal say something
```bash
echo "I am a terminal wizard!"
```

### Make it say something in BIG letters (if figlet is installed)
```bash
figlet "HELLO"
```

---

## 🎨 Bonus: Combine Commands

Try piping commands together with `|`:

```bash
fortune | cowsay
echo "I am awesome" | cowsay -f tux
```

The `|` (pipe) takes the output of one command and sends it to the next one!

---

## ⚠️ Note for Instructors

These fun commands need to be installed first! Run:

```bash
bash bonus/setup-fun.sh
```

If the tools aren't installed, students can still use the built-in commands (`date`, `cal`, `whoami`, `echo`, `uptime`).
