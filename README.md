# Autenticazione JWT in Laravel con Docker

Questo progetto è un'applicazione Laravel che fornisce autenticazione JWT. Dopo il login con username e password, viene generato un token che può essere utilizzato per accedere a un endpoint API protetto. Il progetto è dockerizzato per una facile configurazione e distribuzione.

## Caratteristiche

- Applicazione web basata su Laravel
- Autenticazione JWT
- Ambiente dockerizzato
- Script preconfigurato `docker.sh` per la gestione dei container Docker

## Configurazione e Installazione

### Prerequisiti

- Docker
- Docker Compose

### Passaggi per l'Installazione

1. **Clona la Repository:**

   ```bash
   git clone https://github.com/vincenzopirozzideveloper/laravel_project.git
   cd laravel_project
   ```

2. **Costruisci le Immagini Docker:**

   ```bash
   ./docker.sh build
   ```

3. **Avvia i Container Docker:**

   ```bash
   ./docker.sh up
   ```

   Questo comando:
   - Costruirà le immagini Docker
   - Avvierà i container Docker
   - Installerà le dipendenze necessarie
   - Eseguirà le migrazioni del database

## Utilizzo

### Login per Ottenere il Token

Esegui una richiesta POST a `http://localhost:8000/api/login` con il seguente body:

```json
{
  "user": "root",
  "password": "password"
}
```

Riceverai un token JWT nella risposta.

### Accesso all'Endpoint Protetto

Esegui una richiesta GET a `http://127.0.0.1:8000/api/proxy` con il seguente header:

```
Authorization: Bearer IL_TUO_JWT_TOKEN
```

Sostituisci `IL_TUO_JWT_TOKEN` con il token ottenuto dalla richiesta di login.

## Gestione Docker

Lo script `docker.sh` è fornito per gestire facilmente i container Docker.

### Comandi

- **Costruisci le Immagini Docker:**

  ```bash
  ./docker.sh build
  ```

- **Avvia i Container Docker:**

  ```bash
  ./docker.sh up
  ```

- **Ferma i Container Docker:**

  ```bash
  ./docker.sh down
  ```

- **Riavvia i Container Docker:**

  ```bash
  ./docker.sh restart
  ```

- **Mostra i Log dei Container Docker:**

  ```bash
  ./docker.sh logs
  ```

- **Accedi alla Shell Bash del Container App:**

  ```bash
  ./docker.sh bash
  ```

---

Questo README fornisce una panoramica dettagliata del progetto, spiegando come configurarlo, eseguirlo e utilizzare le funzionalità principali.
