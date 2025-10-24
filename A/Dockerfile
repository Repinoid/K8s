FROM trinodb/trino:latest

USER root

# Диагностика окружения
RUN echo "=== Environment Investigation ===" && \
    cat /etc/*-release 2>/dev/null || echo "No release info" && \
    echo "=== Shells available ===" && \
    ls -la /bin/*sh /usr/bin/*sh 2>/dev/null | head -5 || echo "No shells found"

# Установка сетевых утилит в зависимости от обнаруженного пакетного менеджера
RUN if [ -x "$(command -v apk)" ]; then \
    echo "Installing via APK" && \
    apk update && apk add --no-cache \
    iputils-ping \
    bind-tools \
    curl \
    netcat-openbsd \
    iproute2; \
    elif [ -x "$(command -v apt-get)" ]; then \
    echo "Installing via APT" && \
    apt-get update && apt-get install -y \
    iputils-ping \
    dnsutils \
    curl \
    netcat \
    iproute2 \
    && rm -rf /var/lib/apt/lists/*; \
    elif [ -x "$(command -v yum)" ]; then \
    echo "Installing via YUM" && \
    yum update -y && yum install -y \
    iputils \
    bind-utils \
    curl \
    nc \
    iproute \
    && yum clean all; \
    else \
    echo "No package manager found, using multi-stage build approach"; \
    fi

# Если пакетный менеджер не найден, используем многостадийную сборку
FROM trinodb/trino:latest as final

USER root

# Попробуем скопировать минимальный набор утилит из busybox если доступен
RUN if [ -x "/bin/busybox" ]; then \
    /bin/busybox --install -s || echo "Busybox install failed"; \
    fi

# Проверяем и создаем симлинки для основных сетевых утилит
RUN for cmd in ping curl nc nslookup dig ip; do \
    which $cmd >/dev/null 2>&1 || echo "Command $cmd not available"; \
    done

# Создаем кастомные скрипты для тестирования сети если утилиты недоступны
RUN cat > /usr/local/bin/test-network.sh << 'EOF'
#!/bin/sh
echo "=== Network Diagnostics ==="
echo "Hostname: $(hostname)"
echo "IP addresses:"
ip address show 2>/dev/null || ifconfig 2>/dev/null || echo "No network tools available"
echo "=== Testing connectivity ==="
if command -v curl >/dev/null 2>&1; then
echo "Testing local Trino:"
curl -f http://localhost:8080/v1/info || echo "Trino not responding"
else
echo "curl not available"
fi
EOF

RUN chmod +x /usr/local/bin/test-network.sh

USER trino

# Проверяем доступность базовых команд при запуске
CMD ["/bin/sh", "-c", "/usr/local/bin/test-network.sh && /usr/lib/trino/bin/launcher run"]