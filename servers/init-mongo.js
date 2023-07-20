dbAdmin = db.getSiblingDB("admin");
dbAdmin.createUser({
    user: "root",
    pwd: "123456",
    roles: [{ role: "userAdminAnyDatabase", db: "admin" }],
    mechanisms: ["SCRAM-SHA-1"],
});

// Authenticate user
dbAdmin.auth({
    user: "amasona_clone",
    pwd: "1234",
    mechanisms: ["SCRAM-SHA-1"],
    roles: [{ role: "userAdminAnyDatabase", db: "amasona" }, { role: "readWrite", db: "nextdb" }],
    digestPassword: true,
});


// Create DB and collection
db = new Mongo().getDB("amasona");
db.getSiblingDB('amasona');
db.createUser({
    user: "amasona_user",
    pwd: "1234",
    roles: ["readWrite"],
});

db.createCollection("users", { capped: false });