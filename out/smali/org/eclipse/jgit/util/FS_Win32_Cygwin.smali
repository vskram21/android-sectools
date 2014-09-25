.class public Lorg/eclipse/jgit/util/FS_Win32_Cygwin;
.super Lorg/eclipse/jgit/util/FS_Win32;
.source "FS_Win32_Cygwin.java"


# static fields
.field private static cygpath:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 84
    invoke-direct {p0}, Lorg/eclipse/jgit/util/FS_Win32;-><init>()V

    .line 85
    return-void
.end method

.method protected constructor <init>(Lorg/eclipse/jgit/util/FS;)V
    .locals 0
    .parameter "src"

    .prologue
    .line 94
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/util/FS_Win32;-><init>(Lorg/eclipse/jgit/util/FS;)V

    .line 95
    return-void
.end method

.method public static isCygwin()Z
    .locals 6

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 66
    new-instance v4, Lorg/eclipse/jgit/util/FS_Win32_Cygwin$1;

    invoke-direct {v4}, Lorg/eclipse/jgit/util/FS_Win32_Cygwin$1;-><init>()V

    invoke-static {v4}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 72
    .local v1, path:Ljava/lang/String;
    if-nez v1, :cond_0

    .line 77
    :goto_0
    return v3

    .line 74
    :cond_0
    new-array v4, v2, [Ljava/lang/String;

    const-string v5, "cygpath.exe"

    aput-object v5, v4, v3

    invoke-static {v1, v4}, Lorg/eclipse/jgit/util/FS;->searchPath(Ljava/lang/String;[Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 75
    .local v0, found:Ljava/io/File;
    if-eqz v0, :cond_1

    .line 76
    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    sput-object v4, Lorg/eclipse/jgit/util/FS_Win32_Cygwin;->cygpath:Ljava/lang/String;

    .line 77
    :cond_1
    sget-object v4, Lorg/eclipse/jgit/util/FS_Win32_Cygwin;->cygpath:Ljava/lang/String;

    if-eqz v4, :cond_2

    :goto_1
    move v3, v2

    goto :goto_0

    :cond_2
    move v2, v3

    goto :goto_1
.end method


# virtual methods
.method public newInstance()Lorg/eclipse/jgit/util/FS;
    .locals 1

    .prologue
    .line 98
    new-instance v0, Lorg/eclipse/jgit/util/FS_Win32_Cygwin;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/util/FS_Win32_Cygwin;-><init>(Lorg/eclipse/jgit/util/FS;)V

    return-object v0
.end method

.method public resolve(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;
    .locals 5
    .parameter "dir"
    .parameter "pn"

    .prologue
    .line 102
    const-string v2, "jgit.usecygpath"

    invoke-static {v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 103
    .local v0, useCygPath:Ljava/lang/String;
    if-eqz v0, :cond_0

    const-string v2, "true"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 104
    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    sget-object v4, Lorg/eclipse/jgit/util/FS_Win32_Cygwin;->cygpath:Ljava/lang/String;

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-string v4, "--windows"

    aput-object v4, v2, v3

    const/4 v3, 0x2

    const-string v4, "--absolute"

    aput-object v4, v2, v3

    const/4 v3, 0x3

    aput-object p2, v2, v3

    const-string v3, "UTF-8"

    invoke-static {p1, v2, v3}, Lorg/eclipse/jgit/util/FS_Win32_Cygwin;->readPipe(Ljava/io/File;[Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 107
    .local v1, w:Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 108
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 110
    .end local v1           #w:Ljava/lang/String;
    :goto_0
    return-object v2

    :cond_0
    invoke-super {p0, p1, p2}, Lorg/eclipse/jgit/util/FS_Win32;->resolve(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    goto :goto_0
.end method

.method public runInShell(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/ProcessBuilder;
    .locals 4
    .parameter "cmd"
    .parameter "args"

    .prologue
    .line 128
    new-instance v0, Ljava/util/ArrayList;

    array-length v2, p2

    add-int/lit8 v2, v2, 0x4

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 129
    .local v0, argv:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    const-string v2, "sh.exe"

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 130
    const-string v2, "-c"

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 131
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

    .line 132
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 133
    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 134
    new-instance v1, Ljava/lang/ProcessBuilder;

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/lang/ProcessBuilder;-><init>([Ljava/lang/String;)V

    .line 135
    .local v1, proc:Ljava/lang/ProcessBuilder;
    invoke-virtual {v1, v0}, Ljava/lang/ProcessBuilder;->command(Ljava/util/List;)Ljava/lang/ProcessBuilder;

    .line 136
    return-object v1
.end method

.method protected userHomeImpl()Ljava/io/File;
    .locals 3

    .prologue
    .line 115
    new-instance v1, Lorg/eclipse/jgit/util/FS_Win32_Cygwin$2;

    invoke-direct {v1, p0}, Lorg/eclipse/jgit/util/FS_Win32_Cygwin$2;-><init>(Lorg/eclipse/jgit/util/FS_Win32_Cygwin;)V

    invoke-static {v1}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 121
    .local v0, home:Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1

    .line 122
    :cond_0
    invoke-super {p0}, Lorg/eclipse/jgit/util/FS_Win32;->userHomeImpl()Ljava/io/File;

    move-result-object v1

    .line 123
    :goto_0
    return-object v1

    :cond_1
    new-instance v1, Ljava/io/File;

    const-string v2, "."

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1, v0}, Lorg/eclipse/jgit/util/FS_Win32_Cygwin;->resolve(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    goto :goto_0
.end method
