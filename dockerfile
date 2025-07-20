FROM jlesage/firefox

# 1. Disable connection blocking (correct method)
ENV NOVNC_WHITELIST="*"  # Allows all IPs
ENV DISABLE_IPV6=1       # Prevents IPv6 issues on Render

# 2. Remove the invalid line (delete the RUN command)
#    The jlesage/firefox image auto-configures XVNC without manual file edits.

# 3. Force HTTP mode (Render prefers HTTP over raw VNC)
ENV ENABLE_CJK_FONT=1    # Fixes font rendering
EXPOSE 5800              # Web interface port

# 4. Optional: Set a password
ENV LOGIN_USERNAME=admin24
ENV LOGIN_PASSWORD=yourpassword2024
