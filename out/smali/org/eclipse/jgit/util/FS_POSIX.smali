.class public abstract Lorg/eclipse/jgit/util/FS_POSIX;
.super Lorg/eclipse/jgit/util/FS;
.source "FS_POSIX.java"


# direct methods
.method protected constructor <init>()V
    .locals 0

    .prologue
    .line 89
    invoke-direct {p0}, Lorg/eclipse/jgit/util/FS;-><init>()V

    .line 90
    return-void
.end method

.method protected constructor <init>(Lorg/eclipse/jgit/util/FS;)V
    .locals 0
    .parameter "src"

    .prologue
    .line 99
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/util/FS;-><init>(Lorg/eclipse/jgit/util/FS;)V

    .line 100
    return-void
.end method


# virtual methods
.method protected discoverGitPrefix()Ljava/io/File;
    .locals 10

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    const/4 v4, 0x0

    .line 61
    invoke-static {}, Lorg/eclipse/jgit/util/SystemReader;->getInstance()Lorg/eclipse/jgit/util/SystemReader;

    move-result-object v5

    const-string v6, "PATH"

    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/util/SystemReader;->getenv(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 62
    .local v2, path:Ljava/lang/String;
    new-array v5, v9, [Ljava/lang/String;

    const-string v6, "git"

    aput-object v6, v5, v8

    invoke-static {v2, v5}, Lorg/eclipse/jgit/util/FS_POSIX;->searchPath(Ljava/lang/String;[Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 63
    .local v0, gitExe:Ljava/io/File;
    if-eqz v0, :cond_1

    .line 64
    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v4

    .line 82
    :cond_0
    :goto_0
    return-object v4

    .line 66
    :cond_1
    invoke-static {}, Lorg/eclipse/jgit/util/SystemReader;->getInstance()Lorg/eclipse/jgit/util/SystemReader;

    move-result-object v5

    invoke-virtual {v5}, Lorg/eclipse/jgit/util/SystemReader;->isMacOS()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 71
    invoke-virtual {p0}, Lorg/eclipse/jgit/util/FS_POSIX;->userHome()Ljava/io/File;

    move-result-object v5

    const/4 v6, 0x4

    new-array v6, v6, [Ljava/lang/String;

    const-string v7, "bash"

    aput-object v7, v6, v8

    const-string v7, "--login"

    aput-object v7, v6, v9

    const/4 v7, 0x2

    const-string v8, "-c"

    aput-object v8, v6, v7

    const/4 v7, 0x3

    const-string v8, "which git"

    aput-object v8, v6, v7

    invoke-static {}, Ljava/nio/charset/Charset;->defaultCharset()Ljava/nio/charset/Charset;

    move-result-object v7

    invoke-virtual {v7}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v6, v7}, Lorg/eclipse/jgit/util/FS_POSIX;->readPipe(Ljava/io/File;[Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 74
    .local v3, w:Ljava/lang/String;
    if-eqz v3, :cond_0

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    if-eqz v5, :cond_0

    .line 76
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    .line 77
    .local v1, parentFile:Ljava/io/File;
    if-eqz v1, :cond_0

    .line 79
    invoke-virtual {v1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v4

    goto :goto_0
.end method

.method public isCaseSensitive()Z
    .locals 1

    .prologue
    .line 104
    invoke-static {}, Lorg/eclipse/jgit/util/SystemReader;->getInstance()Lorg/eclipse/jgit/util/SystemReader;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jgit/util/SystemReader;->isMacOS()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public runInShell(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/ProcessBuilder;
    .locals 4
    .parameter "cmd"
    .parameter "args"

    .prologue
    .line 114
    new-instance v0, Ljava/util/ArrayList;

    array-length v2, p2

    add-int/lit8 v2, v2, 0x4

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 115
    .local v0, argv:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    const-string v2, "sh"

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 116
    const-string v2, "-c"

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 117
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " \"$@\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 118
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 119
    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 120
    new-instance v1, Ljava/lang/ProcessBuilder;

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/lang/ProcessBuilder;-><init>([Ljava/lang/String;)V

    .line 121
    .local v1, proc:Ljava/lang/ProcessBuilder;
    invoke-virtual {v1, v0}, Ljava/lang/ProcessBuilder;->command(Ljava/util/List;)Ljava/lang/ProcessBuilder;

    .line 122
    return-object v1
.end method

.method public setHidden(Ljava/io/File;Z)V
    .locals 0
    .parameter "path"
    .parameter "hidden"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 110
    return-void
.end method
