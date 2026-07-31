#!/usr/bin/env bash
# backup.sh — snapshot this repo as a timestamped zip to BACKUP_DIR.
# Usage: ./backup.sh [--keep N]   (default: keep last 10 backups)
set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

CATALOG_NAME="" # change name
BACKUP_DIR="/${CATALOG_NAME}" # set to backup path

TIMESTAMP="$(date +%Y%m%d-%H%M)"
OUTFILE="$BACKUP_DIR/${CATALOG_NAME}-backup-${TIMESTAMP}.zip"
KEEP=10

# Parse --keep argument
while [[ $# -gt 0 ]]; do
  case $1 in
    --keep) KEEP="$2"; shift 2 ;;
    *) echo "Unknown argument: $1"; exit 1 ;;
  esac
done

# Ensure backup directory exists
mkdir -p "$BACKUP_DIR"

echo "Backing up: $REPO_DIR"
echo "       To:  $OUTFILE"

# Create zip, excluding macOS noise
REPO_BASENAME="$(basename "$REPO_DIR")"
cd "$REPO_DIR/.."
zip -r --quiet "$OUTFILE" "${REPO_BASENAME}/" \
  --exclude "${REPO_BASENAME}/.DS_Store" \
  --exclude "${REPO_BASENAME}/**/.DS_Store" \
  --exclude "${REPO_BASENAME}/.git/objects/pack/*.idx" \
  --exclude "${REPO_BASENAME}/.git/objects/pack/*.pack"

SIZE=$(du -sh "$OUTFILE" | cut -f1)
echo "Done. Archive size: $SIZE"

# Prune old backups, keeping the $KEEP most recent
EXISTING=$(ls -1t "$BACKUP_DIR"/${CATALOG_NAME}-backup-*.zip 2>/dev/null | wc -l | tr -d ' ')
if (( EXISTING > KEEP )); then
  TO_DELETE=$(( EXISTING - KEEP ))
  echo "Pruning $TO_DELETE old backup(s) (keeping last $KEEP)..."
  ls -1t "$BACKUP_DIR"/${CATALOG_NAME}-backup-*.zip | tail -n "$TO_DELETE" | xargs rm --
fi

echo "Backups in $BACKUP_DIR:"
ls -1t "$BACKUP_DIR"/${CATALOG_NAME}-backup-*.zip | head -5
