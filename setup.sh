#!/bin/bash
# ============================================
# 🐧 Linux Adventure Workshop — Setup Script
# ============================================
# Run this BEFORE the workshop to create all
# the activity folders and challenge files.
#
# Usage:  bash setup.sh
#
# Creates two structures:
#   ~/linux-adventure/       (English)
#   ~/aventura-linux/        (Español)
#
# Safe to run multiple times — it cleans up
# and recreates everything fresh.
# ============================================

echo "🐧 Setting up the Linux Adventure Workshop..."
echo ""

# --- Configuration ---
EN_DIR="$HOME/linux-adventure"
ES_DIR="$HOME/aventura-linux"

# --- Clean up old runs (safe re-run) ---
for d in "$EN_DIR" "$ES_DIR"; do
    if [ -d "$d" ]; then
        echo "🧹 Cleaning up $d..."
        rm -rf "$d"
    fi
done

# =========================
# ENGLISH: linux-adventure
# =========================
echo ""
echo "🇺🇸 Building English adventure..."

# --- Treasure Hunt ---
echo "  🗺️  Treasure Hunt..."
HUNT="$EN_DIR/treasure-hunt"
mkdir -p "$HUNT/cave/dark-tunnel" "$HUNT/forest/old-tree" "$HUNT/mountain/secret-peak" "$HUNT/beach/hidden-cove"
echo "Welcome, adventurer! Your journey begins here." > "$HUNT/start-here.txt"
echo "Clue 1: The forest holds many secrets. Look inside the old-tree..." > "$HUNT/cave/clue1.txt"
echo "Clue 2: Climb the mountain! The peak has something hidden..." > "$HUNT/forest/old-tree/clue2.txt"
echo "Clue 3: Almost there! The beach is calling. Check the hidden-cove..." > "$HUNT/mountain/secret-peak/clue3.txt"
echo "🏆 CONGRATULATIONS! You found the treasure! You are a terminal master!" > "$HUNT/beach/hidden-cove/.treasure"
echo "Nothing here... keep looking!" > "$HUNT/cave/dark-tunnel/empty-room.txt"
echo "Just rocks and shadows..." > "$HUNT/mountain/rocks.txt"
echo "A seagull stares at you. Not helpful." > "$HUNT/beach/seagull.txt"
echo "An old map, but the ink is smudged..." > "$HUNT/forest/old-map.txt"
echo "🌟 SECRET BONUS: You found a hidden star! Tell your instructor!" > "$HUNT/forest/.secret-star"

# --- Robot Factory ---
echo "  🤖 Robot Factory..."
ROBOT="$EN_DIR/robot-factory"
mkdir -p "$ROBOT/parts-bin" "$ROBOT/assembly-line" "$ROBOT/showroom"
echo "This is where you build your robots!" > "$ROBOT/welcome.txt"
echo "Grab parts from the parts-bin and assemble them!" > "$ROBOT/instructions.txt"
echo "🦾 A strong metal arm" > "$ROBOT/parts-bin/arm.txt"
echo "🦿 A sturdy robot leg" > "$ROBOT/parts-bin/leg.txt"
echo "🧠 A super-smart brain chip" > "$ROBOT/parts-bin/brain.txt"
echo "👁️ A glowing laser eye" > "$ROBOT/parts-bin/eye.txt"
echo "🔋 A power battery" > "$ROBOT/parts-bin/battery.txt"

# --- Detective ---
echo "  🔍 Detective Case..."
DET="$EN_DIR/detective"
mkdir -p "$DET/evidence" "$DET/suspects"
echo "Case File #42: The Missing Cookie" > "$DET/case-file.txt"
echo "Someone stole the last cookie from the jar." >> "$DET/case-file.txt"
echo "Find who did it by searching the evidence!" >> "$DET/case-file.txt"
echo "I was in the kitchen at 3pm. I saw crumbs on the floor." > "$DET/evidence/witness1.txt"
echo "I heard someone say 'these cookies are delicious' at 3:05pm." > "$DET/evidence/witness2.txt"
echo "I found chocolate on Alex's shirt at 3:10pm." > "$DET/evidence/witness3.txt"
echo "The cookie jar was full at 2:55pm. I checked." > "$DET/evidence/witness4.txt"
echo "Name: Alex | Favorite food: cookies | Was in: kitchen" > "$DET/suspects/alex.txt"
echo "Name: Sam | Favorite food: pizza | Was in: garden" > "$DET/suspects/sam.txt"
echo "Name: Jordan | Favorite food: ice cream | Was in: library" > "$DET/suspects/jordan.txt"
echo "Name: Riley | Favorite food: cookies | Was in: kitchen" > "$DET/suspects/riley.txt"

# --- Playground ---
echo "  🎮 Playground..."
PLAY="$EN_DIR/playground"
mkdir -p "$PLAY"
echo "Welcome to the Terminal Playground!" > "$PLAY/welcome.txt"
echo "Try some fun commands here. This is YOUR space!" >> "$PLAY/welcome.txt"

# --- Scripts ---
echo "  📝 Script Lab..."
SCRIPTS="$EN_DIR/my-scripts"
mkdir -p "$SCRIPTS"
echo "This folder is for YOUR scripts!" > "$SCRIPTS/readme.txt"
echo "Follow the first-script activity to create your first program." >> "$SCRIPTS/readme.txt"

# =========================
# ESPAÑOL: aventura-linux
# =========================
echo ""
echo "🇨🇷 Construyendo aventura en español..."

