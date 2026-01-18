# UI Design Guide - Bliss App

This document captures all design decisions and guidelines established for the redesigned UI. Use this as a reference when designing new pages.

---

## 🎤 NARRATIVE TONES: Three Distinct Storytelling Styles

**Bliss offers THREE narrative tones that dramatically change how insights are presented. The underlying psychological content remains the same - only the presentation style changes.**

### The Three Tones

| Tone | Style | Character Usage | Best For |
|------|-------|-----------------|----------|
| **MINIMAL** | Direct, action-oriented, bullet points | Characters appear ONLY in Psyche identification and Examples | Users who want quick, actionable insights without storytelling |
| **MODERN** | Contemporary narrative, story form | Characters woven throughout the narrative | Users who want relatable, personal storytelling |
| **MYTHICAL** | Fairy-tale, magical, epic | Characters as heroes in an epic journey | Users who want enchanting, immersive experiences |

### Tone Selection Flow

1. **Welcome Screen** - User selects their preferred tone during onboarding
2. **Output Pages** - Tone selector button allows changing tone (navigates back to welcome)
3. **Content Regeneration** - When tone changes, narrative is re-rendered in new style

### Tone-Specific Writing Guidelines

#### MINIMAL Tone
```
✅ DO:
- Use bullet points and numbered lists
- Write short, direct sentences (max 15 words)
- Focus on actions: "What it means:", "What to do:", "Watch out for:"
- Keep it like an executive summary

❌ DON'T:
- Use metaphors or poetic language
- Write in story form
- Mention characters except in Psyche identification and Examples
```

#### MODERN Tone
```
✅ DO:
- Write in story form with narrative arc
- Reference characters by name: "Like [Character], you..."
- Use contemporary, relatable language
- Create a coherent personal narrative

❌ DON'T:
- Use archaic or formal language
- Be overly poetic or mystical
- Ignore the user's characters
```

#### MYTHICAL Tone
```
✅ DO:
- Write like a fairy tale or epic myth
- Use magical imagery: quests, enchanted forests, wise guides
- Transform patterns into prophecies and destinies
- Make it feel like an adventure

❌ DON'T:
- Use complex vocabulary or jargon
- Make it inaccessible to laypeople
- Lose the personal relevance
```

### Implementation Notes

- Tone is stored per user in preferences
- Default tone is MODERN
- Tone change triggers re-rendering via `/v1/tone/render/me` endpoint
- MINIMAL tone uses structural transformation (no LLM needed)
- MODERN and MYTHICAL tones use LLM transformation

---

## ⭐⭐⭐ THE BLISS VISUAL IDENTITY: Shadow Silhouettes with Peeking Eyes ⭐⭐⭐

**THIS IS THE SIGNATURE STYLE OF BLISS. ALL card illustrations use this approach.**

### Core Concept

Characters are shown as **DARK SHADOW SILHOUETTES** against rich, layered environments. The only visible features are **GLOWING PEEKING EYES** emerging from the shadow - creating mystery, intrigue, and a sense of watchful presence.

```
    ┌─────────────────────────┐
    │  ★  ★     🌙            │  ← Rich atmospheric environment
    │      ☁️                  │
    │                         │
    │       ████████          │  ← Dark silhouette (shadow)
    │      █  👀  █           │  ← Glowing peeking eyes ONLY
    │      █████████          │
    │     ███████████         │
    │                         │
    │░░░░░░░░░░░░░░░░░░░░░░░░░│  ← Gradient overlay
    │      Card Title         │
    └─────────────────────────┘
```

### Why This Style?
- **Mystery** - Shadows create intrigue and depth
- **Universal** - Works for any subject (animals, buildings, nature, cosmic)
- **Cohesive** - Unifies all cards across the app
- **Memorable** - Distinctive visual identity

---

## 🎭 SHADOW CHARACTER TYPES: Mix Everything!

**Shadow silhouettes can be from ANY of these categories. Mix them freely across pages for variety:**

| Category | Examples | Shadow Style |
|----------|----------|--------------|
| **Animals** | Owl, Fox, Deer, Cat, Wolf, Bear, Lion, Rabbit | Animal silhouette with eyes in face area |
| **Birds** | Songbirds, Eagles, Phoenix, Doves | Wings spread or perched, eyes glowing |
| **Natural Entities** | Sun ☀️, Moon 🌙, Star ⭐, Mountain ⛰️, Cloud ☁️ | Entity shape with eyes embedded in center |
| **Plants/Organic** | Flower 🌸, Tree 🌳, Mushroom 🍄 | Organic shape with eyes in core/trunk |
| **Symbolic Objects** | Heart ❤️, Flame 🔥, Crystal 💎, Compass | Object silhouette with inner eyes |
| **Buildings/Places** | Lighthouse, Castle, Tower, Bridge, Cabin | Architecture silhouette with window-eyes |
| **Cosmic** | Asteroid, Comet, Nebula, Planet, Black Hole | Space object with glowing core-eyes |
| **Weather** | Thunder cloud ⛈️, Tornado, Wave 🌊 | Dynamic shape with eyes in center |

### Character Allocation Guidelines

**To ensure variety, assign different categories per page:**

| Page | Card 1 | Card 2 | Card 3 | Card 4 | Card 5 |
|------|--------|--------|--------|--------|--------|
| Story | Animal | Entity | Building | Bird | Cosmic |
| Character Entry | All shadows from same category (e.g., buildings) |
| Clarification | Different entities from Character Entry |

---

## 👁️ THE PEEKING EYES: The Soul of Every Shadow

**EVERY shadow character MUST have GLOWING PEEKING EYES. This is what brings them to life.**

### Eye Specifications

