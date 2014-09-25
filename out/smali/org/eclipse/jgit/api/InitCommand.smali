.class public Lorg/eclipse/jgit/api/InitCommand;
.super Ljava/lang/Object;
.source "InitCommand.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable",
        "<",
        "Lorg/eclipse/jgit/api/Git;",
        ">;"
    }
.end annotation


# instance fields
.field private bare:Z

.field private directory:Ljava/io/File;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 61
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/InitCommand;->call()Lorg/eclipse/jgit/api/Git;

    move-result-object v0

    return-object v0
.end method

.method public call()Lorg/eclipse/jgit/api/Git;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    .line 73
    :try_start_0
    new-instance v0, Lorg/eclipse/jgit/lib/RepositoryBuilder;

    invoke-direct {v0}, Lorg/eclipse/jgit/lib/RepositoryBuilder;-><init>()V

    .line 74
    .local v0, builder:Lorg/eclipse/jgit/lib/RepositoryBuilder;
    iget-boolean v5, p0, Lorg/eclipse/jgit/api/InitCommand;->bare:Z

    if-eqz v5, :cond_0

    .line 75
    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/RepositoryBuilder;->setBare()Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    .line 76
    :cond_0
    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/RepositoryBuilder;->readEnvironment()Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    .line 77
    iget-object v5, p0, Lorg/eclipse/jgit/api/InitCommand;->directory:Ljava/io/File;

    if-eqz v5, :cond_4

    .line 78
    iget-object v1, p0, Lorg/eclipse/jgit/api/InitCommand;->directory:Ljava/io/File;

    .line 79
    .local v1, d:Ljava/io/File;
    iget-boolean v5, p0, Lorg/eclipse/jgit/api/InitCommand;->bare:Z

    if-nez v5, :cond_1

    .line 80
    new-instance v2, Ljava/io/File;

    const-string v5, ".git"

    invoke-direct {v2, v1, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .end local v1           #d:Ljava/io/File;
    .local v2, d:Ljava/io/File;
    move-object v1, v2

    .line 81
    .end local v2           #d:Ljava/io/File;
    .restart local v1       #d:Ljava/io/File;
    :cond_1
    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/RepositoryBuilder;->setGitDir(Ljava/io/File;)Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    .line 90
    .end local v1           #d:Ljava/io/File;
    :cond_2
    :goto_0
    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/RepositoryBuilder;->build()Lorg/eclipse/jgit/lib/Repository;

    move-result-object v4

    .line 91
    .local v4, repository:Lorg/eclipse/jgit/lib/Repository;
    invoke-virtual {v4}, Lorg/eclipse/jgit/lib/Repository;->getObjectDatabase()Lorg/eclipse/jgit/lib/ObjectDatabase;

    move-result-object v5

    invoke-virtual {v5}, Lorg/eclipse/jgit/lib/ObjectDatabase;->exists()Z

    move-result v5

    if-nez v5, :cond_3

    .line 92
    iget-boolean v5, p0, Lorg/eclipse/jgit/api/InitCommand;->bare:Z

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/lib/Repository;->create(Z)V

    .line 93
    :cond_3
    new-instance v5, Lorg/eclipse/jgit/api/Git;

    invoke-direct {v5, v4}, Lorg/eclipse/jgit/api/Git;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    return-object v5

    .line 82
    .end local v4           #repository:Lorg/eclipse/jgit/lib/Repository;
    :cond_4
    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/RepositoryBuilder;->getGitDir()Ljava/io/File;

    move-result-object v5

    if-nez v5, :cond_2

    .line 83
    new-instance v1, Ljava/io/File;

    const-string v5, "."

    invoke-direct {v1, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 84
    .restart local v1       #d:Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v5

    if-eqz v5, :cond_6

    .line 85
    invoke-virtual {v1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    move-object v2, v1

    .line 86
    .end local v1           #d:Ljava/io/File;
    .restart local v2       #d:Ljava/io/File;
    :goto_1
    iget-boolean v5, p0, Lorg/eclipse/jgit/api/InitCommand;->bare:Z

    if-nez v5, :cond_5

    .line 87
    new-instance v1, Ljava/io/File;

    const-string v5, ".git"

    invoke-direct {v1, v2, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 88
    .end local v2           #d:Ljava/io/File;
    .restart local v1       #d:Ljava/io/File;
    :goto_2
    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/RepositoryBuilder;->setGitDir(Ljava/io/File;)Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 94
    .end local v0           #builder:Lorg/eclipse/jgit/lib/RepositoryBuilder;
    .end local v1           #d:Ljava/io/File;
    :catch_0
    move-exception v3

    .line 95
    .local v3, e:Ljava/io/IOException;
    new-instance v5, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-virtual {v3}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, v3}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .end local v3           #e:Ljava/io/IOException;
    .restart local v0       #builder:Lorg/eclipse/jgit/lib/RepositoryBuilder;
    .restart local v2       #d:Ljava/io/File;
    :cond_5
    move-object v1, v2

    .end local v2           #d:Ljava/io/File;
    .restart local v1       #d:Ljava/io/File;
    goto :goto_2

    :cond_6
    move-object v2, v1

    .end local v1           #d:Ljava/io/File;
    .restart local v2       #d:Ljava/io/File;
    goto :goto_1
.end method

.method public setBare(Z)Lorg/eclipse/jgit/api/InitCommand;
    .locals 0
    .parameter "bare"

    .prologue
    .line 118
    iput-boolean p1, p0, Lorg/eclipse/jgit/api/InitCommand;->bare:Z

    .line 119
    return-object p0
.end method

.method public setDirectory(Ljava/io/File;)Lorg/eclipse/jgit/api/InitCommand;
    .locals 0
    .parameter "directory"

    .prologue
    .line 108
    iput-object p1, p0, Lorg/eclipse/jgit/api/InitCommand;->directory:Ljava/io/File;

    .line 109
    return-object p0
.end method
