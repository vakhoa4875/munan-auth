docker exec keycloak_app /opt/keycloak/bin/kc.sh export --dir /tmp --realm munan --users realm_file && \
docker cp keycloak_app:/tmp/munan-realm.json ~/munan-auth/realm-export.json