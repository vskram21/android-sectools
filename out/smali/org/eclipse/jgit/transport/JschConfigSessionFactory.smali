.class public abstract Lorg/eclipse/jgit/transport/JschConfigSessionFactory;
.super Lorg/eclipse/jgit/transport/SshSessionFactory;
.source "JschConfigSessionFactory.java"


# instance fields
.field private final byIdentityFile:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/jcraft/jsch/JSch;",
            ">;"
        }
    .end annotation
.end field

.field private config:Lorg/eclipse/jgit/transport/OpenSshConfig;

.field private defaultJSch:Lcom/jcraft/jsch/JSch;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 81
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/SshSessionFactory;-><init>()V

    .line 82
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/transport/JschConfigSessionFactory;->byIdentityFile:Ljava/util/Map;

    return-void
.end method

.method private createSession(Lorg/eclipse/jgit/transport/CredentialsProvider;Lorg/eclipse/jgit/util/FS;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILorg/eclipse/jgit/transport/OpenSshConfig$Host;)Lcom/jcraft/jsch/Session;
    .locals 10
    .parameter "credentialsProvider"
    .parameter "fs"
    .parameter "user"
    .parameter "pass"
    .parameter "host"
    .parameter "port"
    .parameter "hc"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 175
    move-object v1, p0

    move-object/from16 v2, p7

    move-object v3, p3

    move-object v4, p5

    move/from16 v5, p6

    move-object v6, p2

    invoke-virtual/range {v1 .. v6}, Lorg/eclipse/jgit/transport/JschConfigSessionFactory;->createSession(Lorg/eclipse/jgit/transport/OpenSshConfig$Host;Ljava/lang/String;Ljava/lang/String;ILorg/eclipse/jgit/util/FS;)Lcom/jcraft/jsch/Session;

    move-result-object v8

    .line 178
    .local v8, session:Lcom/jcraft/jsch/Session;
    const-string v1, "MaxAuthTries"

    const-string v2, "1"

    invoke-virtual {v8, v1, v2}, Lcom/jcraft/jsch/Session;->setConfig(Ljava/lang/String;Ljava/lang/String;)V

    .line 179
    if-eqz p4, :cond_0

    .line 180
    invoke-virtual {v8, p4}, Lcom/jcraft/jsch/Session;->setPassword(Ljava/lang/String;)V

    .line 181
    :cond_0
    invoke-virtual/range {p7 .. p7}, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->getStrictHostKeyChecking()Ljava/lang/String;

    move-result-object v9

    .line 183
    .local v9, strictHostKeyCheckingPolicy:Ljava/lang/String;
    if-eqz v9, :cond_1

    .line 184
    const-string v1, "StrictHostKeyChecking"

    invoke-virtual {v8, v1, v9}, Lcom/jcraft/jsch/Session;->setConfig(Ljava/lang/String;Ljava/lang/String;)V

    .line 186
    :cond_1
    invoke-virtual/range {p7 .. p7}, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->getPreferredAuthentications()Ljava/lang/String;

    move-result-object v7

    .line 187
    .local v7, pauth:Ljava/lang/String;
    if-eqz v7, :cond_2

    .line 188
    const-string v1, "PreferredAuthentications"

    invoke-virtual {v8, v1, v7}, Lcom/jcraft/jsch/Session;->setConfig(Ljava/lang/String;Ljava/lang/String;)V

    .line 189
    :cond_2
    if-eqz p1, :cond_4

    invoke-virtual/range {p7 .. p7}, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->isBatchMode()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/CredentialsProvider;->isInteractive()Z

    move-result v1

    if-nez v1, :cond_4

    .line 191
    :cond_3
    new-instance v1, Lorg/eclipse/jgit/transport/CredentialsProviderUserInfo;

    invoke-direct {v1, v8, p1}, Lorg/eclipse/jgit/transport/CredentialsProviderUserInfo;-><init>(Lcom/jcraft/jsch/Session;Lorg/eclipse/jgit/transport/CredentialsProvider;)V

    invoke-virtual {v8, v1}, Lcom/jcraft/jsch/Session;->setUserInfo(Lcom/jcraft/jsch/UserInfo;)V

    .line 194
    :cond_4
    move-object/from16 v0, p7

    invoke-virtual {p0, v0, v8}, Lorg/eclipse/jgit/transport/JschConfigSessionFactory;->configure(Lorg/eclipse/jgit/transport/OpenSshConfig$Host;Lcom/jcraft/jsch/Session;)V

    .line 195
    return-object v8
