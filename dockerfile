FROM jlesage/firefox

# Disable connection blocking
ENV NOVNC_WHITELIST="*"
RUN echo "blacklist = " > /etc/xvnc/xvnc.conf

# Optimize for Render
ENV DISABLE_IPV6=1
ENV ENABLE_CJK_FONT=1
ENV NOVNC_HTTP_PORT=5800

EXPOSE 5800
