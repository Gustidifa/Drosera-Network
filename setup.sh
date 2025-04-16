#!/bin/bash
set -e

echo "🛠️ Menjalankan setup.sh di Gitpod..."

# Install Foundry
echo "📦 Install Foundry..."
curl -L https://foundry.paradigm.xyz | bash
source ~/.bashrc || true
foundryup

# Install Drosera CLI
echo "📦 Install Drosera CLI..."
curl -L https://app.drosera.io/install | bash
droseraup

# Prompt private key (harus manual saat pertama kali)
echo "0x097dd717297384425b28edfdf80708e0e38bc8272271940f44ac27be70796adb"
read PRIVATE_KEY

# Buat drosera.toml
cat <<EOF > drosera.toml
private_key = "0x097dd717297384425b28edfdf80708e0e38bc8272271940f44ac27be70796adb"
response_contract = "0xdA890040Af0533D98B9F5f8FE3537720ABf83B0C"
response_function = "helloworld(string)"
EOF

# Build dan apply
echo "🏗️ Build dan deploy trap..."
forge build
DROSERA_PRIVATE_KEY=0x097dd717297384425b28edfdf80708e0e38bc8272271940f44ac27be70796adb drosera apply

echo "✅ Drosera Network siap digunakan!"
