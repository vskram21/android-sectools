.class final Lorg/eclipse/jgit/util/SystemReader$1;
.super Lorg/eclipse/jgit/util/SystemReader;
.source "SystemReader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/util/SystemReader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private volatile hostname:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 71
    const-class v0, Lorg/eclipse/jgit/util/SystemReader;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lorg/eclipse/jgit/util/SystemReader$1;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method constructor <init>()V
    .locals 0

    .prologue
    .line 71
    invoke-direct {p0}, Lorg/eclipse/jgit/util/SystemReader;-><init>()V

    return-void
.end method


# virtual methods
.method public getCurrentTime()J
    .locals 2

    .prologue
    .line 122
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    return-wide v0
.end method

.method public getHostname()Ljava/lang/String;
    .locals 3

    .prologue
    .line 107
    iget-object v2, p0, Lorg/eclipse/jgit/util/SystemReader$1;->hostname:Ljava/lang/String;

    if-nez v2, :cond_0

    .line 109
    :try_start_0
    invoke-static {}, Ljava/net/InetAddress;->getLocalHost()Ljava/net/InetAddress;

    move-result-object v1

    .line 110
    .local v1, localMachine:Ljava/net/InetAddress;
    invoke-virtual {v1}, Ljava/net/InetAddress;->getCanonicalHostName()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lorg/eclipse/jgit/util/SystemReader$1;->hostname:Ljava/lang/String;
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0

    .line 115
    .end local v1           #localMachine:Ljava/net/InetAddress;
    :goto_0
    sget-boolean v2, Lorg/eclipse/jgit/util/SystemReader$1;->$assertionsDisabled:Z

    if-nez v2, :cond_0

    iget-object v2, p0, Lorg/eclipse/jgit/util/SystemReader$1;->hostname:Ljava/lang/String;

    if-nez v2, :cond_0

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 111
    :catch_0
    move-exception v0

    .line 113
    .local v0, e:Ljava/net/UnknownHostException;
    const-string v2, "localhost"

    iput-object v2, p0, Lorg/eclipse/jgit/util/SystemReader$1;->hostname:Ljava/lang/String;

    goto :goto_0

    .line 117
    .end local v0           #e:Ljava/net/UnknownHostException;
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jgit/util/SystemReader$1;->hostname:Ljava/lang/String;

    return-object v2
.end method

.method public getProperty(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "key"

    .prologue
    .line 79
    invoke-static {p1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTimezone(J)I
    .locals 2
    .parameter "when"

    .prologue
    .line 127
    invoke-virtual {p0}, Lorg/eclipse/jgit/util/SystemReader$1;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/util/TimeZone;->getOffset(J)I

    move-result v0

    const v1, 0xea60

    div-int/2addr v0, v1

    return v0
.end method

.method public getenv(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "variable"

    .prologue
    .line 75
    invoke-static {p1}, Ljava/lang/System;->getenv(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public openSystemConfig(Lorg/eclipse/jgit/lib/Config;Lorg/eclipse/jgit/util/FS;)Lorg/eclipse/jgit/storage/file/FileBasedConfig;
    .locals 5
    .parameter "parent"
    .parameter "fs"

    .prologue
    .line 83
    invoke-virtual {p2}, Lorg/eclipse/jgit/util/FS;->gitPrefix()Ljava/io/File;

    move-result-object v2

    .line 84
    .local v2, prefix:Ljava/io/File;
    if-nez v2, :cond_0

    .line 85
    new-instance v3, Lorg/eclipse/jgit/util/SystemReader$1$1;

    const/4 v4, 0x0

    invoke-direct {v3, p0, v4, p2}, Lorg/eclipse/jgit/util/SystemReader$1$1;-><init>(Lorg/eclipse/jgit/util/SystemReader$1;Ljava/io/File;Lorg/eclipse/jgit/util/FS;)V

    .line 98
    :goto_0
    return-object v3

    .line 96
    :cond_0
    const-string v3, "etc"

    invoke-virtual {p2, v2, v3}, Lorg/eclipse/jgit/util/FS;->resolve(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    .line 97
    .local v1, etc:Ljava/io/File;
    const-string v3, "gitconfig"

    invoke-virtual {p2, v1, v3}, Lorg/eclipse/jgit/util/FS;->resolve(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 98
    .local v0, config:Ljava/io/File;
    new-instance v3, Lorg/eclipse/jgit/storage/file/FileBasedConfig;

    invoke-direct {v3, p1, v0, p2}, Lorg/eclipse/jgit/storage/file/FileBasedConfig;-><init>(Lorg/eclipse/jgit/lib/Config;Ljava/io/File;Lorg/eclipse/jgit/util/FS;)V

    goto :goto_0
.end method

.method public openUserConfig(Lorg/eclipse/jgit/lib/Config;Lorg/eclipse/jgit/util/FS;)Lorg/eclipse/jgit/storage/file/FileBasedConfig;
    .locals 4
    .parameter "parent"
    .parameter "fs"

    .prologue
    .line 102
    invoke-virtual {p2}, Lorg/eclipse/jgit/util/FS;->userHome()Ljava/io/File;

    move-result-object v0

    .line 103
    .local v0, home:Ljava/io/File;
    new-instance v1, Lorg/eclipse/jgit/storage/file/FileBasedConfig;

    new-instance v2, Ljava/io/File;

    const-string v3, ".gitconfig"

    invoke-direct {v2, v0, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v1, p1, v2, p2}, Lorg/eclipse/jgit/storage/file/FileBasedConfig;-><init>(Lorg/eclipse/jgit/lib/Config;Ljava/io/File;Lorg/eclipse/jgit/util/FS;)V

    return-object v1
.end method
