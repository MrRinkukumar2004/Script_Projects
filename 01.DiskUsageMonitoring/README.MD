
# Disk Usage Check

## Overview

The **Disk Usage Check** script is a simple yet effective tool for monitoring disk usage on a Unix-like system. It checks the disk usage of all mounted filesystems and generates a warning if the usage exceeds a specified threshold. This can help in proactive system management by alerting you to potential disk space issues before they become critical.

## Features

- Monitors disk usage across all mounted filesystems.
- Excludes certain filesystems like `tmpfs` and `cdrom` to avoid unnecessary alerts.
- Configurable threshold to determine when a warning should be issued.
- Outputs warnings to the console for easy monitoring.

## Prerequisites

- Bash shell (`/bin/bash`)
- `df`, `grep`, `awk`, and `cut` utilities (typically pre-installed on most Unix-like systems)

## Installation

1. **Clone or Download the Script**

   You can download the script directly or clone it from your repository.

   ```bash
   git clone https://example.com/your-repository.git
   ```

2. **Save the Script**

   Save the script as `disk_usage_check.sh`.

3. **Make the Script Executable**

   Change the file permissions to make the script executable.

   ```bash
   chmod +x disk_usage_check.sh
   ```

## Configuration

- **Threshold**: The script checks if disk usage exceeds a certain percentage threshold. You can modify this threshold by editing the `THERESHOLD` variable in the script.

   ```bash
   THRESHOLD=80
   ```

   Set `THRESHOLD` to your desired percentage (e.g., 90 for 90%).

## Usage

1. **Run the Script**

   Execute the script in your terminal.

   ```bash
   ./disk_usage_check.sh
   ```

2. **Output**

   The script will output warnings if any filesystem's usage exceeds the specified threshold. Example output:

   ```
   Warning: Disk usage on /dev/sda1 is at 85%
   ```

## Script Details

```bash
#!/bin/bash

THRESHOLD=80

# CHECK DISK USAGE AND PRINT A WARNING IF USAGE IS ABOVE THE THRESHOLD
df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1}' | while read output; do
    usage=$(echo $output | awk '{print $1}' | cut -d'%' -f1)
    partition=$(echo $output | awk '{print $2}')
    if [ $usage -ge $THRESHOLD ]; then
        echo "Warning: Disk usage on $partition is at ${usage}%"
    fi
done
```

### Key Components

- `df -H`: Lists disk space usage in human-readable format.
- `grep -vE '^Filesystem|tmpfs|cdrom'`: Filters out unnecessary filesystems from the output.
- `awk '{ print $5 " " $1}'`: Extracts the disk usage percentage and filesystem.
- `while read output; do ... done`: Processes each line of the output.
- `if [ $usage -ge $THRESHOLD ]; then ... fi`: Checks if the usage exceeds the threshold and prints a warning.

## Troubleshooting

- **No Output**: Ensure that the script has execution permissions and is run in a Unix-like environment with the necessary utilities installed.
- **Incorrect Output**: Verify the `THERESHOLD` variable and ensure that `df`, `grep`, `awk`, and `cut` are available and functioning correctly.