# --- Búsqueda del Tesoro ---
echo "  🗺️  Búsqueda del Tesoro..."
HUNT="$ES_DIR/busqueda-del-tesoro"
mkdir -p "$HUNT/cueva/tunel-oscuro" "$HUNT/bosque/arbol-viejo" "$HUNT/montana/cima-secreta" "$HUNT/playa/cueva-escondida"
echo "¡Bienvenido, aventurero! Tu viaje empieza aquí." > "$HUNT/empieza-aqui.txt"
echo "Pista 1: El bosque guarda muchos secretos. Buscá dentro de arbol-viejo..." > "$HUNT/cueva/pista1.txt"
echo "Pista 2: ¡Subí la montaña! La cima tiene algo escondido..." > "$HUNT/bosque/arbol-viejo/pista2.txt"
echo "Pista 3: ¡Ya casi! La playa te llama. Revisá cueva-escondida..." > "$HUNT/montana/cima-secreta/pista3.txt"
echo "🏆 ¡FELICIDADES! ¡Encontraste el tesoro! ¡Sos un maestro de la terminal!" > "$HUNT/playa/cueva-escondida/.tesoro"
echo "No hay nada aquí... ¡seguí buscando!" > "$HUNT/cueva/tunel-oscuro/cuarto-vacio.txt"
echo "Solo rocas y sombras..." > "$HUNT/montana/rocas.txt"
echo "Una gaviota te mira fijamente. No ayuda mucho." > "$HUNT/playa/gaviota.txt"
echo "Un mapa viejo, pero la tinta está borrosa..." > "$HUNT/bosque/mapa-viejo.txt"
echo "🌟 BONUS SECRETO: ¡Encontraste una estrella escondida! ¡Decile a tu instructor!" > "$HUNT/bosque/.estrella-secreta"

# --- Fábrica de Robots ---
echo "  🤖 Fábrica de Robots..."
ROBOT="$ES_DIR/fabrica-de-robots"
mkdir -p "$ROBOT/piezas" "$ROBOT/linea-de-ensamblaje" "$ROBOT/sala-de-exhibicion"
echo "¡Aquí es donde construís tus robots!" > "$ROBOT/bienvenida.txt"
echo "¡Agarrá piezas de la carpeta piezas y ensamblalas!" > "$ROBOT/instrucciones.txt"
echo "🦾 Un brazo fuerte de metal" > "$ROBOT/piezas/brazo.txt"
echo "🦿 Una pierna robusta de robot" > "$ROBOT/piezas/pierna.txt"
echo "🧠 Un chip cerebral súper inteligente" > "$ROBOT/piezas/cerebro.txt"
echo "👁️ Un ojo láser brillante" > "$ROBOT/piezas/ojo.txt"
echo "🔋 Una batería de poder" > "$ROBOT/piezas/bateria.txt"

# --- Caso del Detective ---
echo "  🔍 Caso del Detective..."
DET="$ES_DIR/detective"
mkdir -p "$DET/evidencia" "$DET/sospechosos"
echo "Caso #42: La Galleta Perdida" > "$DET/caso.txt"
echo "Alguien robó la última galleta del frasco." >> "$DET/caso.txt"
echo "¡Descubrí quién fue buscando en la evidencia!" >> "$DET/caso.txt"
echo "Yo estaba en la cocina a las 3pm. Vi migajas en el piso." > "$DET/evidencia/testigo1.txt"
echo "Escuché a alguien decir 'estas galletas están deliciosas' a las 3:05pm." > "$DET/evidencia/testigo2.txt"
echo "Encontré chocolate en la camisa de Alex a las 3:10pm." > "$DET/evidencia/testigo3.txt"
echo "El frasco de galletas estaba lleno a las 2:55pm. Yo lo revisé." > "$DET/evidencia/testigo4.txt"
echo "Nombre: Alex | Comida favorita: galletas | Estaba en: cocina" > "$DET/sospechosos/alex.txt"
echo "Nombre: Sam | Comida favorita: pizza | Estaba en: jardín" > "$DET/sospechosos/sam.txt"
echo "Nombre: Jordan | Comida favorita: helado | Estaba en: biblioteca" > "$DET/sospechosos/jordan.txt"
echo "Nombre: Riley | Comida favorita: galletas | Estaba en: cocina" > "$DET/sospechosos/riley.txt"

# --- Área de Juego ---
echo "  🎮 Área de Juego..."
PLAY="$ES_DIR/area-de-juego"
mkdir -p "$PLAY"
echo "¡Bienvenido al Área de Juego de la Terminal!" > "$PLAY/bienvenida.txt"
echo "Probá comandos divertidos aquí. ¡Este es TU espacio!" >> "$PLAY/bienvenida.txt"

# --- Laboratorio de Scripts ---
echo "  📝 Laboratorio de Scripts..."
SCRIPTS="$ES_DIR/mis-scripts"
mkdir -p "$SCRIPTS"
echo "¡Esta carpeta es para TUS scripts!" > "$SCRIPTS/leeme.txt"
echo "Seguí la actividad del primer script para crear tu primer programa." >> "$SCRIPTS/leeme.txt"

# =====================
# DONE!
# =====================
echo ""
echo "============================================"
echo "✅ Setup complete!"
echo ""
echo "  🇺🇸 English → $EN_DIR"
echo "  🇨🇷 Español → $ES_DIR"
echo "============================================"
echo ""
echo "🐧 Let the adventure begin!"
