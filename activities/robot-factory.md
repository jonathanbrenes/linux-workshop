# 🤖 Robot Factory

## The Story

Welcome to the **Robot Factory**! Your job: build a robot from parts.

You'll create robot parts as files, put them together, name your robot, and show it off in the showroom.

---

## Getting Started

Go to the Robot Factory:

```bash
cd ~/linux-adventure/robot-factory
```

Look around:

```bash
ls
```

You should see: `parts-bin/`, `assembly-line/`, `showroom/`, and some instruction files.

Check what parts are available:

```bash
ls parts-bin/
```

Read a part:

```bash
cat parts-bin/arm.txt
```

---

## Challenge 1: Build Your Robot

Go to the assembly line:

```bash
cd assembly-line
```

Create your robot's parts by making new files:

```bash
touch head.txt
touch body.txt
touch left-arm.txt
touch right-arm.txt
touch left-leg.txt
touch right-leg.txt
```

Check your work:

```bash
ls
```

How many parts does your robot have? Count them:

```bash
ls | wc -l
```

---

## Challenge 2: Name Your Parts

Your robot parts need better names! Rename them:

```bash
mv head.txt super-brain-3000.txt
mv body.txt titanium-chest.txt
```

Rename the rest however you want! Get creative!

Check your renamed parts:

```bash
ls
```

---

## Challenge 3: Move to the Showroom

Your robot is ready! Move it to the showroom:

```bash
mv *.txt ../showroom/
```

Go check the showroom:

```bash
cd ../showroom
ls
```

Your robot is on display! 🤖🎉

---

## Bonus Challenges

### Build a MEGA robot
Can you create a robot with **15 parts**? Use `touch` to make lots of parts, then count them with `ls | wc -l`.

### Name your robot
Create a file called `robot-name.txt` with your robot's name inside:

```bash
echo "THUNDERBOT-9000" > robot-name.txt
cat robot-name.txt
```

### Copy a part
Need two arms that are the same? Copy a part:

```bash
cp left-arm.txt spare-arm.txt
```

---

## Commands Used

| Command | What You Did |
|---------|-------------|
| `touch filename` | Created a new file |
| `ls` | Listed files |
| `ls \| wc -l` | Counted files |
| `mv old new` | Renamed a file |
| `mv file folder/` | Moved a file to another folder |
| `echo "text" > file` | Wrote text into a file |
| `cp file copy` | Copied a file |
| `cat file` | Read a file |
