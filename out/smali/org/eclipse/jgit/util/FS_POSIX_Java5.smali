.class public Lorg/eclipse/jgit/util/FS_POSIX_Java5;
.super Lorg/eclipse/jgit/util/FS_POSIX;
.source "FS_POSIX_Java5.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 59
    invoke-direct {p0}, Lorg/eclipse/jgit/util/FS_POSIX;-><init>()V

    .line 60
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/util/FS;)V
    .locals 0
    .parameter "src"

    .prologue
    .line 69
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/util/FS_POSIX;-><init>(Lorg/eclipse/jgit/util/FS;)V

    .line 70
    return-void
.end method


# virtual methods
.method public canExecute(Ljava/io/File;)Z
    .locals 1
    .parameter "f"

    .prologue
    .line 82
    const/4 v0, 0x0

    return v0
.end method

.method public newInstance()Lorg/eclipse/jgit/util/FS;
    .locals 1

    .prologue
    .line 74
    new-instance v0, Lorg/eclipse/jgit/util/FS_POSIX_Java5;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/util/FS_POSIX_Java5;-><init>(Lorg/eclipse/jgit/util/FS;)V

    return-object v0
.end method

.method public retryFailedLockFileCommit()Z
    .locals 1

    .prologue
    .line 91
    const/4 v0, 0x0

    return v0
.end method

.method public setExecute(Ljava/io/File;Z)Z
    .locals 1
    .parameter "f"
    .parameter "canExec"

    .prologue
    .line 86
    const/4 v0, 0x0

    return v0
.end method

.method public supportsExecute()Z
    .locals 1

    .prologue
    .line 78
    const/4 v0, 0x0

    return v0
.end method
