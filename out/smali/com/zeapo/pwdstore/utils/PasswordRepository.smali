.class public Lcom/zeapo/pwdstore/utils/PasswordRepository;
.super Ljava/lang/Object;
.source "PasswordRepository.java"


# static fields
.field private static repository:Lorg/eclipse/jgit/lib/Repository;


# direct methods
.method protected constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addRemote(Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .parameter "name"
    .parameter "url"

    .prologue
    .line 78
    sget-object v5, Lcom/zeapo/pwdstore/utils/PasswordRepository;->repository:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v5}, Lorg/eclipse/jgit/lib/Repository;->getConfig()Lorg/eclipse/jgit/lib/StoredConfig;

    move-result-object v3

    .line 79
    .local v3, storedConfig:Lorg/eclipse/jgit/lib/StoredConfig;
    const-string v5, "remote"

    invoke-virtual {v3, v5}, Lorg/eclipse/jgit/lib/StoredConfig;->getSubsections(Ljava/lang/String;)Ljava/util/Set;

    move-result-object v2

    .line 81
    .local v2, remotes:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v2, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 83
    :try_start_0
    new-instance v4, Lorg/eclipse/jgit/transport/URIish;

    invoke-direct {v4, p1}, Lorg/eclipse/jgit/transport/URIish;-><init>(Ljava/lang/String;)V

    .line 84
    .local v4, uri:Lorg/eclipse/jgit/transport/URIish;
    new-instance v0, Lorg/eclipse/jgit/transport/RefSpec;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "+refs/head/*:refs/remotes/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/*"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v0, v5}, Lorg/eclipse/jgit/transport/RefSpec;-><init>(Ljava/lang/String;)V

    .line 86
    .local v0, refSpec:Lorg/eclipse/jgit/transport/RefSpec;
    new-instance v1, Lorg/eclipse/jgit/transport/RemoteConfig;

    invoke-direct {v1, v3, p0}, Lorg/eclipse/jgit/transport/RemoteConfig;-><init>(Lorg/eclipse/jgit/lib/Config;Ljava/lang/String;)V

    .line 87
    .local v1, remoteConfig:Lorg/eclipse/jgit/transport/RemoteConfig;
    invoke-virtual {v1, v0}, Lorg/eclipse/jgit/transport/RemoteConfig;->addFetchRefSpec(Lorg/eclipse/jgit/transport/RefSpec;)Z

    .line 88
    invoke-virtual {v1, v0}, Lorg/eclipse/jgit/transport/RemoteConfig;->addPushRefSpec(Lorg/eclipse/jgit/transport/RefSpec;)Z

    .line 89
    invoke-virtual {v1, v4}, Lorg/eclipse/jgit/transport/RemoteConfig;->addURI(Lorg/eclipse/jgit/transport/URIish;)Z

    .line 90
    invoke-virtual {v1, v4}, Lorg/eclipse/jgit/transport/RemoteConfig;->addPushURI(Lorg/eclipse/jgit/transport/URIish;)Z

    .line 92
    invoke-virtual {v1, v3}, Lorg/eclipse/jgit/transport/RemoteConfig;->update(Lorg/eclipse/jgit/lib/Config;)V

    .line 94
    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/StoredConfig;->save()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 99
    .end local v0           #refSpec:Lorg/eclipse/jgit/transport/RefSpec;
    .end local v1           #remoteConfig:Lorg/eclipse/jgit/transport/RemoteConfig;
    .end local v4           #uri:Lorg/eclipse/jgit/transport/URIish;
    :cond_0
    :goto_0
    return-void

    .line 95
    :catch_0
    move-exception v5

    goto :goto_0
.end method

.method public static closeRepository()V
    .locals 1

    .prologue
    .line 102
    sget-object v0, Lcom/zeapo/pwdstore/utils/PasswordRepository;->repository:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/Repository;->close()V

    .line 103
    return-void
.end method

