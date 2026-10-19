#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
mkdir -p assets/photos
curl --fail --location --retry 3 --connect-timeout 15 --max-time 90 --silent --show-error "https://images.unsplash.com/photo-1497366811353-6870744d04b2?auto=format&fit=crop&w=1500&q=85" -o "assets/photos/corporate.jpg"
test $(stat -c %s "assets/photos/corporate.jpg") -gt 10000 || { echo "Image failed: corporate"; exit 1; }
curl --fail --location --retry 3 --connect-timeout 15 --max-time 90 --silent --show-error "https://images.unsplash.com/photo-1460925895917-afdab827c52f?auto=format&fit=crop&w=1500&q=85" -o "assets/photos/investment.jpg"
test $(stat -c %s "assets/photos/investment.jpg") -gt 10000 || { echo "Image failed: investment"; exit 1; }
curl --fail --location --retry 3 --connect-timeout 15 --max-time 90 --silent --show-error "https://images.unsplash.com/photo-1551288049-bebda4e38f71?auto=format&fit=crop&w=1500&q=85" -o "assets/photos/data.jpg"
test $(stat -c %s "assets/photos/data.jpg") -gt 10000 || { echo "Image failed: data"; exit 1; }
curl --fail --location --retry 3 --connect-timeout 15 --max-time 90 --silent --show-error "https://images.unsplash.com/photo-1450101499163-c8848c66ca85?auto=format&fit=crop&w=1500&q=85" -o "assets/photos/contracts.jpg"
test $(stat -c %s "assets/photos/contracts.jpg") -gt 10000 || { echo "Image failed: contracts"; exit 1; }
curl --fail --location --retry 3 --connect-timeout 15 --max-time 90 --silent --show-error "https://images.unsplash.com/photo-1521737711867-e3b97375f902?auto=format&fit=crop&w=1500&q=85" -o "assets/photos/governance.jpg"
test $(stat -c %s "assets/photos/governance.jpg") -gt 10000 || { echo "Image failed: governance"; exit 1; }
curl --fail --location --retry 3 --connect-timeout 15 --max-time 90 --silent --show-error "https://images.unsplash.com/photo-1503387762-592deb58ef4e?auto=format&fit=crop&w=1500&q=85" -o "assets/photos/disputes.jpg"
test $(stat -c %s "assets/photos/disputes.jpg") -gt 10000 || { echo "Image failed: disputes"; exit 1; }
curl --fail --location --retry 3 --connect-timeout 15 --max-time 90 --silent --show-error "https://images.unsplash.com/photo-1497366754035-f200968a6e72?auto=format&fit=crop&w=1500&q=85" -o "assets/photos/about.jpg"
test $(stat -c %s "assets/photos/about.jpg") -gt 10000 || { echo "Image failed: about"; exit 1; }
curl --fail --location --retry 3 --connect-timeout 15 --max-time 90 --silent --show-error "https://images.unsplash.com/photo-1556761175-b413da4baf72?auto=format&fit=crop&w=1500&q=85" -o "assets/photos/practice.jpg"
test $(stat -c %s "assets/photos/practice.jpg") -gt 10000 || { echo "Image failed: practice"; exit 1; }
curl --fail --location --retry 3 --connect-timeout 15 --max-time 90 --silent --show-error "https://images.unsplash.com/photo-1497366858526-0766cadbe8fa?auto=format&fit=crop&w=1500&q=85" -o "assets/photos/founder.jpg"
test $(stat -c %s "assets/photos/founder.jpg") -gt 10000 || { echo "Image failed: founder"; exit 1; }
curl --fail --location --retry 3 --connect-timeout 15 --max-time 90 --silent --show-error "https://images.unsplash.com/photo-1551434678-e076c223a692?auto=format&fit=crop&w=1500&q=85" -o "assets/photos/insights.jpg"
test $(stat -c %s "assets/photos/insights.jpg") -gt 10000 || { echo "Image failed: insights"; exit 1; }
curl --fail --location --retry 3 --connect-timeout 15 --max-time 90 --silent --show-error "https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?auto=format&fit=crop&w=1500&q=85" -o "assets/photos/contact.jpg"
test $(stat -c %s "assets/photos/contact.jpg") -gt 10000 || { echo "Image failed: contact"; exit 1; }
curl --fail --location --retry 3 --connect-timeout 15 --max-time 90 --silent --show-error "https://images.unsplash.com/photo-1497366216548-37526070297c?auto=format&fit=crop&w=1500&q=85" -o "assets/photos/privacy.jpg"
test $(stat -c %s "assets/photos/privacy.jpg") -gt 10000 || { echo "Image failed: privacy"; exit 1; }
python3 - <<'PY2'
from pathlib import Path
for file in [Path('index.html'),Path('404.html'),*Path('.').glob('*/index.html')]:
 s=file.read_text()
 s=s.replace("https://images.unsplash.com/photo-1497366811353-6870744d04b2?auto=format&fit=crop&w=1500&q=85", "/assets/photos/corporate.jpg")
 s=s.replace("https://images.unsplash.com/photo-1460925895917-afdab827c52f?auto=format&fit=crop&w=1500&q=85", "/assets/photos/investment.jpg")
 s=s.replace("https://images.unsplash.com/photo-1551288049-bebda4e38f71?auto=format&fit=crop&w=1500&q=85", "/assets/photos/data.jpg")
 s=s.replace("https://images.unsplash.com/photo-1450101499163-c8848c66ca85?auto=format&fit=crop&w=1500&q=85", "/assets/photos/contracts.jpg")
 s=s.replace("https://images.unsplash.com/photo-1521737711867-e3b97375f902?auto=format&fit=crop&w=1500&q=85", "/assets/photos/governance.jpg")
 s=s.replace("https://images.unsplash.com/photo-1503387762-592deb58ef4e?auto=format&fit=crop&w=1500&q=85", "/assets/photos/disputes.jpg")
 s=s.replace("https://images.unsplash.com/photo-1497366754035-f200968a6e72?auto=format&fit=crop&w=1500&q=85", "/assets/photos/about.jpg")
 s=s.replace("https://images.unsplash.com/photo-1556761175-b413da4baf72?auto=format&fit=crop&w=1500&q=85", "/assets/photos/practice.jpg")
 s=s.replace("https://images.unsplash.com/photo-1497366858526-0766cadbe8fa?auto=format&fit=crop&w=1500&q=85", "/assets/photos/founder.jpg")
 s=s.replace("https://images.unsplash.com/photo-1551434678-e076c223a692?auto=format&fit=crop&w=1500&q=85", "/assets/photos/insights.jpg")
 s=s.replace("https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?auto=format&fit=crop&w=1500&q=85", "/assets/photos/contact.jpg")
 s=s.replace("https://images.unsplash.com/photo-1497366216548-37526070297c?auto=format&fit=crop&w=1500&q=85", "/assets/photos/privacy.jpg")
 file.write_text(s)
print('Downloaded and linked all locally hosted professional photographs.')
PY2
