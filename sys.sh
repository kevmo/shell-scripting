#!/bin/bash

# Mac OSX

# construct a system information page

TITLE="System Information Report for $HOSTNAME"
CURRENT_TIME=$(date +"%x %r %Z")
TIME_STAMP="Generated $CURRENT_TIME, by $USER"



report_uptime () {
    echo "<H2>System Uptime</H2>
            <pre>$(uptime)</pre>
            "
    return
}

report_disk_space () {
    echo "<h2>Disk Space Utilization</h2>
          <pre>$(df -h)</pre>
    "
    return
}

report_home_space () {
    echo "<h2>/usr/local space utilization</h2>
          <pre>$(du -sh /usr/local/*)</pre>"
    return
}

cat << _EOF_
<html>
<head>
    <title>$TITLE</title>
</head>
<body>
    <h1>$TITLE</h1>
    <p>$CURRENT_TIME</p>
    $(report_uptime)
    $(report_disk_space)
    $(report_home_space)
</body>
</html>
_EOF_