| Feature | Specification |
|---------|--------------|
| **Position** | Centered within silhouette at natural "face" location |
| **Glow layers** | 3 layers of accent-colored glow around each eye |
| **Eye white** | Cream white oval (#FFFFF0) |
| **Iris** | Golden amber (#FBD38D) - warm, inviting |
| **Pupil** | Dark (#1A1A1A) with white shine dot |
| **Mood** | Watchful, mysterious, but friendly |

### Peeking Eyes Implementation

```dart
/// THE SIGNATURE PEEKING EYES - Use this helper everywhere
void drawPeekingEyes(Canvas canvas, double cx, double cy, double spacing, double eyeSize, Color glowColor) {
  // === LAYER 1: Eye glow (3 layers of accent color) ===
  for (int i = 2; i >= 0; i--) {
    canvas.drawOval(
      Rect.fromCenter(center: Offset(cx - spacing, cy), width: eyeSize * 2 + i * 4, height: eyeSize * 1.5 + i * 3),
      Paint()..color = glowColor.withOpacity(0.12 - i * 0.03),
    );
    canvas.drawOval(
      Rect.fromCenter(center: Offset(cx + spacing, cy), width: eyeSize * 2 + i * 4, height: eyeSize * 1.5 + i * 3),
      Paint()..color = glowColor.withOpacity(0.12 - i * 0.03),
    );
  }
  
  // === LAYER 2: Eye whites (cream ovals) ===
  canvas.drawOval(Rect.fromCenter(center: Offset(cx - spacing, cy), width: eyeSize * 2, height: eyeSize * 1.5), Paint()..color = const Color(0xFFFFFFF0));
  canvas.drawOval(Rect.fromCenter(center: Offset(cx + spacing, cy), width: eyeSize * 2, height: eyeSize * 1.5), Paint()..color = const Color(0xFFFFFFF0));
  
  // === LAYER 3: Irises (golden amber) ===
  canvas.drawCircle(Offset(cx - spacing, cy), eyeSize * 0.7, Paint()..color = const Color(0xFFFBD38D));
  canvas.drawCircle(Offset(cx + spacing, cy), eyeSize * 0.7, Paint()..color = const Color(0xFFFBD38D));
  
  // === LAYER 4: Pupils (dark) ===
  canvas.drawCircle(Offset(cx - spacing, cy), eyeSize * 0.35, Paint()..color = const Color(0xFF1A1A1A));
  canvas.drawCircle(Offset(cx + spacing, cy), eyeSize * 0.35, Paint()..color = const Color(0xFF1A1A1A));
  
  // === LAYER 5: Eye shine (CRITICAL - gives life!) ===
  canvas.drawCircle(Offset(cx - spacing - eyeSize * 0.25, cy - eyeSize * 0.25), eyeSize * 0.18, Paint()..color = Colors.white);
  canvas.drawCircle(Offset(cx + spacing - eyeSize * 0.25, cy - eyeSize * 0.25), eyeSize * 0.18, Paint()..color = Colors.white);
}
```

### Eye Placement by Character Type

| Character Type | Eye Position | Notes |
|----------------|--------------|-------|
| **Animal** | Upper body, where face would be | Natural face position |
| **Sun** | Center of the disc | Eyes within the sun circle |
| **Moon** | Center of crescent | Eyes peek from curve |
| **Star** | Center of the star | Eyes in middle point area |
| **Mountain** | Near the peak | Like a wise giant looking down |
| **Cloud** | Center of main puff | Fluffy face |
| **Tree** | In the trunk | Like a knot with eyes |
| **Flower** | Center of bloom | Eyes in the flower center |
| **Heart** | Upper portion | Eyes in top curves |
| **Lighthouse/Castle** | In a window | Eyes peek from opening |
| **Crystal** | Center facet | Eyes glow from within |
| **Wave** | Inside the curl | Eyes in the wave curl |
| **Flame** | Core of fire | Eyes in flame center |
| **Asteroid** | Surface crater | Eyes in crater |

---

## 🖤 THE SHADOW SILHOUETTE

### Shadow Design Rules

| Feature | Specification |
|---------|--------------|
| **Color** | Near-black: #0A0508 to #0A0515 |
| **Style** | Solid dark shape, NO internal details |
| **Edge** | Can be soft or sharp depending on subject |
| **Outer glow** | 3-5 layers of accent color around silhouette |

### Shadow Implementation

```dart
void drawShadowWithGlow(Canvas canvas, Path silhouettePath, Color glowColor) {
  // === Outer glow rings (creates atmosphere) ===
  for (int i = 4; i >= 0; i--) {
    canvas.drawPath(
      silhouettePath,
      Paint()
        ..color = glowColor.withOpacity(0.08 - i * 0.015)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 6 + i * 4.0,
    );
  }
  
  // === Solid shadow body (the silhouette) ===
  canvas.drawPath(silhouettePath, Paint()..color = const Color(0xFF0A0508));
}
```

### What NOT to Include in Shadows

❌ Internal body details (fur texture, scales, etc.)
❌ Multiple colors within the silhouette
❌ Facial features other than eyes
❌ Visible limbs with detail
❌ Any feature that breaks the solid shadow look

---

## 🎨 SHADOW CHARACTER EXAMPLES

### Animals as Shadows

| Animal | Shadow Shape Description | Eye Style |
|--------|--------------------------|-----------|
| **Owl** | Round body, ear tufts, spread wings | Large round eyes (wisdom) |
| **Fox** | Pointed ears, bushy tail, alert pose | Almond eyes (clever) |
| **Deer** | Antlers, elegant long neck | Gentle oval eyes (grace) |
| **Cat** | Curved back, tail, sitting | Slit-pupil eyes (mysterious) |
| **Wolf** | Pointed ears, strong profile | Alert eyes (watchful) |
| **Rabbit** | Long ears, round body | Wide soft eyes (curious) |
| **Bear** | Large round shape, small ears | Deep set eyes (wise) |
| **Lion** | Mane silhouette, proud pose | Confident eyes (noble) |

### Natural Entities as Shadows

| Entity | Shadow Shape Description | Eye Style |
|--------|--------------------------|-----------|
| **Sun** | Disc with extending rays | Confident, wide-open eyes |
| **Moon** | Crescent or full circle | Calm, half-closed eyes |
| **Star** | 5 or 6 pointed star | Twinkling, curious eyes |
| **Mountain** | Peak silhouette, rocky | Ancient, wise eyes near peak |
| **Cloud** | Fluffy, layered puffs | Soft, gentle eyes |
| **Flower** | Petals around center | Alert, curious eyes |
| **Heart** | Classic heart shape | Warm, loving eyes |
| **Flame** | Dancing fire shape | Fierce, alive eyes |
| **Wave** | Curling water | Dynamic, powerful eyes |
| **Asteroid** | Irregular rocky shape | Mysterious, cosmic eyes |

### Buildings as Shadows

| Building | Shadow Shape Description | Eye Style |
|----------|--------------------------|-----------|
| **Lighthouse** | Tower with beacon | Eyes in lamp room window |
| **Castle** | Tower with battlements | Eyes in main window |
| **Cabin** | Cozy house shape | Eyes in doorway/window |
| **Bridge** | Arched structure | Eyes in arch opening |
| **Tower** | Tall spire | Eyes in upper window |

---

## 🌌 ENVIRONMENT DESIGN (Surrounding the Shadow)

**The shadow sits IN a rich environment. The environment should be as detailed as the shadow is simple.**

### ⚠️ CRITICAL: Shadows are for CHARACTERS ONLY

**ONLY the main character/entity should be a shadow silhouette. All environmental elements should be VISIBLE with colors:**

| Element | Style |
|---------|-------|
| **Main Character** | Shadow silhouette with peeking eyes |
| Trees | Visible colors (greens, browns) NOT shadows |
| Ground/Hills | Visible colors with gradients |
| Clouds | Visible white/gray with opacity |
| Water/Waves | Visible blue/teal colors |
| Buildings (background) | Visible colors, only SHADOW if they're the main character |
| Props/Objects | Visible colors |

### Mandatory Environment Layers (7-9 total)

```
Layer 1: Sky/Background gradient (deep colors, smooth transitions)
Layer 2: Distant elements (mountains, constellations, far trees) - VISIBLE COLORS
Layer 3: Light source & glow (moon, sun, lantern - multi-layer glow)
Layer 4: Mid-ground environment (hills, trees, buildings, water) - VISIBLE COLORS
Layer 5: Environmental details (flowers, grass, furniture, props) - VISIBLE COLORS
Layer 6: THE SHADOW CHARACTER (ONLY this is shadow with peeking eyes!)
Layer 7: Foreground elements (leaves, petals, floating objects)
Layer 8: Particles & sparkles (magic dust, fireflies, snow)
Layer 9: Vignette overlay (subtle edge darkening for depth)
```

### Environment Variability (CRITICAL)

**No two cards on the same page should have similar environments!**

| Environment Type | Key Elements | Primary Colors |
|-----------------|--------------|----------------|
| **Enchanted Forest** | Tall trees, mushrooms, fireflies | Deep purple, emerald |
| **Sunset/Dawn** | Orange sky, sun rays, birds | Orange, gold, pink |
| **Moonlit Night** | Stars, moon, mist | Navy, silver, deep blue |
| **Stormy Sky** | Lightning, dark clouds, rain | Dark blue, grey, purple |
| **Mountain Vista** | Snow peaks, pine trees | Blue, white, forest green |
| **Ocean/Coastal** | Waves, lighthouse, spray | Teal, navy, white foam |
| **Cosmic/Space** | Nebulas, stars, planets | Purple, pink, deep black |
| **Cave/Crystal** | Stalactites, gem glow | Purple, teal, dark |
| **Autumn Grove** | Fall leaves, warm light | Orange, brown, gold |
| **Spring Meadow** | Flowers, butterflies | Pink, green, yellow |

### Time of Day Variation

Mix these across cards:
- **Dawn** - Soft pink/orange, long shadows
- **Day** - Bright blue sky, white clouds
- **Golden Hour** - Warm amber, golden rays
- **Twilight** - Purple/pink, first stars
- **Night** - Deep blue/black, moon, stars

---

## 🎴 CARD DESIGN STANDARD (MANDATORY FOR ALL CARDS)

### Universal Card Structure

```
┌─────────────────────┐
│ [i]                 │  ← Info tooltip (top right)
│                     │
│   [ENVIRONMENT]     │  ← Rich, layered background
│     [SHADOW]        │  ← Dark silhouette
│      [👀]          │  ← Glowing peeking eyes
│                     │
│░░░░░░░░░░░░░░░░░░░░░│  ← Gradient overlay
│      Card Title     │  ← Title INSIDE card at bottom
└─────────────────────┘
```

### Card Specifications

| Feature | Value |
|---------|-------|
| Aspect ratio | **1:1 (square)** - MANDATORY |
| Grid | 2 columns |
| Gap | 16px |
| Border radius | 16px |
| Border | **NONE** - shadow only |
| Illustration | Full-bleed shadow scene |
| Title | INSIDE card with gradient overlay |

### Card Shadow (Elevation)

```dart
BoxShadow(
  color: Colors.black.withOpacity(isDark ? 0.3 : 0.2),
  blurRadius: 8,
  offset: const Offset(0, 4),
)
```

### Gradient Overlay for Title

```dart
Container(
  decoration: BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.transparent,
        Colors.black.withOpacity(0.7),
      ],
    ),
  ),
)
```

---

## 🏔️ RICH ENVIRONMENT STANDARDS (MANDATORY FOR ALL CARDS)

**ALL card backgrounds MUST have multi-layered, atmospheric environments matching the quality of the character entry and story page cards.**

### Minimum 6-7 Layers Required

Each card painter MUST include AT LEAST these layer types:

| Layer | Description | Example |
|-------|-------------|---------|
| **1. Base Gradient** | 5-6 color stops, top to bottom | Deep colors fading to lighter/warmer |
| **2. Atmospheric Glow** | Nebula, sun/moon halos, horizon light | `RadialGradient` with 2-3 opacity stops |
| **3. Celestial Elements** | Stars (30-60), moon/sun, constellations | `drawCircle` with varying opacity |
| **4. Distant Silhouettes** | Mountains, forests, buildings | `Path` with ~50-60% opacity |
| **5. Fog/Mist Layer** | Atmospheric depth | `LinearGradient` with transparent ends |
| **6. Environmental Details** | Particles, ripples, grass, flowers | Small shapes throughout |
| **7. Ground/Foreground** | Textured ground with gradient | `Path` with `LinearGradient` shader |

### ⏰ TIME OF DAY (MANDATORY VARIABILITY)

**Each page MUST include cards with varied times of day. No more than 2 cards should share the same time.**

| Time | Sky Colors | Light Source | Key Indicators |
|------|-----------|--------------|----------------|
| **Dawn** | Navy → amber → gold | Rising sun (low, horizon) | Fading stars, warm glow, mist |
| **Morning** | Soft blue → cyan → white | Sun (low-mid, side) | Fresh light, dew, crisp shadows |
| **Midday** | Bright blue → white | Sun (overhead) | Harsh light, minimal shadows |
| **Afternoon** | Blue → warm gold | Sun (mid, angled) | Long shadows, warm tones |
| **Golden Hour** | Gold → orange → pink | Sun (low) | Everything glows warm/gold |
| **Dusk** | Pink → purple → deep blue | Setting sun | First stars, romantic colors |
| **Twilight** | Purple → deep blue → navy | No direct sun | Stars emerging, mystical light |
| **Night** | Deep blue → indigo → black | Moon/stars | Full starfield, moon glow |
| **Midnight** | Black → deep purple | Minimal | Darkest sky, brightest stars |

### 🌤️ WEATHER CONDITIONS (MANDATORY VARIABILITY)

**Each page MUST include cards with varied weather. No more than 2 cards should share the same weather.**

| Weather | Visual Elements | Atmosphere | Color Modifications |
|---------|-----------------|------------|---------------------|
| **Clear** | Clean sky, sharp stars | Crisp, vibrant | Standard palette |
| **Partly Cloudy** | Scattered clouds, some sun | Dynamic, changing | Slight grey overlay |
| **Overcast** | Full cloud cover | Muted, soft | Desaturate 20% |
| **Misty/Foggy** | Fog layers, diffused light | Mysterious, ethereal | Add white haze (10-15% opacity) |
| **Light Rain** | Rain streaks, wet surfaces | Calm, reflective | Blue-grey tint, reflections |
| **Thunderstorm** | Dark clouds, lightning | Dramatic, intense | Dark grey sky, lightning flashes |
| **Snowing** | Snowflakes, white ground | Magical, quiet | White particles, cool blues |
| **Hazy/Dusty** | Particle haze | Warm, atmospheric | Yellow/orange tint |
| **Volcanic/Smoky** | Ash clouds, embers | Apocalyptic, intense | Grey + orange/red |

### Environment Variability by Archetype

| Archetype | Time | Weather | Environment Theme | Key Elements |
|-----------|------|---------|-------------------|--------------|
| **Hero** | Dawn | Clear with mist | Mountain peaks | Rising sun rays, layered peaks, morning mist, fading stars |
| **Trickster** | Twilight | Foggy | Mystical forest | Crescent moon, fox-fire wisps, fog layers, forest silhouette |
| **Sage** | Midnight | Clear starry | Ancient tree | Brightest stars, nebulae, moonless, ancient branches |
| **Nurturer** | Golden Hour | Partly cloudy | Warm garden | Soft clouds, warm glow, fireflies, golden light |
| **Warrior** | Stormy Night | Thunderstorm | Rocky cliffs | Lightning, storm clouds, dramatic shadows, rain hint |
| **Lover** | Dusk | Clear calm | Romantic lake | Pink/purple sky, first stars, calm water, rose petals |
| **Rebel** | Midday | Volcanic smoke | Volcanic terrain | Harsh light through smoke, ash, lava, embers |
| **Seeker** | Morning | Partly cloudy | Open horizon | Fresh light, adventure path, distant peaks, bright sky |
| **Child** | Twilight | Light snow | Magic meadow | Snowflakes, emerging stars, rainbow hint, wonder |
| **Healer** | Afternoon | Light rain | Healing spring | Soft rain, reflections, fresh greens, cleansing |
| **Magician** | Night | Clear mystical | Arcane void | Moon phases, stars, energy glow, crystals |
| **Authority** | Late Afternoon | Hazy/dusty | Savanna | Dusty golden light, long shadows, acacia silhouettes |

### Code Pattern for Rich Environments

```dart
void paint(Canvas canvas, Size size) {
  final random = math.Random(seed);
  
  // === LAYER 1: Rich multi-stop gradient ===
  canvas.drawRect(
    Rect.fromLTWH(0, 0, size.width, size.height),
    Paint()..shader = LinearGradient(
      colors: [color1, color2, color3, color4, color5, color6],
      stops: const [0.0, 0.15, 0.35, 0.55, 0.75, 1.0],
    ).createShader(rect),
  );

  // === LAYER 2: Atmospheric glow ===
  canvas.drawCircle(center, radius, 
    Paint()..shader = RadialGradient(colors: [glow, transparent])...);

  // === LAYER 3: Stars (30-60) ===
  for (int i = 0; i < 45; i++) {
    // Include sparkle crosses on some stars
    if (i % 10 == 0) drawSparkle(...);
    canvas.drawCircle(...);
  }

  // === LAYER 4: Distant silhouettes ===
  final distantPath = Path()..moveTo(...)...;
  canvas.drawPath(distantPath, Paint()..color = color.withOpacity(0.5-0.6));

  // === LAYER 5: Mist/fog layer ===
  canvas.drawRect(fogArea, Paint()..shader = LinearGradient(
    colors: [transparent, mistColor.withOpacity(0.1-0.15), transparent])...);

  // === LAYER 6: Environmental details (particles, flora, etc.) ===
  for (int i = 0; i < 20; i++) { /* particles, flowers, ripples */ }

  // === LAYER 7: Foreground/ground with texture ===
  canvas.drawPath(ground, Paint()..shader = LinearGradient(...)...);
  for (int i = 0; i < 10; i++) { /* grass, rocks, texture */ }
}
```

### DO NOT

❌ Use single flat gradient backgrounds
❌ Skip atmospheric elements (stars, particles)
❌ Omit silhouette layers for depth
❌ Use fewer than 6 layers
❌ Copy environments between cards on same page

---

## ⚠️ MANDATORY VARIABILITY RULES

**CRITICAL: Cards on the same page MUST be visually distinct.**

### Per-Page Requirements

1. **Different shadow characters** - No two cards with same subject type
2. **Different environments** - Vary the setting completely (see Environment Standards above)
3. **Different color palettes** - Each card has unique dominant colors
4. **Different times of day** - Mix dawn, day, dusk, night

### Example: Story Page Plan

| Card | Shadow | Environment | Palette | Time | Why This Metaphor |
|------|--------|-------------|---------|------|-------------------|
| Myth Summary | Ancient Tome/Book | Mystical Chamber | Purple/Gold | Night | A book represents your complete mythic narrative - the grand story of your inner world |
| Central Tension | Sun/Moon Split | Duality Sky | Orange+Navy | Duality | Split elements naturally represent internal tension and conflicting forces |
| Guiding Sentence | Owl | Mountain Vista | Green | Twilight | An owl = wisdom; perched high = guidance from above |
| North Star | Lighthouse/Star | Coastal Night | Deep Blue | Night | A lighthouse guides ships = the north star guides your journey |
| Current Chapter | Traveler on Path | Winding Journey | Purple | Twilight | A traveler at a point on a path = "where you are right now" in your journey |
| Core Traits | Tree with Roots | Earth/Underground | Indigo | Split | Deep roots = fundamental patterns; visible roots show what's foundational to you |
| Symbolic Essence | Mirror/Reflection | Mystical Chamber | Amber | Night | A mirror reveals your true self = the deeper meaning behind your patterns |

---

## 🧠 INTUITIVE DESIGN METAPHORS

**Every card illustration MUST make intuitive sense. The visual metaphor should help users understand the concept without reading the title.**

### Design Principle: Visual = Meaning

| ❌ WRONG Approach | ✅ RIGHT Approach |
|------------------|-------------------|
| Random animal for "Myth Summary" | Ancient book = your story is written |
| Plain moon for "Current Chapter" | Traveler on path = where you are NOW |
| Crystal for "Symbolic Essence" | Mirror = reveals deeper meaning |
| Owl for "Core Traits" | Tree with roots = foundational patterns |

### Metaphor Selection Guidelines

When designing a card, ask:

1. **"What physical object EMBODIES this concept?"**
   - Current Chapter → A journey path (you're somewhere ON it)
   - Core Traits → Deep roots (fundamental, below surface)
   - Symbolic Essence → A mirror (shows true self/meaning)

2. **"If I showed ONLY the illustration, would users understand?"**
   - If no, the metaphor is too abstract
   - If yes, the design is intuitive

3. **"Does this metaphor work universally?"**
   - Avoid culture-specific symbols
   - Use universal imagery (paths, books, mirrors, trees)

### Metaphor Library

| Concept Type | Good Metaphors |
|-------------|----------------|
| **Journey/Progress** | Path, road, river, bridge, footprints |
| **Narrative/Story** | Book, scroll, theater stage, storyteller |
| **Foundation/Core** | Tree roots, bedrock, foundation stone, seed |
| **Self-Reflection** | Mirror, still water, eye, crystal ball |
| **Guidance** | Lighthouse, north star, compass, torch |
| **Tension/Conflict** | Split sky, tug-of-war, scales, fork in road |
| **Growth/Change** | Butterfly, phoenix, sunrise, sprouting plant |

---

## 🎭 SIMPLE ICONIC CHARACTER DESIGN (CENTRAL THEME)

**⭐⭐⭐ THIS IS THE FOUNDATION OF ALL CHARACTER DESIGNS ⭐⭐⭐**

The Bliss app uses **SIMPLE ICONIC** character designs - NOT realistic silhouettes. This approach matches the login owl and welcome birds.

### Core Philosophy

| ❌ DON'T | ✅ DO |
|---------|------|
| Realistic animal anatomy | Simple geometric shapes |
| Detailed feathers/fur texture | Smooth curves, minimal detail |
| Complex paths with many curves | Basic ovals, circles, triangles |
| Eyes as secondary feature | **LARGE GLOWING EYES as main feature** |
| Anatomically correct proportions | Stylized, icon-like proportions |

### Why Simple Iconic Works

1. **Renders cleanly** - No jagged edges or complex paths
2. **Instantly recognizable** - Reads as "owl" or "fox" without needing detail
3. **Consistent feel** - All characters share the same visual language
4. **Eyes are the soul** - Large glowing eyes create personality
5. **Backgrounds do the work** - Rich atmospheric environments provide detail

---

## 📐 MANDATORY SIZE STANDARDS

**ALL characters MUST follow these proportions:**

### Body Size Standards

| Element | Size | Formula |
|---------|------|---------|
| **Main size unit (s)** | 30-35% of card width | `s = size.width * 0.32` |
| **Body oval** | s × 0.7-0.9 width, s × 0.5 height | Horizontal oval for body |
| **Head circle** | s × 0.55-0.6 width, s × 0.45-0.5 height | Slightly smaller than body |
| **Ears/features** | s × 0.15-0.25 each | Proportional to head |
| **Tail** | s × 0.4-0.6 length | Curved, simple shape |

### Eye Standards (CRITICAL)

| Element | Size | Formula |
|---------|------|---------|
| **Eye size** | 8-10% of main size unit | `eyeSize = s * 0.085` |
| **Eye spacing** | 12-16% of main size unit | `eyeSpacing = s * 0.14` |
| **Glow layers** | 5-6 layers | Decreasing opacity 0.06 → 0.01 |
| **White radius** | eyeSize × 1.5 | Cream white (#FFFFF0) |
| **Iris radius** | eyeSize × 0.9 | Golden amber (#FBD38D) |
| **Pupil radius** | eyeSize × 0.4 | Dark (#1A1A1A) |
| **Highlight radius** | eyeSize × 0.2 | Pure white |

### Standard Eye Code Template

```dart
// STANDARD EYE DRAWING - Use this exact pattern!
final eyeY = cy - s * 0.12;          // Position in upper face area
final eyeSpacing = s * 0.14;          // 14% of size unit
final eyeSize = s * 0.085;            // 8.5% of size unit

// Eye glow layers (5-6 layers)
for (int i = 5; i >= 0; i--) {
  final glowSize = eyeSize * 2.5 + i * 4;
  canvas.drawCircle(Offset(cx - eyeSpacing, eyeY), glowSize, 
    Paint()..color = glowColor.withOpacity(0.06 - i * 0.008));
  canvas.drawCircle(Offset(cx + eyeSpacing, eyeY), glowSize, 
    Paint()..color = glowColor.withOpacity(0.06 - i * 0.008));
}

// White of eyes
canvas.drawCircle(Offset(cx - eyeSpacing, eyeY), eyeSize * 1.5, 
  Paint()..color = const Color(0xFFFFFFF0));
canvas.drawCircle(Offset(cx + eyeSpacing, eyeY), eyeSize * 1.5, 
  Paint()..color = const Color(0xFFFFFFF0));

// Iris (golden/amber)
canvas.drawCircle(Offset(cx - eyeSpacing, eyeY), eyeSize * 0.9, 
  Paint()..color = const Color(0xFFFBD38D));
canvas.drawCircle(Offset(cx + eyeSpacing, eyeY), eyeSize * 0.9, 
  Paint()..color = const Color(0xFFFBD38D));

// Pupil
canvas.drawCircle(Offset(cx - eyeSpacing, eyeY), eyeSize * 0.4, 
  Paint()..color = const Color(0xFF1A1A1A));
canvas.drawCircle(Offset(cx + eyeSpacing, eyeY), eyeSize * 0.4, 
  Paint()..color = const Color(0xFF1A1A1A));

// Highlight
canvas.drawCircle(Offset(cx - eyeSpacing - eyeSize * 0.3, eyeY - eyeSize * 0.3), 
  eyeSize * 0.2, Paint()..color = Colors.white);
canvas.drawCircle(Offset(cx + eyeSpacing - eyeSize * 0.3, eyeY - eyeSize * 0.3), 
  eyeSize * 0.2, Paint()..color = Colors.white);
```

---

## 🎭 ARCHETYPE VISUAL METAPHORS

**Each archetype uses a SIMPLE ICONIC animal:**

| Archetype | Animal | Key Shapes | Color |
|-----------|--------|------------|-------|
| **Hero** | Eagle | Oval body + circle head + curved wings + fan tail | Red `#DC2626` |
| **Trickster** | Fox | Oval body/head + triangle ears + curved tail | Amber `#F59E0B` |
| **Sage** | Owl | Merged oval body/head + triangle ear tufts + beak | Indigo `#6366F1` |
| **Nurturer** | Mother Bird | Oval body + curved wing + small chicks | Pink `#EC4899` |
| **Warrior** | Wolf | Oval body/head + triangle ears + snout oval | Purple `#7C3AED` |
| **Lover** | Swan | Oval body + S-curved neck path | Rose `#F472B6` |
| **Rebel** | Phoenix | Flame-shaped body + upward wing curves | Bright Red `#EF4444` |
| **Seeker** | Hawk | Oval body + angular wing shapes | Teal `#14B8A6` |
| **Child** | Fawn | Small oval body + large triangle ears | Light Purple `#8B5CF6` |
| **Healer** | Dove | Oval body + gentle curved wings | Emerald `#10B981` |
| **Magician** | Raven | Oval body + angular wings + curved beak | Deep Purple `#8B5CF6` |
| **Authority** | Lion | Oval body + circle mane around head | Gold `#D97706` |

### Standard Size Template

**ALL archetypes use the SAME size standards:**

```dart
final cx = size.width * 0.5;          // Center X
final cy = size.height * 0.48;        // Center Y (slightly above middle)
final s = size.width * 0.32;          // STANDARD SIZE UNIT (32% of card)
```

### Shadow Archetypes

Shadow variants use the SAME visual but with:
- Purple overlay tint (`#4A0E4E` at 25% opacity)
- Extra dark vignette (40% at edges)
- Slightly muted eye glow

### Archetype Card Design

```
┌─────────────────────┐
│ [i]                 │  ← Info tooltip (top right)
│                     │
│   [ARCHETYPE        │  ← Unique silhouette for each archetype
│    SILHOUETTE]      │
│      [👀]          │  ← Peeking eyes
│                     │
│░░░░░░░░░░░░░░░░░░░░░│  ← Gradient overlay
│  Archetype Name     │  ← Title
│  ████████░░ 75%     │  ← Score bar
└─────────────────────┘
```

### Implementation

Use `getArchetypePainter()` from `content_card.dart`:

```dart
CustomPaint(
  painter: getArchetypePainter(
    'HERO',           // Motif key
    Colors.red,       // Accent color
    isDark,           // Theme mode
    isShadow: false,  // Shadow variant?
  ),
)
```

### What to NEVER Do

❌ Two adjacent cards with same shadow type
❌ Two adjacent cards with same background type
❌ Two adjacent cards with same color palette
❌ Two adjacent cards with same time of day
❌ Fully visible, detailed characters (use shadows only!)

---

## 🎨 COLOR PALETTE

### Shadow Colors

| Element | Color Code | Description |
|---------|------------|-------------|
| Shadow Body | `#0A0508` to `#0A0515` | Near-black |
| Eye White | `#FFFFF0` | Cream white |
| Eye Iris | `#FBD38D` | Golden amber |
| Eye Pupil | `#1A1A1A` | Pure black |
| Eye Shine | `#FFFFFF` | Pure white |

### Accent Colors (for glows)

| Theme | Color | Hex |
|-------|-------|-----|
| Purple | Mystical | `#8B5CF6` |
| Amber | Warm | `#F59E0B` |
| Pink | Romantic | `#EC4899` |
| Blue | Calm | `#3B82F6` |
| Gold | Noble | `#D97706` |
| Teal | Serene | `#14B8A6` |

### Environment Palettes

| Palette | Primary | Secondary | Accent |
|---------|---------|-----------|--------|
| Mystic Purple | #4A3662 | #2D1F42 | #D4AF37 |
| Sunset Warm | #FF8C42 | #FFB347 | #FFECD2 |
| Ocean Teal | #1B4D5C | #2D6B7A | #9AE6B4 |
| Forest Green | #1B4332 | #2D5A45 | #95D5B2 |
| Rose Dawn | #F687B3 | #FBB6CE | #FFF5F5 |
| Night Sky | #0D1B2A | #1B2838 | #7C8CFF |

---

## 📐 CENTRALIZED SHADOW UTILITIES (MANDATORY)

**ALL shadow illustrations MUST use the centralized `shadow_utils.dart` for consistency!**

### Core File: `lib/features/shared/redesign/shadow_utils.dart`

This file provides:
- Consistent eye proportions (4-5% of card width)
- Consistent glow intensities
- Reusable shadow shapes
- Standard star fields, particles, and vignettes

### CRITICAL: Proportional Guidelines

| Element | Size Relative to Card Width |
|---------|---------------------------|
| **Eye size** | 4-5% of card width (`ShadowProportions.eyeSizeRatio = 0.045`) |
| **Eye spacing** | 6-10% of card width (`ShadowProportions.eyeSpacingRatio = 0.08`) |
| **Character size** | 30-50% of card (NOT larger!) |
| **Glow opacity** | 0.08-0.15 (subtle, not overwhelming) |

### How to Use in New Painters

```dart
import 'shadow_utils.dart';

class MyNewShadowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // 1. Draw environment layers
    
    // 2. Create character shape (30-50% of card)
    final characterSize = size.width * 0.4; // 40% of card
    final myPath = createMountainPath(size, peakHeight: 0.3);
    
    // 3. Draw with blending utilities
    drawShadowBlendGlow(canvas, myPath, glowColor, layers: 4, baseSpread: 4);
    drawBlendedShadow(canvas, myPath);
    
    // 4. Draw proportional eyes (ALWAYS use this!)
    drawPeekingEyesProportional(
      canvas,
      eyeCenter,
      size.width,  // Pass card width for proportional sizing
      glowColor: glowColor,
      style: EyeStyle.standard,
    );
    
    // 5. Add atmosphere
    drawStarField(canvas, size, count: 30);
    drawAtmosphericParticles(canvas, size, glowColor);
    drawVignette(canvas, size, intensity: 0.3);
  }
}
```

### Available Eye Styles

| Style | Description | Use Case |
|-------|-------------|----------|
| `EyeStyle.standard` | Normal round eyes | Default, most characters |
| `EyeStyle.sleepy` | Partially closed | Calm, restful scenes |
| `EyeStyle.curious` | Slightly upward gaze | Inquisitive characters |
| `EyeStyle.mysterious` | Half-closed | Enigmatic, wise characters |

### Available Shape Utilities

| Function | Creates |
|----------|---------|
| `createMountainPath()` | Mountain/peak silhouette |
| `createFlamePath()` | Flame/teardrop shape |
| `createMoonPath()` | Circular moon |
| `createLighthousePath()` | Lighthouse tower |
| `createFoxPath()` | Fox body and head |
| `drawFoxEars()` | Pointed fox ears |
| `drawFoxTail()` | Bushy fox tail |

---

## 📁 REFERENCE FILES

| File | Contents |
|------|----------|
| `lib/features/shared/redesign/shadow_utils.dart` | **CENTRALIZED utilities - USE THIS!** |
| `lib/features/shared/redesign/character_entry_cards.dart` | Shadow painters for Character Entry page |
| `lib/features/shared/redesign/clarification_painters.dart` | Shadow painters for Clarification page |
| `lib/features/shared/redesign/content_card.dart` | Story page card painters |

---

## ✅ CHECKLIST FOR NEW ILLUSTRATIONS

When creating a new shadow illustration:

- [ ] **Shadow is solid dark** (#0A0508 to #0A0515)
- [ ] **Peeking eyes present** with glow, white, iris, pupil, shine
- [ ] **7-9 environment layers** around the shadow
- [ ] **Environment is rich and detailed** (not empty)
- [ ] **Unique from other cards on same page** (different shadow, environment, palette, time)
- [ ] **Vignette overlay** for depth
- [ ] **No internal details in shadow** (eyes only!)
- [ ] **Card is square** with title inside at bottom

---

## 📱 DETAIL VIEW STANDARD (MANDATORY FOR ALL POPUPS)

**ALL detail views / popups across the app MUST follow this consistent 3-tab pattern:**

### ⭐ THE 3-TAB PATTERN (UNIVERSAL)

**Every card detail view uses exactly 3 tabs:**

| Tab | Icon | Purpose | Content |
|-----|------|---------|---------|
| **About** | `Icons.psychology` | Explains what this concept is | Generic description, "What is [X]?" |
| **In Your Life** | `Icons.visibility` | Shows personalized content | User-specific narrative, "How this shows up for you" |
| **Examples** | `Icons.movie_outlined` | Pop culture examples | Characters from movies/TV that embody this |

### Design Pattern

When a card is tapped, use `Navigator.push` with a full-screen `Scaffold` - NOT `showModalBottomSheet`.

### Structure

```
┌─────────────────────────────────┐
│ [X]                             │  ← Close button (top left)
│                                 │
│     [HEADER ILLUSTRATION]       │  ← 200px height, CustomPainter
│     [GRADIENT OVERLAY]          │  ← Bottom gradient for text
│     [TITLE]                     │  ← White, bold, shadows
│                                 │
├─────────────────────────────────┤
│ [About] │ [In Your Life] │ [Ex] │  ← TabBar with 3 tabs (icons + text)
├─────────────────────────────────┤
│                                 │
│     [TAB CONTENT]               │  ← Scrollable content
│     - Rounded cards (16px)      │
│     - 20px padding              │
│     - Accent-colored headers    │
│     - Icon + title rows         │
│                                 │
└─────────────────────────────────┘
```

### Tab Content Structure

#### Tab 1: About
```dart
Container(
  // Card with icon, "What is [Title]?" header
  // Generic description from config.infoText
  // Extended explanation from _getAboutDescription()
)
```

#### Tab 2: In Your Life
```dart
Container(
  // Card with icon, "How This Shows Up For You" header
  // Personalized content (the actual generated narrative)
)
```

#### Tab 3: Examples
```dart
ListView.builder(
  // List of pop culture examples
  // Each with character name, franchise, description
  // Empty state: "No examples available" with icon
)
```

### Implementation Pattern

```dart
// CORRECT: Use Navigator.push with PageRouteBuilder
void _openDetailView(BuildContext context) {
  Navigator.of(context).push(
    PageRouteBuilder(
      opaque: false,
      barrierDismissible: true,
      barrierColor: Colors.black54,
      pageBuilder: (context, animation, secondaryAnimation) => ContentDetailView(
        config: config,
        content: content,
        examples: examples,
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) => 
        SlideTransition(
          position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
            .animate(CurvedAnimation(parent: animation, curve: Curves.easeOutCubic)),
          child: child,
        ),
    ),
  );
}

// WRONG: Don't use showModalBottomSheet
// showModalBottomSheet(context: context, ...); // ❌
```

### Key Components

| Component | Specification |
|-----------|--------------|
| **Header height** | 200px |
| **Close button** | Top left, 8px padding, black50 background, 20px circular |
| **Gradient overlay** | Top: transparent, Bottom: black70, stops [0.4, 1.0] |
| **Title style** | headlineSmall, white, bold, with shadow |
| **TabBar** | **3 tabs** with icons, accent color indicator (3px weight) |
| **Tab spacing** | `SizedBox(width: 6)` between icon and text |
| **Tab content** | Rounded cards (16px), 20px padding, shadows |
| **Background** | isDark: #1A1225, light: grey.shade50 |
| **Card style** | White/dark bg, 12-16px border radius, subtle shadow |

### Available Detail Views

| View | Use Case | Tabs | File |
|------|----------|------|------|
| `ContentDetailView` | Story/Functioning cards | About, In Your Life, Examples | `content_card.dart` |
| `ArchetypeDetailView` | Archetype cards | About, In Your Life, Examples | `content_card.dart` |
| `PsychePositionDetailView` | Identity/Psyche position cards | About, In Your Life, Examples | `content_card.dart` |

### Adding New Detail Views

When creating a detail view for a new page, follow this pattern:

1. Create a `StatefulWidget` with `SingleTickerProviderStateMixin`
2. Use `TabController(length: 3, vsync: this)` — always 3 tabs
3. Include header (200px) with illustration, gradient, close button
4. Include `TabBar` with **3 tabs**: About (psychology), In Your Life (visibility), Examples (movie_outlined)
5. Implement `_buildAboutTab()`, `_buildInYourLifeTab()`, `_buildExamplesTab()`
6. Use consistent card styling: rounded corners, padding, shadows

---

## 📐 PAGE STRUCTURE

### Page Header (280-320px)

Full-width illustrated header with shadow theme.

### Sub-Header (160px) - FULL BLEED BACKGROUND REQUIRED

**ALL tab/page sub-headers MUST have a full-bleed illustrated background.**

Use the `SubHeader` widget from `sub_header.dart` with a custom `CustomPainter`.

#### Structure

```
┌─────────────────────────────────┐
│                                 │
│   [FULL-BLEED ILLUSTRATION]     │  ← Custom painter fills entire area
│   - Stars/cosmic elements       │
│   - Thematic environment        │
│   - Shadow figure silhouette    │
│                                 │
├─────────────────────────────────┤
│  [GRADIENT OVERLAY]             │  ← Bottom gradient for readability
│                                 │
│  [TITLE] ─────────────────────  │  ← White, bold, with shadow
│  [PURPOSE TEXT] ────────────── │  ← White, 90% opacity
└─────────────────────────────────┘
```

#### Available Sub-Headers

| Widget | Tab | Painter | Theme |
|--------|-----|---------|-------|
| `StorySubHeader` | Story | `StoryBackgroundPainter` | Forest + constellation arc |
| `ConstellationSubHeader` | Archetypes | `ConstellationBackgroundPainter` | Cosmic + zodiac pattern |
| `PsycheSubHeader` | Identity | `PsycheBackgroundPainter` | Layered psyche + position markers |

#### Implementation Pattern

```dart
// Pre-configured widget (preferred)
const ConstellationSubHeader(),

// Or custom usage
SubHeader(
  title: 'Your Section Title',
  purpose: 'Description text',
  backgroundPainter: MyCustomPainter(
    isDark: isDark,
    primaryColor: theme.colorScheme.primary,
    accentColor: const Color(0xFFA78BFA),
  ),
)
```

#### Custom Painter Requirements

Each sub-header painter MUST include:
1. **Deep gradient background** - Dark cosmic/atmospheric colors
2. **Nebula/atmospheric glow** - Subtle radial gradients
3. **Stars** - Scattered white dots (30-60 stars)
4. **Thematic elements** - Constellation lines, trees, waves, etc.
5. **Shadow figure** - Small silhouette related to the section theme
6. **Connection elements** - Lines/glows connecting figure to theme

#### Color Palette

| Tab | Accent Color | Background Gradient |
|-----|--------------|---------------------|
| Story | `#D97706` (Golden) | Deep purple to navy |
| Archetypes | `#A78BFA` (Violet) | Deep indigo to purple |
| Identity | `#7C3AED` (Purple) | Deep purple to navy/blue |
| Actions | `#F59E0B` (Amber) | Deep orange to crimson |

---

## 🧠 PSYCHE POSITION CARDS (IDENTITY TAB)

### Static Icon-Based Cards (Conceptual Design)

The Psyche tab uses **static iconic shapes** that visually represent each psychological position. Each icon is meaningful and instantly recognizable:

| Position | Icon | Meaning | Visual |
|----------|------|---------|--------|
| **Ego** | 👑 Crown | The ruler of self, core identity | Crown silhouette on mountain peak |
| **Persona** | 🎭 Mask | Social face, public presentation | Theatrical mask on stage |
| **Shadow** | 🏮 Lantern | Light illuminating the hidden | Lantern glowing in misty forest |
| **Feeling Function** | ❤️ Heart | Emotional center, values | Heart shape in warm garden |
| **Eros Axis** | 🔥 Flame | Passion, vital energy, connection | Flame dancing on hearth |
| **Self Direction** | 🧭 Compass | Navigation, guidance, purpose | Compass under starry sky |

### Card Features

```
┌─────────────────────────────┐
│ [Character Name Badge]   [%]│  ← User's character + Confidence
│                             │
│     [ICONIC SHAPE]          │  ← Crown/Mask/Lantern/Heart/Flame/Compass
│        [👀 EYES]            │  ← Peeking eyes embedded in icon
│                             │
│     [THEMATIC ENVIRONMENT]  │  ← Unique per position type
│─────────────────────────────│
│     [Position Title]        │  ← White text on gradient
└─────────────────────────────┘
```

### Environment by Position

| Position | Icon | Time | Environment | Weather | Mood |
|----------|------|------|-------------|---------|------|
| Ego | Crown | Dawn | Mountain peak with rising sun | Clear | Confident, ruling |
| Persona | Mask | Morning | Theater stage with spotlight | Spotlit | Social, performative |
| Shadow | Lantern | Dusk | Misty forest with fog | Misty | Mysterious, illuminating |
| Feeling Function | Heart | Golden Hour | Rolling hills garden | Warm haze | Emotional, nurturing |
| Eros Axis | Flame | Sunset | Stone hearth with embers | Warm glow | Passionate, vital |
| Self Direction | Compass | Night | Forest clearing under stars | Clear night | Guiding, purposeful |

### Why Static Icons?

1. **Meaningful** - Each icon directly represents the psychological concept
2. **Consistent** - Same visual language across all users
3. **Recognizable** - Icons are instantly identifiable
4. **Easy to draw** - Simple shapes that look great as shadows
5. **Thematic** - Environments reinforce the position's meaning

### Implementation

```dart
PsychePositionCard(
  config: PsychePositionConfigs.ego,
  characterName: 'Jack Reacher',  // From user's characters (shown as badge)
  content: 'Your personalized narrative...',
  examples: [...],
  confidence: 0.85,
)
```

### Content Grid

2-column grid of square cards, 16px gap.

---

## 🎬 SCENARIOS PAGE STANDARDS

### Page Structure

```
┌─────────────────────────────────────┐
│      Sub-Header (Full Bleed)        │ ← Crossroads scene with signposts
├─────────────────────────────────────┤
│  ┌─────────┐  ┌─────────┐           │
│  │ Theme 1 │  │ Theme 2 │           │
│  │ Card    │  │ Card    │  ← 10 themed scenario cards
│  └─────────┘  └─────────┘           │
│  ┌─────────┐  ┌─────────┐           │
│  │ Theme 3 │  │ Theme 4 │           │
│  └─────────┘  └─────────┘           │
│         ...more cards...             │
├─────────────────────────────────────┤
│     Guiding Question Card           │
└─────────────────────────────────────┘
```

### Scenario Themes (10 themes with real-life situations)

| Theme | Icon | Situations |
|-------|------|------------|
| **When The Past Returns** | Mirror | Old wounds resurface (bully encounter, ex contact, hometown return) |
| **Standing Your Ground** | Mountain | Authority challenges (boss credit, doctor dismissal, parent criticism) |
| **Opening Up** | Door (ajar) | Vulnerability required (feelings discussion, asking help, saying "I love you") |
| **In The Spotlight** | Crown | Success handling (awards, promotions, public praise) |
| **When Things Fall Apart** | Storm | Failure/setbacks (job loss, breakup, failed ventures) |
| **The Right Thing** | Crossroads | Ethical dilemmas (witness theft, truth vs. harm, bending rules) |
| **Fitting In vs. Being You** | Mask | Social pressure (political disagreement, lifestyle questioning) |
| **Crossing Thresholds** | Bridge | Life transitions (moving, marriage, parenthood, retirement) |
| **Racing Against Time** | Clock | Time pressure (deadline decisions, urgent choices) |
| **Meeting Yourself** | Mirror | Self-discovery (unexpected reactions, pattern recognition) |

### Scenario Card Icons with Rich Environments

Each card uses an **icon-based shadow** with thematic environment:

| Icon | Drawing Style | Environment |
|------|---------------|-------------|
| **Crossroads/Signpost** | Post with directional signs pointing left/right | Diverging paths, mist |
| **Mirror** | Oval frame with stand | Mystical reflection area |
| **Bridge** | Arched bridge with railings | Foggy gap to cross |
| **Door (ajar)** | Door frame with light through crack | Warmth spilling out |
| **Storm** | Cloud with lightning bolt | Dark dramatic sky |
| **Mountain** | Peak with snow cap | Challenging terrain |
| **Clock** | Classic clock face with hands | Night sky, urgency |
| **Mask** | Theatrical mask with handle | Stage/curtain ambiance |
| **Crown** | 5-point crown with jewels | Golden accent lighting |

### Time and Weather Variability

Each scenario theme has unique time/weather combination:

| Theme | Time of Day | Weather |
|-------|-------------|---------|
| Past Encounters | Dusk | Foggy |
| Authority Challenges | Noon | Stormy |
| Intimacy/Vulnerability | Dawn | Clear |
| Success/Recognition | Morning | Clear |
| Failure/Setbacks | Night | Stormy |
| Ethical Dilemmas | Dusk | Cloudy |
| Social Pressure | Afternoon | Cloudy |
| Transition/Change | Dawn | Foggy |
| Time Pressure | Night | Clear |
| Self-Discovery | Night | Clear |

### Scenario Detail View (3-Tab Pattern)

| Tab | Content |
|-----|---------|
| **About** | List of real situations in this theme + generated scenario description |
| **In Your Life** | Aligned responses ✓ + Be Wary Of ⚠ |
| **Examples** | Pop culture examples with character/franchise |

---

## 🔧 TYPOGRAPHY

| Element | Style |
|---------|-------|
| Page Title | `headlineMedium`, bold, white with shadow |
| Section Title | `titleMedium`, bold |
| Card Title | `titleMedium`, bold, white (inside card) |
| Body Text | `bodyLarge`, regular |

---

## 🎬 ANIMATION

- Duration: 200-300ms
- Curve: `Curves.easeInOut`
- Use `AnimatedContainer` for state changes
- `AnimatedSwitcher` for card transitions

---

*Last Updated: January 2026*
*Design Standard: Shadow Silhouettes with Peeking Eyes*
*Applies to: ALL cards throughout the app*
