#!/bin/bash
# ============================================
# 🐧 Linux Adventure Workshop — Setup Script
# ============================================
# Run this BEFORE the workshop to create all
# the activity folders and challenge files.
#
# Usage:  bash setup.sh
#
# Safe to run multiple times — it cleans up
# and recreates everything fresh.
# ============================================

echo "🐧 Setting up the Linux Adventure Workshop..."
echo ""

# --- Configuration ---
BASE_DIR="$HOME/linux-adventure"

# --- Clean up old run (safe re-run) ---
if [ -d "$BASE_DIR" ]; then
    echo "🧹 Cleaning up previous adventure..."
    rm -rf "$BASE_DIR"
fi

# =====================
# TREASURE HUNT SETUP
# =====================
echo "🗺️  Building the Treasure Hunt..."

HUNT_DIR="$BASE_DIR/treasure-hunt"

# Create the adventure path
mkdir -p "$HUNT_DIR/cave/dark-tunnel"
mkdir -p "$HUNT_DIR/forest/old-tree"
mkdir -p "$HUNT_DIR/mountain/secret-peak"
mkdir -p "$HUNT_DIR/beach/hidden-cove"

# Place the clues
echo "Welcome, adventurer! Your journey begins here." > "$HUNT_DIR/start-here.txt"
echo "Clue 1: The forest holds many secrets. Look inside the old-tree..." > "$HUNT_DIR/cave/clue1.txt"
echo "Clue 2: Climb the mountain! The peak has something hidden..." > "$HUNT_DIR/forest/old-tree/clue2.txt"
echo "Clue 3: Almost there! The beach is calling. Check the hidden-cove..." > "$HUNT_DIR/mountain/secret-peak/clue3.txt"
echo "🏆 CONGRATULATIONS! You found the treasure! You are a terminal master!" > "$HUNT_DIR/beach/hidden-cove/.treasure"

# Add some decoy files to make it interesting
echo "Nothing here... keep looking!" > "$HUNT_DIR/cave/dark-tunnel/empty-room.txt"
echo "Just rocks and shadows..." > "$HUNT_DIR/mountain/rocks.txt"
echo "A seagull stares at you. Not helpful." > "$HUNT_DIR/beach/seagull.txt"
echo "An old map, but the ink is smudged..." > "$HUNT_DIR/forest/old-map.txt"

# Hidden bonus file
echo "🌟 SECRET BONUS: You found a hidden star! Tell your instructor!" > "$HUNT_DIR/forest/.secret-star"

# =====================
# ROBOT FACTORY SETUP
# =====================
echo "🤖 Building the Robot Factory..."

ROBOT_DIR="$BASE_DIR/robot-factory"
mkdir -p "$ROBOT_DIR/parts-bin"
mkdir -p "$ROBOT_DIR/assembly-line"
mkdir -p "$ROBOT_DIR/showroom"

echo "This is where you build your robots!" > "$ROBOT_DIR/welcome.txt"
echo "Grab parts from the parts-bin and assemble them!" > "$ROBOT_DIR/instructions.txt"

# Pre-stock the parts bin
echo "🦾 A strong metal arm" > "$ROBOT_DIR/parts-bin/arm.txt"
echo "🦿 A sturdy robot leg" > "$ROBOT_DIR/parts-bin/leg.txt"
echo "🧠 A super-smart brain chip" > "$ROBOT_DIR/parts-bin/brain.txt"
echo "👁️ A glowing laser eye" > "$ROBOT_DIR/parts-bin/eye.txt"
echo "🔋 A power battery" > "$ROBOT_DIR/parts-bin/battery.txt"

# =====================
# DETECTIVE SETUP
# =====================
echo "🔍 Setting up the Detective Case..."

DETECTIVE_DIR="$BASE_DIR/detective"
mkdir -p "$DETECTIVE_DIR/evidence"
mkdir -p "$DETECTIVE_DIR/suspects"

echo "Case File #42: The Missing Cookie" > "$DETECTIVE_DIR/case-file.txt"
echo "Someone stole the last cookie from the jar." >> "$DETECTIVE_DIR/case-file.txt"
echo "Find who did it by searching the evidence!" >> "$DETECTIVE_DIR/case-file.txt"

echo "I was in the kitchen at 3pm. I saw crumbs on the floor." > "$DETECTIVE_DIR/evidence/witness1.txt"
echo "I heard someone say 'these cookies are delicious' at 3:05pm." > "$DETECTIVE_DIR/evidence/witness2.txt"
echo "I found chocolate on Alex's shirt at 3:10pm." > "$DETECTIVE_DIR/evidence/witness3.txt"
echo "The cookie jar was full at 2:55pm. I checked." > "$DETECTIVE_DIR/evidence/witness4.txt"

echo "Name: Alex | Favorite food: cookies | Was in: kitchen" > "$DETECTIVE_DIR/suspects/alex.txt"
echo "Name: Sam | Favorite food: pizza | Was in: garden" > "$DETECTIVE_DIR/suspects/sam.txt"
echo "Name: Jordan | Favorite food: ice cream | Was in: library" > "$DETECTIVE_DIR/suspects/jordan.txt"
echo "Name: Riley | Favorite food: cookies | Was in: kitchen" > "$DETECTIVE_DIR/suspects/riley.txt"

# =====================
# PLAYGROUND SETUP
# =====================
echo "🎮 Setting up the Playground..."

PLAY_DIR="$BASE_DIR/playground"
mkdir -p "$PLAY_DIR"

echo "Welcome to the Terminal Playground!" > "$PLAY_DIR/welcome.txt"
echo "Try some fun commands here. This is YOUR space!" >> "$PLAY_DIR/welcome.txt"

# =====================
# SCRIPTS SETUP
# =====================
echo "📝 Setting up the Script Lab..."

SCRIPT_DIR="$BASE_DIR/my-scripts"
mkdir -p "$SCRIPT_DIR"

echo "This folder is for YOUR scripts!" > "$SCRIPT_DIR/readme.txt"
echo "Follow the first-script activity to create your first program." >> "$SCRIPT_DIR/readme.txt"

# =====================
# DONE!
# =====================
echo ""
echo "============================================"
echo "✅ Setup complete!"
echo ""
echo "Your adventure is at: $BASE_DIR"
echo ""
echo "Activities ready:"
echo "  🗺️  Treasure Hunt  → $HUNT_DIR"
echo "  🤖 Robot Factory   → $ROBOT_DIR"
echo "  🔍 Detective Case  → $DETECTIVE_DIR"
echo "  🎮 Playground      → $PLAY_DIR"
echo "  📝 Script Lab      → $SCRIPT_DIR"
echo "============================================"
echo ""
echo "🐧 Let the adventure begin!"
