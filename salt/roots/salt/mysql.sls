mysql:
  pkg:
    - installed
    - names:
      - mysql-server
      - libapache2-mod-auth-mysql
      - php5-mysql
  service:
    - running
