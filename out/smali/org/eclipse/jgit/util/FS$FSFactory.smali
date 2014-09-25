.class public Lorg/eclipse/jgit/util/FS$FSFactory;
.super Ljava/lang/Object;
.source "FS.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/util/FS;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FSFactory"
.end annotation


# direct methods
.method protected constructor <init>()V
    .locals 0

    .prologue
    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    return-void
.end method


# virtual methods
.method public detect(Ljava/lang/Boolean;)Lorg/eclipse/jgit/util/FS;
    .locals 1
    .parameter "cygwinUsed"

    .prologue
    .line 83
    invoke-static {}, Lorg/eclipse/jgit/util/SystemReader;->getInstance()Lorg/eclipse/jgit/util/SystemReader;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jgit/util/SystemReader;->isWindows()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 84
    if-nez p1, :cond_0

    .line 85
    invoke-static {}, Lorg/eclipse/jgit/util/FS_Win32_Cygwin;->isCygwin()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    .line 86
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 87
    new-instance v0, Lorg/eclipse/jgit/util/FS_Win32_Cygwin;

    invoke-direct {v0}, Lorg/eclipse/jgit/util/FS_Win32_Cygwin;-><init>()V

    .line 93
    :goto_0
    return-object v0

    .line 89
    :cond_1
    new-instance v0, Lorg/eclipse/jgit/util/FS_Win32;

    invoke-direct {v0}, Lorg/eclipse/jgit/util/FS_Win32;-><init>()V

    goto :goto_0

    .line 90
    :cond_2
    invoke-static {}, Lorg/eclipse/jgit/util/FS_POSIX_Java6;->hasExecute()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 91
    new-instance v0, Lorg/eclipse/jgit/util/FS_POSIX_Java6;

    invoke-direct {v0}, Lorg/eclipse/jgit/util/FS_POSIX_Java6;-><init>()V

    goto :goto_0

    .line 93
    :cond_3
    new-instance v0, Lorg/eclipse/jgit/util/FS_POSIX_Java5;

    invoke-direct {v0}, Lorg/eclipse/jgit/util/FS_POSIX_Java5;-><init>()V

    goto :goto_0
.end method
