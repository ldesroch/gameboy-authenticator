# Gameboy Authenticator

## Disclaimer
This project is for demonstration purpose only an is not intended to go to production in any way.
The prject is provided "AS IS" without any warranty and may contain dead code and ugly things. (you are warned)

## Proof of concept
Shared secret is hardcoded in both the gameboy rom and the keycloak authenticator.
A cleaner implementation could be done by generating the secret within keycloak then storing it in user attributes.
Then replacing the secret in the rom dynamically.

## References
https://gbdev.io/
https://github.com/gbdk-2020/gbdk-2020
https://www.keycloak.org/


## Slides

see PDF ./slides/slides.pdf


## Compile project

### rom gameboy
```bash
cd ./gameboy/minimalrom/
make 
```

### Authenticator

```bash
cd ./
mvn install
```

## Launch


### Gameboy

Run the rom with the emulator, feel free to use yours or your real gameboy.

```bash
./gameboy/sameboy.exe ./gameboy/minimalrom/bin/authenticator.gb
```

Prior to type the requested keycode you must unlock the rom with the konami code + "start" ;)
https://fr.wikipedia.org/wiki/Code_Konami

### Keycloak

Import test realm then run it.

```bash
docker compose --profile import up
docker compose --profile import down
docker compose --profile run up -d
docker compose --profile run logs --follow
```

## Test

Got to http://localhost:8080/realms/test/account/
Try to login with username "test".
See logs or use gbrom to get the right code.

See slides and demo vidéo for more informations