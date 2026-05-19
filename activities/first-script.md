# 📝 First Script — Write Your First Program!

## What's a Script?

A script is a file that tells the computer what to do, step by step. When you write a script, you are **programming**.

Today, you'll write your first program. Let's go!

---

## Step 1: Go to the Script Lab

```bash
cd ~/linux-adventure/my-scripts
```

---

## Step 2: Create Your Script

Open a new file in the nano text editor:

```bash
nano hello.sh
```

A text editor will open in your terminal!

---

## Step 3: Write Your Code

Type this exactly:

```bash
#!/bin/bash
echo "=============================="
echo "  Hello! I am a Linux script!"
echo "  Made by: [YOUR NAME]"
echo "=============================="
echo ""
echo "Today is:"
date
echo ""
echo "You are logged in as:"
whoami
echo ""
echo "This computer has been on for:"
uptime
echo ""
echo "🐧 Script complete!"
```

Replace `[YOUR NAME]` with your actual name!

---

## Step 4: Save and Exit nano

1. Press `Ctrl + O` (that's the letter O, not zero)
2. Press `Enter` to confirm the file name
3. Press `Ctrl + X` to exit nano

You're back in the terminal!

---

## Step 5: Run Your Script!

```bash
bash hello.sh
```

🎉 **YOUR SCRIPT JUST RAN!** You are officially a programmer!

---

## Bonus: Make It Cooler

Open your script again:

```bash
nano hello.sh
```

Try adding more lines! Ideas:

```bash
echo "Here is a calendar:"
cal

echo "A random number: $RANDOM"

echo "Files in this folder:"
ls
```

Save (`Ctrl+O`, Enter) and exit (`Ctrl+X`), then run again:

```bash
bash hello.sh
```

---

## Super Bonus: Make It Interactive

Want your script to ask questions? Add this:

```bash
echo "What is your name?"
read name
echo "Hello, $name! Welcome to Linux!"
```

The `read` command waits for you to type something, then saves it!

---

## What You Just Did

| What | How |
|------|-----|
| Created a file | `nano hello.sh` |
| Wrote a program | Typed bash commands in nano |
| Saved it | `Ctrl+O` → Enter |
| Exited the editor | `Ctrl+X` |
| Ran your program | `bash hello.sh` |

---

## 🧠 Key Message

> **You just wrote a program.**
>
> Every app, every game, every website started just like this — someone typing code into a file and running it.
>
> You are a builder now. 🐧