.method public static createRepository(Ljava/io/File;)V
    .locals 4
    .parameter "localDir"

    .prologue
    .line 50
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    .line 55
    :try_start_0
    new-instance v2, Ljava/io/File;

    const-string v3, ".git"

    invoke-direct {v2, p0, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v2}, Lorg/eclipse/jgit/storage/file/FileRepositoryBuilder;->create(Ljava/io/File;)Lorg/eclipse/jgit/lib/Repository;

    move-result-object v1

    .line 56
    .local v1, repository:Lorg/eclipse/jgit/lib/Repository;
    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/Repository;->create()V

    .line 58
    invoke-static {}, Lorg/eclipse/jgit/api/Git;->init()Lorg/eclipse/jgit/api/InitCommand;

    move-result-object v2

    invoke-virtual {v2, p0}, Lorg/eclipse/jgit/api/InitCommand;->setDirectory(Ljava/io/File;)Lorg/eclipse/jgit/api/InitCommand;

    move-result-object v2

    invoke-virtual {v2}, Lorg/eclipse/jgit/api/InitCommand;->call()Lorg/eclipse/jgit/api/Git;

    .line 62
    invoke-static {p0}, Lcom/zeapo/pwdstore/utils/PasswordRepository;->getRepository(Ljava/io/File;)Lorg/eclipse/jgit/lib/Repository;

    .line 64
    new-instance v2, Lorg/eclipse/jgit/api/Git;

    invoke-direct {v2, v1}, Lorg/eclipse/jgit/api/Git;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    invoke-virtual {v2}, Lorg/eclipse/jgit/api/Git;->branchCreate()Lorg/eclipse/jgit/api/CreateBranchCommand;

    move-result-object v2

    const-string v3, "master"

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/api/CreateBranchCommand;->setName(Ljava/lang/String;)Lorg/eclipse/jgit/api/CreateBranchCommand;

    move-result-object v2

    invoke-virtual {v2}, Lorg/eclipse/jgit/api/CreateBranchCommand;->call()Lorg/eclipse/jgit/lib/Ref;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 73
    .end local v1           #repository:Lorg/eclipse/jgit/lib/Repository;
    :goto_0
    return-void

    .line 69
    :catch_0
    move-exception v0

    .line 70
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static getFile(Ljava/lang/String;)Ljava/io/File;
    .locals 3
    .parameter "name"

    .prologue
    .line 118
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/zeapo/pwdstore/utils/PasswordRepository;->repository:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/Repository;->getWorkTree()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public static getFilesList()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .prologue
    .line 106
    sget-object v0, Lcom/zeapo/pwdstore/utils/PasswordRepository;->repository:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/Repository;->getWorkTree()Ljava/io/File;

    move-result-object v0

    invoke-static {v0}, Lcom/zeapo/pwdstore/utils/PasswordRepository;->getFilesList(Ljava/io/File;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public static getFilesList(Ljava/io/File;)Ljava/util/ArrayList;
    .locals 5
    .parameter "path"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 122
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 128
    :goto_0
    return-object v1

    .line 124
    :cond_0
    const-string v1, "REPO"

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 125
    new-instance v0, Ljava/util/ArrayList;

    invoke-static {}, Lorg/apache/commons/io/filefilter/FileFilterUtils;->directoryFileFilter()Lorg/apache/commons/io/filefilter/IOFileFilter;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/io/File;->listFiles(Ljava/io/FileFilter;)[Ljava/io/File;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 126
    .local v0, files:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/io/File;>;"
    new-instance v2, Ljava/util/ArrayList;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const-string v3, "gpg"

    aput-object v3, v1, v4

    invoke-static {p0, v1, v4}, Lorg/apache/commons/io/FileUtils;->listFiles(Ljava/io/File;[Ljava/lang/String;Z)Ljava/util/Collection;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    invoke-direct {v2, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 128
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    goto :goto_0
.end method

.method public static getPasswords()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/zeapo/pwdstore/utils/PasswordItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 110
    sget-object v0, Lcom/zeapo/pwdstore/utils/PasswordRepository;->repository:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/Repository;->getWorkTree()Ljava/io/File;

    move-result-object v0

    invoke-static {v0}, Lcom/zeapo/pwdstore/utils/PasswordRepository;->getPasswords(Ljava/io/File;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public static getPasswords(Ljava/io/File;)Ljava/util/ArrayList;
    .locals 6
    .parameter "path"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/zeapo/pwdstore/utils/PasswordItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 133
    invoke-static {p0}, Lcom/zeapo/pwdstore/utils/PasswordRepository;->getFilesList(Ljava/io/File;)Ljava/util/ArrayList;

    move-result-object v2

    .line 135
    .local v2, passList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/io/File;>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-nez v4, :cond_0

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 151
    :goto_0
    return-object v3

    .line 138
    :cond_0
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 140
    .local v3, passwordList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/zeapo/pwdstore/utils/PasswordItem;>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_1
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    .line 141
    .local v0, file:Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 142
    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v0}, Lcom/zeapo/pwdstore/utils/PasswordItem;->newPassword(Ljava/lang/String;Ljava/io/File;)Lcom/zeapo/pwdstore/utils/PasswordItem;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 145
    :cond_2
    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, ".git"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 147
    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v0}, Lcom/zeapo/pwdstore/utils/PasswordItem;->newCategory(Ljava/lang/String;Ljava/io/File;)Lcom/zeapo/pwdstore/utils/PasswordItem;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 150
    .end local v0           #file:Ljava/io/File;
    :cond_3
    invoke-static {v3}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    goto :goto_0
.end method

.method public static getRepository(Ljava/io/File;)Lorg/eclipse/jgit/lib/Repository;
    .locals 3
    .parameter "localDir"

    .prologue
    .line 33
    sget-object v2, Lcom/zeapo/pwdstore/utils/PasswordRepository;->repository:Lorg/eclipse/jgit/lib/Repository;

    if-nez v2, :cond_0

    .line 34
    new-instance v0, Lorg/eclipse/jgit/storage/file/FileRepositoryBuilder;

    invoke-direct {v0}, Lorg/eclipse/jgit/storage/file/FileRepositoryBuilder;-><init>()V

    .line 36
    .local v0, builder:Lorg/eclipse/jgit/storage/file/FileRepositoryBuilder;
    :try_start_0
    invoke-virtual {v0, p0}, Lorg/eclipse/jgit/storage/file/FileRepositoryBuilder;->setGitDir(Ljava/io/File;)Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/storage/file/FileRepositoryBuilder;

    invoke-virtual {v2}, Lorg/eclipse/jgit/storage/file/FileRepositoryBuilder;->readEnvironment()Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/storage/file/FileRepositoryBuilder;

    invoke-virtual {v2}, Lorg/eclipse/jgit/storage/file/FileRepositoryBuilder;->findGitDir()Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/storage/file/FileRepositoryBuilder;

    invoke-virtual {v2}, Lorg/eclipse/jgit/storage/file/FileRepositoryBuilder;->build()Lorg/eclipse/jgit/lib/Repository;

    move-result-object v2

    sput-object v2, Lcom/zeapo/pwdstore/utils/PasswordRepository;->repository:Lorg/eclipse/jgit/lib/Repository;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 46
    .end local v0           #builder:Lorg/eclipse/jgit/storage/file/FileRepositoryBuilder;
    :cond_0
    sget-object v2, Lcom/zeapo/pwdstore/utils/PasswordRepository;->repository:Lorg/eclipse/jgit/lib/Repository;

    :goto_0
    return-object v2

    .line 41
    .restart local v0       #builder:Lorg/eclipse/jgit/storage/file/FileRepositoryBuilder;
    :catch_0
    move-exception v1

    .line 42
    .local v1, e:Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 43
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static getWorkTree()Ljava/io/File;
    .locals 1

    .prologue
    .line 114
    sget-object v0, Lcom/zeapo/pwdstore/utils/PasswordRepository;->repository:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/Repository;->getWorkTree()Ljava/io/File;

    move-result-object v0

    return-object v0
.end method
