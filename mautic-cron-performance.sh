#!/bin/bash
# ----------------------------------------------------------------------
# TAVARDT Elite Mautic Cron Automation
# ----------------------------------------------------------------------
# Instructions:
# 1. Place this file in your server (e.g., /home/user/scripts/)
# 2. Make it executable: chmod +x mautic-cron-performance.sh
# 3. Add to crontab to run every 5 minutes:
#    */5 * * * * /home/user/scripts/mautic-cron-performance.sh >/dev/null 2>&1
# ----------------------------------------------------------------------

# Configuration
MAUTIC_DIR="/var/www/html/mautic"
PHP_BIN="/usr/bin/php"
LOG_FILE="/var/log/mautic_cron_performance.log"

# Verify Mautic directory
if [ ! -d "$MAUTIC_DIR/bin" ]; then
    echo "Error: Mautic bin directory not found at $MAUTIC_DIR"
    exit 1
fi

echo "[$(date)] Starting Mautic Background Jobs" >> $LOG_FILE

# 1. Update Segments (Heavy DB operation)
# Runs first to ensure leads are in the correct buckets before campaigns process them
$PHP_BIN $MAUTIC_DIR/bin/console mautic:segments:update --batch-limit=900 >> $LOG_FILE 2>&1

# 2. Update Campaigns (Triggers decisions and actions based on segments)
$PHP_BIN $MAUTIC_DIR/bin/console mautic:campaigns:update --batch-limit=300 >> $LOG_FILE 2>&1

# 3. Execute Campaign Events (Triggers scheduled emails and integrations)
$PHP_BIN $MAUTIC_DIR/bin/console mautic:campaigns:trigger >> $LOG_FILE 2>&1

# 4. Process Email Queue (Sends the actual emails, 200 per batch to prevent IP blacklisting)
$PHP_BIN $MAUTIC_DIR/bin/console mautic:emails:send --message-limit=200 >> $LOG_FILE 2>&1

# 5. Broadcasts (For one-off segment emails)
$PHP_BIN $MAUTIC_DIR/bin/console mautic:broadcasts:send --batch=100 >> $LOG_FILE 2>&1

echo "[$(date)] Mautic Background Jobs Completed" >> $LOG_FILE
