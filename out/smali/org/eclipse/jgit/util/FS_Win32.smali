.class public Lorg/eclipse/jgit/util/FS_Win32;
.super Lorg/eclipse/jgit/util/FS;
.source "FS_Win32.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 64
    invoke-direct {p0}, Lorg/eclipse/jgit/util/FS;-><init>()V

    .line 65
    return-void
.end method

.method protected constructor <init>(Lorg/eclipse/jgit/util/FS;)V
    .locals 0
    .parameter "src"

    .prologue
    .line 74
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/util/FS;-><init>(Lorg/eclipse/jgit/util/FS;)V

    .line 75
    return-void
.end method

.method private static resolveGrandparentFile(Ljava/io/File;)Ljava/io/File;
    .locals 2
    .parameter "grandchild"

    .prologue
    .line 126
    if-eqz p0, :cond_0

    .line 127
    invoke-virtual {p0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    .line 128
    .local v0, parent:Ljava/io/File;
    if-eqz v0, :cond_0

    .line 129
    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    .line 131
    .end local v0           #parent:Ljava/io/File;
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method


# virtual methods
.method public canExecute(Ljava/io/File;)Z
    .locals 1
    .parameter "f"

    .prologue
    .line 86
    const/4 v0, 0x0

    return v0
.end method

.method protected discoverGitPrefix()Ljava/io/File;
    .locals 10

    .prologue
    const/4 v3, 0x0

    const/4 v9, 0x2

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 105
    invoke-static {}, Lorg/eclipse/jgit/util/SystemReader;->getInstance()Lorg/eclipse/jgit/util/SystemReader;

    move-result-object v4

    const-string v5, "PATH"

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/util/SystemReader;->getenv(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 106
    .local v1, path:Ljava/lang/String;
    new-array v4, v9, [Ljava/lang/String;

    const-string v5, "git.exe"

    aput-object v5, v4, v7

    const-string v5, "git.cmd"

    aput-object v5, v4, v8

    invoke-static {v1, v4}, Lorg/eclipse/jgit/util/FS_Win32;->searchPath(Ljava/lang/String;[Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 107
    .local v0, gitExe:Ljava/io/File;
    if-eqz v0, :cond_1

    .line 108
    invoke-static {v0}, Lorg/eclipse/jgit/util/FS_Win32;->resolveGrandparentFile(Ljava/io/File;)Ljava/io/File;

    move-result-object v3

    .line 122
    :cond_0
    :goto_0
    return-object v3

    .line 113
    :cond_1
    invoke-virtual {p0}, Lorg/eclipse/jgit/util/FS_Win32;->userHome()Ljava/io/File;

    move-result-object v4

    const/4 v5, 0x4

    new-array v5, v5, [Ljava/lang/String;

    const-string v6, "bash"

    aput-object v6, v5, v7

    const-string v6, "--login"

    aput-object v6, v5, v8

    const-string v6, "-c"

    aput-object v6, v5, v9

    const/4 v6, 0x3

    const-string v7, "which git"

    aput-object v7, v5, v6

    invoke-static {}, Ljava/nio/charset/Charset;->defaultCharset()Ljava/nio/charset/Charset;

    move-result-object v6

    invoke-virtual {v6}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lorg/eclipse/jgit/util/FS_Win32;->readPipe(Ljava/io/File;[Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 116
    .local v2, w:Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 118
    invoke-virtual {p0, v3, v2}, Lorg/eclipse/jgit/util/FS_Win32;->resolve(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 119
    if-eqz v0, :cond_0

    .line 120
    invoke-static {v0}, Lorg/eclipse/jgit/util/FS_Win32;->resolveGrandparentFile(Ljava/io/File;)Ljava/io/File;

    move-result-object v3

    goto :goto_0
.end method

.method public isCaseSensitive()Z
    .locals 1

    .prologue
    .line 95
    const/4 v0, 0x0

    return v0
.end method

.method public newInstance()Lorg/eclipse/jgit/util/FS;
    .locals 1

    .prologue
    .line 78
    new-instance v0, Lorg/eclipse/jgit/util/FS_Win32;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/util/FS_Win32;-><init>(Lorg/eclipse/jgit/util/FS;)V

    return-object v0
.end method

.method public retryFailedLockFileCommit()Z
    .locals 1

    .prologue
    .line 100
    const/4 v0, 0x1

    return v0
.end method

.method public runInShell(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/ProcessBuilder;
    .locals 3
    .parameter "cmd"
    .parameter "args"

    .prologue
    .line 155
    new-instance v0, Ljava/util/ArrayList;

    array-length v2, p2

    add-int/lit8 v2, v2, 0x3

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 156
    .local v0, argv:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    const-string v2, "cmd.exe"

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 157
    const-string v2, "/c"

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 158
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 159
    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 160
    new-instance v1, Ljava/lang/ProcessBuilder;

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/lang/ProcessBuilder;-><init>([Ljava/lang/String;)V

    .line 161
    .local v1, proc:Ljava/lang/ProcessBuilder;
    invoke-virtual {v1, v0}, Ljava/lang/ProcessBuilder;->command(Ljava/util/List;)Ljava/lang/ProcessBuilder;

    .line 162
    return-object v1
.end method

.method public setExecute(Ljava/io/File;Z)Z
    .locals 1
    .parameter "f"
    .parameter "canExec"

    .prologue
    .line 90
    const/4 v0, 0x0

    return v0
.end method

.method public supportsExecute()Z
    .locals 1

    .prologue
    .line 82
    const/4 v0, 0x0

    return v0
.end method

.method protected userHomeImpl()Ljava/io/File;
    .locals 6

    .prologue
    .line 136
    invoke-static {}, Lorg/eclipse/jgit/util/SystemReader;->getInstance()Lorg/eclipse/jgit/util/SystemReader;

    move-result-object v4

    const-string v5, "HOME"

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/util/SystemReader;->getenv(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 137
    .local v0, home:Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 138
    const/4 v4, 0x0

    invoke-virtual {p0, v4, v0}, Lorg/eclipse/jgit/util/FS_Win32;->resolve(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v4

    .line 150
    :goto_0
    return-object v4

    .line 139
    :cond_0
    invoke-static {}, Lorg/eclipse/jgit/util/SystemReader;->getInstance()Lorg/eclipse/jgit/util/SystemReader;

    move-result-object v4

    const-string v5, "HOMEDRIVE"

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/util/SystemReader;->getenv(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 140
    .local v1, homeDrive:Ljava/lang/String;
    if-eqz v1, :cond_1

    .line 141
    invoke-static {}, Lorg/eclipse/jgit/util/SystemReader;->getInstance()Lorg/eclipse/jgit/util/SystemReader;

    move-result-object v4

    const-string v5, "HOMEPATH"

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/util/SystemReader;->getenv(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 142
    .local v2, homePath:Ljava/lang/String;
    if-eqz v2, :cond_1

    .line 143
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 146
    .end local v2           #homePath:Ljava/lang/String;
    :cond_1
    invoke-static {}, Lorg/eclipse/jgit/util/SystemReader;->getInstance()Lorg/eclipse/jgit/util/SystemReader;

    move-result-object v4

    const-string v5, "HOMESHARE"

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/util/SystemReader;->getenv(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 147
    .local v3, homeShare:Ljava/lang/String;
    if-eqz v3, :cond_2

    .line 148
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    goto :goto_0

    .line 150
    :cond_2
    invoke-super {p0}, Lorg/eclipse/jgit/util/FS;->userHomeImpl()Ljava/io/File;

    move-result-object v4

    goto :goto_0
.end method
