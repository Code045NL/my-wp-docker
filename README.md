# WordPress Docker Multi-Install Setup

## Setup

1. Zorg dat `/home/wp-core` bestaat en de WordPress core bevat (zonder `wp-config.php` en zonder `wp-content`).

2. Maak per installatie een wp-content map aan, bijvoorbeeld `/home/wp-core/install-1/wp-content`.

3. Genereer een `.env` bestand voor de installatie:

```bash
./generate-env.sh install-1
