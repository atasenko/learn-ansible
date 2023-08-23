### [Плейбук](site.yml) имеет три роли:
#### Install Clickhouse со следующими handlers и tasks:  
- handler "Start clickhouse service" запускает (или перезапускает) сервис clickhouse-server.  
- task "Add clickhouse GPG key" добавляет GPG ключ репозитория CLickhouse.  
- task "Add clickhouse repo" добавляет в систему репозиторий Clickhouse.  
- task "Install clickhouse packages" устанавливает при помощи модуля apt перечисленные пакеты Clickhouse и уведомляет handler о необходимости запуска.  
- task "Create database" запускает команду clickhouse-client создающую базу данных.  

#### Install Vector со следующими handlers и tasks:  
- handler "Start Vector service" запускает (или перезапускает) сервис vector.  
- task "Download Vector deb" скачивает дистрибутив vector из указанного в переменной места.  
- task "Install Vector" устанавливает скачанный дистрибутив.  
- task "Build Vector config" собирает конфиг vector из [шаблона](vector.yml.tpl) и уведомляет handler о необходимости запуска.  

#### Install Lighthouse со следующими handlers и tasks:  
- handler "Start Nginx service" запускает (или перезапускает) сервис nginx.  
- task "Install git and Nginx" устанавливает необходимые для запуска Lighthouse пакеты (git и nginx).  
- task "Clone Lighthouse" клонирует репозиторий Lighthouse в директорию веб-сервера nginx.  
- task "Build Nginx config for Lighthouse" собирает конфиг nginx для запуска Lighthouse и уведомляет handler о необходимости запуска.  