.class public Lorg/eclipse/jgit/internal/storage/file/FileRepository;
.super Lorg/eclipse/jgit/lib/Repository;
.source "FileRepository.java"


# instance fields
.field private final objectDatabase:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

.field private final refs:Lorg/eclipse/jgit/lib/RefDatabase;

.field private final repoConfig:Lorg/eclipse/jgit/storage/file/FileBasedConfig;

.field private snapshot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

.field private final systemConfig:Lorg/eclipse/jgit/storage/file/FileBasedConfig;

.field private final userConfig:Lorg/eclipse/jgit/storage/file/FileBasedConfig;


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .locals 1
    .parameter "gitDir"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 139
    new-instance v0, Lorg/eclipse/jgit/storage/file/FileRepositoryBuilder;

    invoke-direct {v0}, Lorg/eclipse/jgit/storage/file/FileRepositoryBuilder;-><init>()V

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/storage/file/FileRepositoryBuilder;->setGitDir(Ljava/io/File;)Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/storage/file/FileRepositoryBuilder;

    invoke-virtual {v0}, Lorg/eclipse/jgit/storage/file/FileRepositoryBuilder;->setup()Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;-><init>(Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;)V

    .line 140
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .parameter "gitDir"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 153
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;-><init>(Ljava/io/File;)V

    .line 154
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;)V
    .locals 13
    .parameter "options"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v11, 0x0

    const/4 v10, 0x0

    .line 166
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/lib/Repository;-><init>(Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;)V

    .line 168
    invoke-static {}, Lorg/eclipse/jgit/util/SystemReader;->getInstance()Lorg/eclipse/jgit/util/SystemReader;

    move-result-object v0

    const-string v1, "GIT_CONFIG_NOSYSTEM"

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/util/SystemReader;->getenv(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/eclipse/jgit/util/StringUtils;->isEmptyOrNull(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 170
    invoke-static {}, Lorg/eclipse/jgit/util/SystemReader;->getInstance()Lorg/eclipse/jgit/util/SystemReader;

    move-result-object v0

    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v1

    invoke-virtual {v0, v10, v1}, Lorg/eclipse/jgit/util/SystemReader;->openSystemConfig(Lorg/eclipse/jgit/lib/Config;Lorg/eclipse/jgit/util/FS;)Lorg/eclipse/jgit/storage/file/FileBasedConfig;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->systemConfig:Lorg/eclipse/jgit/storage/file/FileBasedConfig;

    .line 183
    :goto_0
    invoke-static {}, Lorg/eclipse/jgit/util/SystemReader;->getInstance()Lorg/eclipse/jgit/util/SystemReader;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->systemConfig:Lorg/eclipse/jgit/storage/file/FileBasedConfig;

    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jgit/util/SystemReader;->openUserConfig(Lorg/eclipse/jgit/lib/Config;Lorg/eclipse/jgit/util/FS;)Lorg/eclipse/jgit/storage/file/FileBasedConfig;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->userConfig:Lorg/eclipse/jgit/storage/file/FileBasedConfig;

    .line 185
    new-instance v0, Lorg/eclipse/jgit/storage/file/FileBasedConfig;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->userConfig:Lorg/eclipse/jgit/storage/file/FileBasedConfig;

    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v2

    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getDirectory()Ljava/io/File;

    move-result-object v3

    const-string v4, "config"

    invoke-virtual {v2, v3, v4}, Lorg/eclipse/jgit/util/FS;->resolve(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lorg/eclipse/jgit/storage/file/FileBasedConfig;-><init>(Lorg/eclipse/jgit/lib/Config;Ljava/io/File;Lorg/eclipse/jgit/util/FS;)V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->repoConfig:Lorg/eclipse/jgit/storage/file/FileBasedConfig;

    .line 189
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->loadSystemConfig()V

    .line 190
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->loadUserConfig()V

    .line 191
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->loadRepoConfig()V

    .line 193
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->repoConfig:Lorg/eclipse/jgit/storage/file/FileBasedConfig;

    new-instance v1, Lorg/eclipse/jgit/internal/storage/file/FileRepository$2;

    invoke-direct {v1, p0}, Lorg/eclipse/jgit/internal/storage/file/FileRepository$2;-><init>(Lorg/eclipse/jgit/internal/storage/file/FileRepository;)V

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->addChangeListener(Lorg/eclipse/jgit/events/ConfigChangedListener;)Lorg/eclipse/jgit/events/ListenerHandle;

    .line 199
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;-><init>(Lorg/eclipse/jgit/internal/storage/file/FileRepository;)V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->refs:Lorg/eclipse/jgit/lib/RefDatabase;

    .line 200
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->repoConfig:Lorg/eclipse/jgit/storage/file/FileBasedConfig;

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->getObjectDirectory()Ljava/io/File;

    move-result-object v2

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->getAlternateObjectDirectories()[Ljava/io/File;

    move-result-object v3

    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v4

    new-instance v5, Ljava/io/File;

    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getDirectory()Ljava/io/File;

    move-result-object v8

    const-string v9, "shallow"

    invoke-direct {v5, v8, v9}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;-><init>(Lorg/eclipse/jgit/lib/Config;Ljava/io/File;[Ljava/io/File;Lorg/eclipse/jgit/util/FS;Ljava/io/File;)V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->objectDatabase:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

    .line 206
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->objectDatabase:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->exists()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 207
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getConfig()Lorg/eclipse/jgit/storage/file/FileBasedConfig;

    move-result-object v0

    const-string v1, "core"

    const-string v3, "repositoryformatversion"

    move-object v2, v10

    move-wide v4, v11

    invoke-virtual/range {v0 .. v5}, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->getLong(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)J

    move-result-wide v6

    .line 210
    .local v6, repositoryFormatVersion:J
    cmp-long v0, v6, v11

    if-lez v0, :cond_1

    .line 211
    new-instance v0, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->unknownRepositoryFormat2:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 173
    .end local v6           #repositoryFormatVersion:J
    :cond_0
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/FileRepository$1;

    sget-object v1, Lorg/eclipse/jgit/util/FS;->DETECTED:Lorg/eclipse/jgit/util/FS;

    invoke-direct {v0, p0, v10, v1}, Lorg/eclipse/jgit/internal/storage/file/FileRepository$1;-><init>(Lorg/eclipse/jgit/internal/storage/file/FileRepository;Ljava/io/File;Lorg/eclipse/jgit/util/FS;)V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->systemConfig:Lorg/eclipse/jgit/storage/file/FileBasedConfig;

    goto/16 :goto_0

    .line 216
    :cond_1
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->isBare()Z

    move-result v0

    if-nez v0, :cond_2

    .line 217
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getIndexFile()Ljava/io/File;

    move-result-object v0

    invoke-static {v0}, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->save(Ljava/io/File;)Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->snapshot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    .line 218
    :cond_2
    return-void
.end method

.method private detectIndexChanges()V
    .locals 2

    .prologue
    .line 427
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->isBare()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 435
    :cond_0
    :goto_0
    return-void

    .line 430
    :cond_1
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getIndexFile()Ljava/io/File;

    move-result-object v0

    .line 431
    .local v0, indexFile:Ljava/io/File;
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->snapshot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    if-nez v1, :cond_2

    .line 432
    invoke-static {v0}, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->save(Ljava/io/File;)Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->snapshot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    goto :goto_0

    .line 433
    :cond_2
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->snapshot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    invoke-virtual {v1, v0}, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->isModified(Ljava/io/File;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 434
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->notifyIndexChanged()V

    goto :goto_0
.end method

.method private loadRepoConfig()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 246
    :try_start_0
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->repoConfig:Lorg/eclipse/jgit/storage/file/FileBasedConfig;

    invoke-virtual {v2}, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->load()V
    :try_end_0
    .catch Lorg/eclipse/jgit/errors/ConfigInvalidException; {:try_start_0 .. :try_end_0} :catch_0

    .line 252
    return-void

    .line 247
    :catch_0
    move-exception v0

    .line 248
    .local v0, e1:Lorg/eclipse/jgit/errors/ConfigInvalidException;
    new-instance v1, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->unknownRepositoryFormat:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 249
    .local v1, e2:Ljava/io/IOException;
    invoke-virtual {v1, v0}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 250
    throw v1
.end method

.method private loadSystemConfig()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 222
    :try_start_0
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->systemConfig:Lorg/eclipse/jgit/storage/file/FileBasedConfig;

    invoke-virtual {v2}, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->load()V
    :try_end_0
    .catch Lorg/eclipse/jgit/errors/ConfigInvalidException; {:try_start_0 .. :try_end_0} :catch_0

    .line 230
    return-void

    .line 223
    :catch_0
    move-exception v0

    .line 224
    .local v0, e1:Lorg/eclipse/jgit/errors/ConfigInvalidException;
    new-instance v1, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->systemConfigFileInvalid:Ljava/lang/String;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->systemConfig:Lorg/eclipse/jgit/storage/file/FileBasedConfig;

    invoke-virtual {v5}, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->getFile()Ljava/io/File;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    aput-object v0, v3, v4

    invoke-static {v2, v3}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 227
    .local v1, e2:Ljava/io/IOException;
    invoke-virtual {v1, v0}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 228
    throw v1
.end method

.method private loadUserConfig()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 234
    :try_start_0
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->userConfig:Lorg/eclipse/jgit/storage/file/FileBasedConfig;

    invoke-virtual {v2}, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->load()V
    :try_end_0
    .catch Lorg/eclipse/jgit/errors/ConfigInvalidException; {:try_start_0 .. :try_end_0} :catch_0

    .line 242
    return-void

    .line 235
    :catch_0
    move-exception v0

    .line 236
    .local v0, e1:Lorg/eclipse/jgit/errors/ConfigInvalidException;
    new-instance v1, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->userConfigFileInvalid:Ljava/lang/String;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->userConfig:Lorg/eclipse/jgit/storage/file/FileBasedConfig;

    invoke-virtual {v5}, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->getFile()Ljava/io/File;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    aput-object v0, v3, v4

    invoke-static {v2, v3}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 239
    .local v1, e2:Ljava/io/IOException;
    invoke-virtual {v1, v0}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 240
    throw v1
.end method


# virtual methods
.method public create(Z)V
    .locals 13
    .parameter "bare"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    const/4 v12, 0x0

    const/4 v7, 0x1

    .line 265
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getConfig()Lorg/eclipse/jgit/storage/file/FileBasedConfig;

    move-result-object v0

    .line 266
    .local v0, cfg:Lorg/eclipse/jgit/storage/file/FileBasedConfig;
    invoke-virtual {v0}, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->getFile()Ljava/io/File;

    move-result-object v9

    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    move-result v9

    if-eqz v9, :cond_0

    .line 267
    new-instance v9, Ljava/lang/IllegalStateException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v10

    iget-object v10, v10, Lorg/eclipse/jgit/internal/JGitText;->repositoryAlreadyExists:Ljava/lang/String;

    new-array v7, v7, [Ljava/lang/Object;

    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getDirectory()Ljava/io/File;

    move-result-object v11

    aput-object v11, v7, v8

    invoke-static {v10, v7}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v9, v7}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 270
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getDirectory()Ljava/io/File;

    move-result-object v9

    invoke-static {v9, v7}, Lorg/eclipse/jgit/util/FileUtils;->mkdirs(Ljava/io/File;Z)V

    .line 271
    iget-object v9, p0, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->refs:Lorg/eclipse/jgit/lib/RefDatabase;

    invoke-virtual {v9}, Lorg/eclipse/jgit/lib/RefDatabase;->create()V

    .line 272
    iget-object v9, p0, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->objectDatabase:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

    invoke-virtual {v9}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->create()V

    .line 274
    new-instance v9, Ljava/io/File;

    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getDirectory()Ljava/io/File;

    move-result-object v10

    const-string v11, "branches"

    invoke-direct {v9, v10, v11}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v9}, Lorg/eclipse/jgit/util/FileUtils;->mkdir(Ljava/io/File;)V

    .line 275
    new-instance v9, Ljava/io/File;

    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getDirectory()Ljava/io/File;

    move-result-object v10

    const-string v11, "hooks"

    invoke-direct {v9, v10, v11}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v9}, Lorg/eclipse/jgit/util/FileUtils;->mkdir(Ljava/io/File;)V

    .line 277
    const-string v9, "HEAD"

    invoke-virtual {p0, v9}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->updateRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/RefUpdate;

    move-result-object v2

    .line 278
    .local v2, head:Lorg/eclipse/jgit/lib/RefUpdate;
    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/RefUpdate;->disableRefLog()V

    .line 279
    const-string v9, "refs/heads/master"

    invoke-virtual {v2, v9}, Lorg/eclipse/jgit/lib/RefUpdate;->link(Ljava/lang/String;)Lorg/eclipse/jgit/lib/RefUpdate$Result;

    .line 282
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v9

    invoke-virtual {v9}, Lorg/eclipse/jgit/util/FS;->supportsExecute()Z

    move-result v9

    if-eqz v9, :cond_7

    .line 283
    const-string v9, "try"

    const-string v10, "execute"

    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getDirectory()Ljava/io/File;

    move-result-object v11

    invoke-static {v9, v10, v11}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object v6

    .line 285
    .local v6, tmp:Ljava/io/File;
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v9

    invoke-virtual {v9, v6, v7}, Lorg/eclipse/jgit/util/FS;->setExecute(Ljava/io/File;Z)Z

    .line 286
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v9

    invoke-virtual {v9, v6}, Lorg/eclipse/jgit/util/FS;->canExecute(Ljava/io/File;)Z

    move-result v4

    .line 288
    .local v4, on:Z
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v9

    invoke-virtual {v9, v6, v8}, Lorg/eclipse/jgit/util/FS;->setExecute(Ljava/io/File;Z)Z

    .line 289
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v9

    invoke-virtual {v9, v6}, Lorg/eclipse/jgit/util/FS;->canExecute(Ljava/io/File;)Z

    move-result v3

    .line 290
    .local v3, off:Z
    invoke-static {v6}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;)V

    .line 292
    if-eqz v4, :cond_6

    if-nez v3, :cond_6

    move v1, v7

    .line 297
    .end local v3           #off:Z
    .end local v4           #on:Z
    .end local v6           #tmp:Ljava/io/File;
    .local v1, fileMode:Z
    :goto_0
    sget-object v5, Lorg/eclipse/jgit/lib/CoreConfig$SymLinks;->FALSE:Lorg/eclipse/jgit/lib/CoreConfig$SymLinks;

    .line 298
    .local v5, symLinks:Lorg/eclipse/jgit/lib/CoreConfig$SymLinks;
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v9

    invoke-virtual {v9}, Lorg/eclipse/jgit/util/FS;->supportsSymlinks()Z

    move-result v9

    if-eqz v9, :cond_1

    .line 299
    new-instance v6, Ljava/io/File;

    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getDirectory()Ljava/io/File;

    move-result-object v9

    const-string v10, "tmplink"

    invoke-direct {v6, v9, v10}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 301
    .restart local v6       #tmp:Ljava/io/File;
    :try_start_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v9

    const-string v10, "target"

    invoke-virtual {v9, v6, v10}, Lorg/eclipse/jgit/util/FS;->createSymLink(Ljava/io/File;Ljava/lang/String;)V

    .line 302
    const/4 v5, 0x0

    .line 303
    invoke-static {v6}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 308
    .end local v6           #tmp:Ljava/io/File;
    :cond_1
    :goto_1
    if-eqz v5, :cond_2

    .line 309
    const-string v9, "core"

    const-string v10, "symlinks"

    invoke-virtual {v5}, Lorg/eclipse/jgit/lib/CoreConfig$SymLinks;->name()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v0, v9, v12, v10, v11}, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 312
    :cond_2
    const-string v9, "core"

    const-string v10, "repositoryformatversion"

    invoke-virtual {v0, v9, v12, v10, v8}, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->setInt(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 314
    const-string v9, "core"

    const-string v10, "filemode"

    invoke-virtual {v0, v9, v12, v10, v1}, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->setBoolean(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 316
    if-eqz p1, :cond_3

    .line 317
    const-string v9, "core"

    const-string v10, "bare"

    invoke-virtual {v0, v9, v12, v10, v7}, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->setBoolean(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 319
    :cond_3
    const-string v9, "core"

    const-string v10, "logallrefupdates"

    if-nez p1, :cond_4

    move v8, v7

    :cond_4
    invoke-virtual {v0, v9, v12, v10, v8}, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->setBoolean(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 321
    invoke-static {}, Lorg/eclipse/jgit/util/SystemReader;->getInstance()Lorg/eclipse/jgit/util/SystemReader;

    move-result-object v8

    invoke-virtual {v8}, Lorg/eclipse/jgit/util/SystemReader;->isMacOS()Z

    move-result v8

    if-eqz v8, :cond_5

    .line 323
    const-string v8, "core"

    const-string v9, "precomposeunicode"

    invoke-virtual {v0, v8, v12, v9, v7}, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->setBoolean(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 325
    :cond_5
    invoke-virtual {v0}, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->save()V

    .line 326
    return-void

    .end local v1           #fileMode:Z
    .end local v5           #symLinks:Lorg/eclipse/jgit/lib/CoreConfig$SymLinks;
    .restart local v3       #off:Z
    .restart local v4       #on:Z
    .restart local v6       #tmp:Ljava/io/File;
    :cond_6
    move v1, v8

    .line 292
    goto :goto_0

    .line 294
    .end local v3           #off:Z
    .end local v4           #on:Z
    .end local v6           #tmp:Ljava/io/File;
    :cond_7
    const/4 v1, 0x0

    .restart local v1       #fileMode:Z
    goto :goto_0

    .line 304
    .restart local v5       #symLinks:Lorg/eclipse/jgit/lib/CoreConfig$SymLinks;
    .restart local v6       #tmp:Ljava/io/File;
    :catch_0
    move-exception v9

    goto :goto_1
.end method

.method public getAdditionalHaves()Ljava/util/Set;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;"
        }
    .end annotation

    .prologue
    .line 386
    new-instance v5, Ljava/util/HashSet;

    invoke-direct {v5}, Ljava/util/HashSet;-><init>()V

    .line 387
    .local v5, r:Ljava/util/HashSet;,"Ljava/util/HashSet<Lorg/eclipse/jgit/lib/ObjectId;>;"
    iget-object v8, p0, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->objectDatabase:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

    invoke-virtual {v8}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->myAlternates()[Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;

    move-result-object v0

    .local v0, arr$:[Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;
    array-length v4, v0

    .local v4, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    move v3, v2

    .end local v2           #i$:I
    .local v3, i$:I
    :goto_0
    if-ge v3, v4, :cond_4

    aget-object v1, v0, v3

    .line 388
    .local v1, d:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;
    instance-of v8, v1, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateRepository;

    if-eqz v8, :cond_3

    .line 391
    check-cast v1, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateRepository;

    .end local v1           #d:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateHandle;
    iget-object v7, v1, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory$AlternateRepository;->repository:Lorg/eclipse/jgit/internal/storage/file/FileRepository;

    .line 392
    .local v7, repo:Lorg/eclipse/jgit/lib/Repository;
    invoke-virtual {v7}, Lorg/eclipse/jgit/lib/Repository;->getAllRefs()Ljava/util/Map;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .end local v3           #i$:I
    .local v2, i$:Ljava/util/Iterator;
    :cond_0
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/eclipse/jgit/lib/Ref;

    .line 393
    .local v6, ref:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface {v6}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v8

    if-eqz v8, :cond_1

    .line 394
    invoke-interface {v6}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 395
    :cond_1
    invoke-interface {v6}, Lorg/eclipse/jgit/lib/Ref;->getPeeledObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v8

    if-eqz v8, :cond_0

    .line 396
    invoke-interface {v6}, Lorg/eclipse/jgit/lib/Ref;->getPeeledObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 398
    .end local v6           #ref:Lorg/eclipse/jgit/lib/Ref;
    :cond_2
    invoke-virtual {v7}, Lorg/eclipse/jgit/lib/Repository;->getAdditionalHaves()Ljava/util/Set;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/util/HashSet;->addAll(Ljava/util/Collection;)Z

    .line 387
    .end local v2           #i$:Ljava/util/Iterator;
    .end local v7           #repo:Lorg/eclipse/jgit/lib/Repository;
    :cond_3
    add-int/lit8 v2, v3, 0x1

    .local v2, i$:I
    move v3, v2

    .end local v2           #i$:I
    .restart local v3       #i$:I
    goto :goto_0

    .line 401
    :cond_4
    return-object v5
.end method

.method public bridge synthetic getConfig()Lorg/eclipse/jgit/lib/StoredConfig;
    .locals 1

    .prologue
    .line 106
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getConfig()Lorg/eclipse/jgit/storage/file/FileBasedConfig;

    move-result-object v0

    return-object v0
.end method

.method public getConfig()Lorg/eclipse/jgit/storage/file/FileBasedConfig;
    .locals 2

    .prologue
    .line 351
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->systemConfig:Lorg/eclipse/jgit/storage/file/FileBasedConfig;

    invoke-virtual {v1}, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->isOutdated()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 353
    :try_start_0
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->loadSystemConfig()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 358
    :cond_0
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->userConfig:Lorg/eclipse/jgit/storage/file/FileBasedConfig;

    invoke-virtual {v1}, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->isOutdated()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 360
    :try_start_1
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->loadUserConfig()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 365
    :cond_1
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->repoConfig:Lorg/eclipse/jgit/storage/file/FileBasedConfig;

    invoke-virtual {v1}, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->isOutdated()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 367
    :try_start_2
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->loadRepoConfig()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    .line 372
    :cond_2
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->repoConfig:Lorg/eclipse/jgit/storage/file/FileBasedConfig;

    return-object v1

    .line 354
    :catch_0
    move-exception v0

    .line 355
    .local v0, e:Ljava/io/IOException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 361
    .end local v0           #e:Ljava/io/IOException;
    :catch_1
    move-exception v0

    .line 362
    .restart local v0       #e:Ljava/io/IOException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 368
    .end local v0           #e:Ljava/io/IOException;
    :catch_2
    move-exception v0

    .line 369
    .restart local v0       #e:Ljava/io/IOException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public getObjectDatabase()Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;
    .locals 1

    .prologue
    .line 339
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->objectDatabase:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

    return-object v0
.end method

.method public bridge synthetic getObjectDatabase()Lorg/eclipse/jgit/lib/ObjectDatabase;
    .locals 1

    .prologue
    .line 106
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getObjectDatabase()Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

    move-result-object v0

    return-object v0
.end method

.method public getObjectsDirectory()Ljava/io/File;
    .locals 1

    .prologue
    .line 332
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->objectDatabase:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->getDirectory()Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public getRefDatabase()Lorg/eclipse/jgit/lib/RefDatabase;
    .locals 1

    .prologue
    .line 344
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->refs:Lorg/eclipse/jgit/lib/RefDatabase;

    return-object v0
.end method

.method public getReflogReader(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ReflogReader;
    .locals 3
    .parameter "refName"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 450
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    .line 451
    .local v0, ref:Lorg/eclipse/jgit/lib/Ref;
    if-eqz v0, :cond_0

    .line 452
    new-instance v1, Lorg/eclipse/jgit/internal/storage/file/ReflogReaderImpl;

    invoke-interface {v0}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lorg/eclipse/jgit/internal/storage/file/ReflogReaderImpl;-><init>(Lorg/eclipse/jgit/lib/Repository;Ljava/lang/String;)V

    .line 453
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public notifyIndexChanged()V
    .locals 1

    .prologue
    .line 439
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getIndexFile()Ljava/io/File;

    move-result-object v0

    invoke-static {v0}, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->save(Ljava/io/File;)Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->snapshot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    .line 440
    new-instance v0, Lorg/eclipse/jgit/events/IndexChangedEvent;

    invoke-direct {v0}, Lorg/eclipse/jgit/events/IndexChangedEvent;-><init>()V

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->fireEvent(Lorg/eclipse/jgit/events/RepositoryEvent;)V

    .line 441
    return-void
.end method

.method public openPack(Ljava/io/File;)V
    .locals 1
    .parameter "pack"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 414
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->objectDatabase:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->openPack(Ljava/io/File;)Lorg/eclipse/jgit/internal/storage/file/PackFile;

    .line 415
    return-void
.end method

.method public scanForRepoChanges()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 419
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getRefDatabase()Lorg/eclipse/jgit/lib/RefDatabase;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/RefDatabase;->getRefs(Ljava/lang/String;)Ljava/util/Map;

    .line 420
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->detectIndexChanges()V

    .line 421
    return-void
.end method
