#!/bin/bash

echo "🚀 LUMEN_OS — INIT START"

# create root
mkdir lumen_os && cd lumen_os

echo "📁 Tworzenie struktury katalogów..."

mkdir -p core/state
mkdir -p core/archetypes
mkdir -p core/intent

mkdir -p voice/rtp
mkdir -p voice/vad
mkdir -p voice/stt
mkdir -p voice/tts

mkdir -p swarm/nodes
mkdir -p swarm/scheduler

mkdir -p pmg/graph
mkdir -p pmg/api

mkdir -p project_brain/maps
mkdir -p project_brain/timelines

mkdir -p ui/dashboard
mkdir -p ui/components
mkdir -p ui/styles

mkdir -p api/state
mkdir -p api/voice
mkdir -p api/swarm
mkdir -p api/pmg

mkdir docs

echo "📄 Generowanie podstawowych plików..."

# core files
cat > core/engine.ts << 'EOF'
export const EmbryoKernel = {
  state: {},
  process(input: string) {
    return { output: "LUMEN_OS: kernel active", input };
  }
};
EOF

cat > core/state/index.ts << 'EOF'
export const systemState = {
  mode: "idle",
  archetype: "wolf"
};
EOF

cat > core/state/machine.ts << 'EOF'
export function stateMachine(intent: string, archetype: string) {
  return `Intent: ${intent} | Archetype: ${archetype}`;
}
EOF

cat > core/intent/parser.ts << 'EOF'
export function parseIntent(input: string) {
  return input.toLowerCase().trim();
}
EOF

cat > core/intent/router.ts << 'EOF'
export function chooseArchetype(text: string) {
  if (/plan/i.test(text)) return "strategist";
  if (/brat|mordo/i.test(text)) return "brother";
  if (/sens|meta/i.test(text)) return "oracle";
  return "wolf";
}
EOF

# voice files
cat > voice/pipeline.ts << 'EOF'
import { EmbryoKernel } from "../core/engine";
export async function voiceLoop(input: string) {
  return EmbryoKernel.process(input);
}
EOF

# swarm
cat > swarm/router.ts << 'EOF'
export function swarmRoute(task: string) {
  return "swarm-node-selected";
}
EOF

# pmg
cat > pmg/index.ts << 'EOF'
export const PMG = {
  add(node) { return node; }
};
EOF

# UI
cat > ui/dashboard/state.tsx << 'EOF'
export default function StatePanel() {
  return <div className="p-4 text-white">System State Panel</div>;
}
EOF

# API
cat > api/state/route.ts << 'EOF'
export async function GET() {
  return Response.json({ status: "lumen os running" });
}
EOF

# docs
cat > docs/architecture.md << 'EOF'
# LUMEN_OS Architecture
High-level system overview.
EOF

echo "🔧 Inicjacja repozytorium git..."

git init
git add .
git commit -m "Initial LUMEN_OS system structure"

echo "✅ Projekt gotowy do wrzucenia na GitHub!"
echo "➡️  Uruchom: git remote add origin <URL>"
echo "➡️  A potem: git push -u origin main"

echo "🔥 LUMEN_OS — INIT COMPLETE"