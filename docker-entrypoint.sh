#!/bin/sh
set -e

HOST=${HOST:-"0.0.0.0"}
PORT=${PORT:-8000}
WORKERS=${WORKERS:-1}
DATA_DIR=${DATA_DIR:-/app/data}
ACCOUNTS_FILE=${ACCOUNTS_FILE:-$DATA_DIR/accounts.json}

mkdir -p "$DATA_DIR"

if [ -d "$ACCOUNTS_FILE" ]; then
    echo "Accounts path is a directory, expected a file: $ACCOUNTS_FILE" >&2
    exit 1
fi

if [ ! -f "$ACCOUNTS_FILE" ]; then
    echo "{}" > "$ACCOUNTS_FILE"
fi

chown appuser:appuser "$ACCOUNTS_FILE" 2>/dev/null || true
chown appuser:appuser "$DATA_DIR" 2>/dev/null || true

echo "Starting Outlook Email API service..."
echo "Configuration:"
echo "  - Host: $HOST"
echo "  - Port: $PORT"
echo "  - Workers: $WORKERS"
echo "  - Data dir: $DATA_DIR"
echo "  - Accounts file: $ACCOUNTS_FILE"

exec python main.py