.end method

.method private static identities(Lcom/jcraft/jsch/JSch;Lorg/eclipse/jgit/util/FS;)V
    .locals 4
    .parameter "sch"
    .parameter "fs"

    .prologue
    .line 302
    invoke-virtual {p1}, Lorg/eclipse/jgit/util/FS;->userHome()Ljava/io/File;

    move-result-object v0

    .line 303
    .local v0, home:Ljava/io/File;
    if-nez v0, :cond_1

    .line 311
    :cond_0
    :goto_0
    return-void

    .line 305
    :cond_1
    new-instance v1, Ljava/io/File;

    const-string v2, ".ssh"

    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 306
    .local v1, sshdir:Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 307
    new-instance v2, Ljava/io/File;

    const-string v3, "identity"

    invoke-direct {v2, v1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {p0, v2}, Lorg/eclipse/jgit/transport/JschConfigSessionFactory;->loadIdentity(Lcom/jcraft/jsch/JSch;Ljava/io/File;)V

    .line 308
    new-instance v2, Ljava/io/File;

    const-string v3, "id_rsa"

    invoke-direct {v2, v1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {p0, v2}, Lorg/eclipse/jgit/transport/JschConfigSessionFactory;->loadIdentity(Lcom/jcraft/jsch/JSch;Ljava/io/File;)V

    .line 309
    new-instance v2, Ljava/io/File;

    const-string v3, "id_dsa"

    invoke-direct {v2, v1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {p0, v2}, Lorg/eclipse/jgit/transport/JschConfigSessionFactory;->loadIdentity(Lcom/jcraft/jsch/JSch;Ljava/io/File;)V

    goto :goto_0
.end method

.method private static isAuthenticationCanceled(Lcom/jcraft/jsch/JSchException;)Z
    .locals 2
    .parameter "e"

    .prologue
    .line 169
    invoke-virtual {p0}, Lcom/jcraft/jsch/JSchException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/jcraft/jsch/JSchException;->getMessage()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Auth cancel"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static isAuthenticationFailed(Lcom/jcraft/jsch/JSchException;)Z
    .locals 2
    .parameter "e"

    .prologue
    .line 165
    invoke-virtual {p0}, Lcom/jcraft/jsch/JSchException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/jcraft/jsch/JSchException;->getMessage()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Auth fail"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static knownHosts(Lcom/jcraft/jsch/JSch;Lorg/eclipse/jgit/util/FS;)V
    .locals 5
    .parameter "sch"
    .parameter "fs"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 283
    invoke-virtual {p1}, Lorg/eclipse/jgit/util/FS;->userHome()Ljava/io/File;

    move-result-object v0

    .line 284
    .local v0, home:Ljava/io/File;
    if-nez v0, :cond_0

    .line 299
    :goto_0
    return-void

    .line 286
    :cond_0
    new-instance v2, Ljava/io/File;

    new-instance v3, Ljava/io/File;

    const-string v4, ".ssh"

    invoke-direct {v3, v0, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    const-string v4, "known_hosts"

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 288
    .local v2, known_hosts:Ljava/io/File;
    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 290
    .local v1, in:Ljava/io/FileInputStream;
    :try_start_1
    invoke-virtual {p0, v1}, Lcom/jcraft/jsch/JSch;->setKnownHosts(Ljava/io/InputStream;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 292
    :try_start_2
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V

    goto :goto_0

    .line 294
    .end local v1           #in:Ljava/io/FileInputStream;
    :catch_0
    move-exception v3

    goto :goto_0

    .line 292
    .restart local v1       #in:Ljava/io/FileInputStream;
    :catchall_0
    move-exception v3

    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V

    throw v3
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 296
    .end local v1           #in:Ljava/io/FileInputStream;
    :catch_1
    move-exception v3

    goto :goto_0
.end method

.method private static loadIdentity(Lcom/jcraft/jsch/JSch;Ljava/io/File;)V
    .locals 1
    .parameter "sch"
    .parameter "priv"

    .prologue
    .line 314
    invoke-virtual {p1}, Ljava/io/File;->isFile()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 316
    :try_start_0
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/jcraft/jsch/JSch;->addIdentity(Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/jcraft/jsch/JSchException; {:try_start_0 .. :try_end_0} :catch_0

    .line 321
    :cond_0
    :goto_0
    return-void

    .line 317
    :catch_0
    move-exception v0

    goto :goto_0
.end method


# virtual methods
.method protected abstract configure(Lorg/eclipse/jgit/transport/OpenSshConfig$Host;Lcom/jcraft/jsch/Session;)V
.end method

.method protected createDefaultJSch(Lorg/eclipse/jgit/util/FS;)Lcom/jcraft/jsch/JSch;
    .locals 1
    .parameter "fs"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 276
    new-instance v0, Lcom/jcraft/jsch/JSch;

    invoke-direct {v0}, Lcom/jcraft/jsch/JSch;-><init>()V

    .line 277
    .local v0, jsch:Lcom/jcraft/jsch/JSch;
    invoke-static {v0, p1}, Lorg/eclipse/jgit/transport/JschConfigSessionFactory;->knownHosts(Lcom/jcraft/jsch/JSch;Lorg/eclipse/jgit/util/FS;)V

    .line 278
    invoke-static {v0, p1}, Lorg/eclipse/jgit/transport/JschConfigSessionFactory;->identities(Lcom/jcraft/jsch/JSch;Lorg/eclipse/jgit/util/FS;)V

    .line 279
    return-object v0
.end method

.method protected createSession(Lorg/eclipse/jgit/transport/OpenSshConfig$Host;Ljava/lang/String;Ljava/lang/String;ILorg/eclipse/jgit/util/FS;)Lcom/jcraft/jsch/Session;
    .locals 1
    .parameter "hc"
    .parameter "user"
    .parameter "host"
    .parameter "port"
    .parameter "fs"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 219
    invoke-virtual {p0, p1, p5}, Lorg/eclipse/jgit/transport/JschConfigSessionFactory;->getJSch(Lorg/eclipse/jgit/transport/OpenSshConfig$Host;Lorg/eclipse/jgit/util/FS;)Lcom/jcraft/jsch/JSch;

    move-result-object v0

    invoke-virtual {v0, p2, p3, p4}, Lcom/jcraft/jsch/JSch;->getSession(Ljava/lang/String;Ljava/lang/String;I)Lcom/jcraft/jsch/Session;

    move-result-object v0

    return-object v0
.end method

.method protected getJSch(Lorg/eclipse/jgit/transport/OpenSshConfig$Host;Lorg/eclipse/jgit/util/FS;)Lcom/jcraft/jsch/JSch;
    .locals 7
    .parameter "hc"
    .parameter "fs"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 246
    iget-object v5, p0, Lorg/eclipse/jgit/transport/JschConfigSessionFactory;->defaultJSch:Lcom/jcraft/jsch/JSch;

    if-nez v5, :cond_0

    .line 247
    invoke-virtual {p0, p2}, Lorg/eclipse/jgit/transport/JschConfigSessionFactory;->createDefaultJSch(Lorg/eclipse/jgit/util/FS;)Lcom/jcraft/jsch/JSch;

    move-result-object v5

    iput-object v5, p0, Lorg/eclipse/jgit/transport/JschConfigSessionFactory;->defaultJSch:Lcom/jcraft/jsch/JSch;

    .line 248
    iget-object v5, p0, Lorg/eclipse/jgit/transport/JschConfigSessionFactory;->defaultJSch:Lcom/jcraft/jsch/JSch;

    invoke-virtual {v5}, Lcom/jcraft/jsch/JSch;->getIdentityNames()Ljava/util/Vector;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    .line 249
    .local v4, name:Ljava/lang/Object;
    iget-object v5, p0, Lorg/eclipse/jgit/transport/JschConfigSessionFactory;->byIdentityFile:Ljava/util/Map;

    check-cast v4, Ljava/lang/String;

    .end local v4           #name:Ljava/lang/Object;
    iget-object v6, p0, Lorg/eclipse/jgit/transport/JschConfigSessionFactory;->defaultJSch:Lcom/jcraft/jsch/JSch;

    invoke-interface {v5, v4, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 252
    .end local v0           #i$:Ljava/util/Iterator;
    :cond_0
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->getIdentityFile()Ljava/io/File;

    move-result-object v1

    .line 253
    .local v1, identityFile:Ljava/io/File;
    if-nez v1, :cond_2

    .line 254
    iget-object v3, p0, Lorg/eclipse/jgit/transport/JschConfigSessionFactory;->defaultJSch:Lcom/jcraft/jsch/JSch;

    .line 264
    :cond_1
    :goto_1
    return-object v3

    .line 256
    :cond_2
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    .line 257
    .local v2, identityKey:Ljava/lang/String;
    iget-object v5, p0, Lorg/eclipse/jgit/transport/JschConfigSessionFactory;->byIdentityFile:Ljava/util/Map;

    invoke-interface {v5, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/jcraft/jsch/JSch;

    .line 258
    .local v3, jsch:Lcom/jcraft/jsch/JSch;
    if-nez v3, :cond_1

    .line 259
    new-instance v3, Lcom/jcraft/jsch/JSch;

    .end local v3           #jsch:Lcom/jcraft/jsch/JSch;
    invoke-direct {v3}, Lcom/jcraft/jsch/JSch;-><init>()V

    .line 260
    .restart local v3       #jsch:Lcom/jcraft/jsch/JSch;
    iget-object v5, p0, Lorg/eclipse/jgit/transport/JschConfigSessionFactory;->defaultJSch:Lcom/jcraft/jsch/JSch;

    invoke-virtual {v5}, Lcom/jcraft/jsch/JSch;->getHostKeyRepository()Lcom/jcraft/jsch/HostKeyRepository;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcom/jcraft/jsch/JSch;->setHostKeyRepository(Lcom/jcraft/jsch/HostKeyRepository;)V

    .line 261
    invoke-virtual {v3, v2}, Lcom/jcraft/jsch/JSch;->addIdentity(Ljava/lang/String;)V

    .line 262
    iget-object v5, p0, Lorg/eclipse/jgit/transport/JschConfigSessionFactory;->byIdentityFile:Ljava/util/Map;

    invoke-interface {v5, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1
.end method

.method public declared-synchronized getSession(Lorg/eclipse/jgit/transport/URIish;Lorg/eclipse/jgit/transport/CredentialsProvider;Lorg/eclipse/jgit/util/FS;I)Lorg/eclipse/jgit/transport/RemoteSession;
    .locals 16
    .parameter "uri"
    .parameter "credentialsProvider"
    .parameter "fs"
    .parameter "tms"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 93
    monitor-enter p0

    :try_start_0
    invoke-virtual/range {p1 .. p1}, Lorg/eclipse/jgit/transport/URIish;->getUser()Ljava/lang/String;

    move-result-object v5

    .line 94
    .local v5, user:Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lorg/eclipse/jgit/transport/URIish;->getPass()Ljava/lang/String;

    move-result-object v6

    .line 95
    .local v6, pass:Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lorg/eclipse/jgit/transport/URIish;->getHost()Ljava/lang/String;

    move-result-object v7

    .line 96
    .local v7, host:Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lorg/eclipse/jgit/transport/URIish;->getPort()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v8

    .line 99
    .local v8, port:I
    :try_start_1
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/eclipse/jgit/transport/JschConfigSessionFactory;->config:Lorg/eclipse/jgit/transport/OpenSshConfig;

    if-nez v2, :cond_0

    .line 100
    invoke-static/range {p3 .. p3}, Lorg/eclipse/jgit/transport/OpenSshConfig;->get(Lorg/eclipse/jgit/util/FS;)Lorg/eclipse/jgit/transport/OpenSshConfig;

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lorg/eclipse/jgit/transport/JschConfigSessionFactory;->config:Lorg/eclipse/jgit/transport/OpenSshConfig;

    .line 102
    :cond_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/eclipse/jgit/transport/JschConfigSessionFactory;->config:Lorg/eclipse/jgit/transport/OpenSshConfig;

    invoke-virtual {v2, v7}, Lorg/eclipse/jgit/transport/OpenSshConfig;->lookup(Ljava/lang/String;)Lorg/eclipse/jgit/transport/OpenSshConfig$Host;

    move-result-object v9

    .line 103
    .local v9, hc:Lorg/eclipse/jgit/transport/OpenSshConfig$Host;
    invoke-virtual {v9}, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->getHostName()Ljava/lang/String;

    move-result-object v7

    .line 104
    if-gtz v8, :cond_1

    .line 105
    invoke-virtual {v9}, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->getPort()I

    move-result v8

    .line 106
    :cond_1
    if-nez v5, :cond_2

    .line 107
    invoke-virtual {v9}, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->getUser()Ljava/lang/String;

    move-result-object v5

    :cond_2
    move-object/from16 v2, p0

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    .line 109
    invoke-direct/range {v2 .. v9}, Lorg/eclipse/jgit/transport/JschConfigSessionFactory;->createSession(Lorg/eclipse/jgit/transport/CredentialsProvider;Lorg/eclipse/jgit/util/FS;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILorg/eclipse/jgit/transport/OpenSshConfig$Host;)Lcom/jcraft/jsch/Session;

    move-result-object v15

    .line 112
    .local v15, session:Lcom/jcraft/jsch/Session;
    const/4 v14, 0x0

    .line 113
    .local v14, retries:I
    :goto_0
    invoke-virtual {v15}, Lcom/jcraft/jsch/Session;->isConnected()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Lcom/jcraft/jsch/JSchException; {:try_start_1 .. :try_end_1} :catch_1

    move-result v2

    if-nez v2, :cond_7

    .line 115
    add-int/lit8 v14, v14, 0x1

    .line 116
    :try_start_2
    move/from16 v0, p4

    invoke-virtual {v15, v0}, Lcom/jcraft/jsch/Session;->connect(I)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Lcom/jcraft/jsch/JSchException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 117
    :catch_0
    move-exception v11

    .line 118
    .local v11, e:Lcom/jcraft/jsch/JSchException;
    :try_start_3
    invoke-virtual {v15}, Lcom/jcraft/jsch/Session;->disconnect()V

    .line 119
    const/4 v15, 0x0

    .line 121
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-virtual {v0, v9, v1}, Lorg/eclipse/jgit/transport/JschConfigSessionFactory;->getJSch(Lorg/eclipse/jgit/transport/OpenSshConfig$Host;Lorg/eclipse/jgit/util/FS;)Lcom/jcraft/jsch/JSch;

    move-result-object v2

    move-object/from16 v0, p3

    invoke-static {v2, v0}, Lorg/eclipse/jgit/transport/JschConfigSessionFactory;->knownHosts(Lcom/jcraft/jsch/JSch;Lorg/eclipse/jgit/util/FS;)V

    .line 123
    invoke-static {v11}, Lorg/eclipse/jgit/transport/JschConfigSessionFactory;->isAuthenticationCanceled(Lcom/jcraft/jsch/JSchException;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 124
    throw v11
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Lcom/jcraft/jsch/JSchException; {:try_start_3 .. :try_end_3} :catch_1

    .line 153
    .end local v9           #hc:Lorg/eclipse/jgit/transport/OpenSshConfig$Host;
    .end local v11           #e:Lcom/jcraft/jsch/JSchException;
    .end local v14           #retries:I
    .end local v15           #session:Lcom/jcraft/jsch/Session;
    :catch_1
    move-exception v13

    .line 154
    .local v13, je:Lcom/jcraft/jsch/JSchException;
    :try_start_4
    invoke-virtual {v13}, Lcom/jcraft/jsch/JSchException;->getCause()Ljava/lang/Throwable;

    move-result-object v10

    .line 155
    .local v10, c:Ljava/lang/Throwable;
    instance-of v2, v10, Ljava/net/UnknownHostException;

    if-eqz v2, :cond_8

    .line 156
    new-instance v2, Lorg/eclipse/jgit/errors/TransportException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->unknownHost:Ljava/lang/String;

    move-object/from16 v0, p1

    invoke-direct {v2, v0, v3}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;)V

    throw v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 93
    .end local v5           #user:Ljava/lang/String;
    .end local v6           #pass:Ljava/lang/String;
    .end local v7           #host:Ljava/lang/String;
    .end local v8           #port:I
    .end local v10           #c:Ljava/lang/Throwable;
    .end local v13           #je:Lcom/jcraft/jsch/JSchException;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2

    .line 125
    .restart local v5       #user:Ljava/lang/String;
    .restart local v6       #pass:Ljava/lang/String;
    .restart local v7       #host:Ljava/lang/String;
    .restart local v8       #port:I
    .restart local v9       #hc:Lorg/eclipse/jgit/transport/OpenSshConfig$Host;
    .restart local v11       #e:Lcom/jcraft/jsch/JSchException;
    .restart local v14       #retries:I
    .restart local v15       #session:Lcom/jcraft/jsch/Session;
    :cond_3
    :try_start_5
    invoke-static {v11}, Lorg/eclipse/jgit/transport/JschConfigSessionFactory;->isAuthenticationFailed(Lcom/jcraft/jsch/JSchException;)Z

    move-result v2

    if-eqz v2, :cond_5

    if-eqz p2, :cond_5

    .line 129
    const/4 v2, 0x3

    if-ge v14, v2, :cond_4

    .line 130
    move-object/from16 v0, p2

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/transport/CredentialsProvider;->reset(Lorg/eclipse/jgit/transport/URIish;)V

    move-object/from16 v2, p0

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    .line 131
    invoke-direct/range {v2 .. v9}, Lorg/eclipse/jgit/transport/JschConfigSessionFactory;->createSession(Lorg/eclipse/jgit/transport/CredentialsProvider;Lorg/eclipse/jgit/util/FS;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILorg/eclipse/jgit/transport/OpenSshConfig$Host;)Lcom/jcraft/jsch/Session;

    move-result-object v15

    goto :goto_0

    .line 134
    :cond_4
    throw v11

    .line 135
    :cond_5
    invoke-virtual {v9}, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->getConnectionAttempts()I

    move-result v2

    if-lt v14, v2, :cond_6

    .line 136
    throw v11
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0
    .catch Lcom/jcraft/jsch/JSchException; {:try_start_5 .. :try_end_5} :catch_1

    .line 139
    :cond_6
    const-wide/16 v2, 0x3e8

    :try_start_6
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V

    move-object/from16 v2, p0

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    .line 140
    invoke-direct/range {v2 .. v9}, Lorg/eclipse/jgit/transport/JschConfigSessionFactory;->createSession(Lorg/eclipse/jgit/transport/CredentialsProvider;Lorg/eclipse/jgit/util/FS;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILorg/eclipse/jgit/transport/OpenSshConfig$Host;)Lcom/jcraft/jsch/Session;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_6 .. :try_end_6} :catch_2
    .catch Lcom/jcraft/jsch/JSchException; {:try_start_6 .. :try_end_6} :catch_1

    move-result-object v15

    goto :goto_0

    .line 142
    :catch_2
    move-exception v12

    .line 143
    .local v12, e1:Ljava/lang/InterruptedException;
    :try_start_7
    new-instance v2, Lorg/eclipse/jgit/errors/TransportException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->transportSSHRetryInterrupt:Ljava/lang/String;

    invoke-direct {v2, v3, v12}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 151
    .end local v11           #e:Lcom/jcraft/jsch/JSchException;
    .end local v12           #e1:Ljava/lang/InterruptedException;
    :cond_7
    new-instance v2, Lorg/eclipse/jgit/transport/JschSession;

    move-object/from16 v0, p1

    invoke-direct {v2, v15, v0}, Lorg/eclipse/jgit/transport/JschSession;-><init>(Lcom/jcraft/jsch/Session;Lorg/eclipse/jgit/transport/URIish;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0
    .catch Lcom/jcraft/jsch/JSchException; {:try_start_7 .. :try_end_7} :catch_1

    monitor-exit p0

    return-object v2

    .line 157
    .end local v9           #hc:Lorg/eclipse/jgit/transport/OpenSshConfig$Host;
    .end local v14           #retries:I
    .end local v15           #session:Lcom/jcraft/jsch/Session;
    .restart local v10       #c:Ljava/lang/Throwable;
    .restart local v13       #je:Lcom/jcraft/jsch/JSchException;
    :cond_8
    :try_start_8
    instance-of v2, v10, Ljava/net/ConnectException;

    if-eqz v2, :cond_9

    .line 158
    new-instance v2, Lorg/eclipse/jgit/errors/TransportException;

    invoke-virtual {v10}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p1

    invoke-direct {v2, v0, v3}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;)V

    throw v2

    .line 159
    :cond_9
    new-instance v2, Lorg/eclipse/jgit/errors/TransportException;

    invoke-virtual {v13}, Lcom/jcraft/jsch/JSchException;->getMessage()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p1

    invoke-direct {v2, v0, v3, v13}, Lorg/eclipse/jgit/errors/TransportException;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0
.end method
