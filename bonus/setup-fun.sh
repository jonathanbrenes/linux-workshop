#!/bin/bash
# ============================================
# 🎮 Fun Tools Installer
# ============================================
# Run this to install fun terminal commands
# for the Terminal Playground activity.
#
# Usage:  sudo bash bonus/setup-fun.sh
#   -or-  bash bonus/setup-fun.sh
#
# Requires internet connection.
# ============================================

echo "🎮 Installing fun terminal tools..."
echo ""

sudo apt update -y

echo ""
echo "📦 Installing cowsay (make animals talk)..."
sudo apt install -y cowsay

echo ""
echo "📦 Installing fortune (random quotes)..."
sudo apt install -y fortune-mod

echo ""
echo "📦 Installing sl (steam locomotive)..."
sudo apt install -y sl

echo ""
echo "📦 Installing cmatrix (Matrix effect)..."
sudo apt install -y cmatrix

echo ""
echo "📦 Installing figlet (big text)..."
sudo apt install -y figlet

echo ""
echo "============================================"
echo "✅ All fun tools installed!"
echo ""
echo "Try them out:"
echo "  cowsay 'Hello!'"
echo "  fortune"
echo "  sl"
echo "  cmatrix"
echo "  figlet 'WOW'"
echo "============================================"
