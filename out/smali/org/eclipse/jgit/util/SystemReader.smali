.class public abstract Lorg/eclipse/jgit/util/SystemReader;
.super Ljava/lang/Object;
.source "SystemReader.java"


# static fields
.field private static DEFAULT:Lorg/eclipse/jgit/util/SystemReader;

.field private static INSTANCE:Lorg/eclipse/jgit/util/SystemReader;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 71
    new-instance v0, Lorg/eclipse/jgit/util/SystemReader$1;

    invoke-direct {v0}, Lorg/eclipse/jgit/util/SystemReader$1;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/util/SystemReader;->DEFAULT:Lorg/eclipse/jgit/util/SystemReader;

    .line 131
    sget-object v0, Lorg/eclipse/jgit/util/SystemReader;->DEFAULT:Lorg/eclipse/jgit/util/SystemReader;

    sput-object v0, Lorg/eclipse/jgit/util/SystemReader;->INSTANCE:Lorg/eclipse/jgit/util/SystemReader;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance()Lorg/eclipse/jgit/util/SystemReader;
    .locals 1

    .prologue
    .line 135
    sget-object v0, Lorg/eclipse/jgit/util/SystemReader;->INSTANCE:Lorg/eclipse/jgit/util/SystemReader;

    return-object v0
.end method

.method public static setInstance(Lorg/eclipse/jgit/util/SystemReader;)V
    .locals 1
    .parameter "newReader"

    .prologue
    .line 144
    if-nez p0, :cond_0

    .line 145
    sget-object v0, Lorg/eclipse/jgit/util/SystemReader;->DEFAULT:Lorg/eclipse/jgit/util/SystemReader;

    sput-object v0, Lorg/eclipse/jgit/util/SystemReader;->INSTANCE:Lorg/eclipse/jgit/util/SystemReader;

    .line 148
    :goto_0
    return-void

    .line 147
    :cond_0
    sput-object p0, Lorg/eclipse/jgit/util/SystemReader;->INSTANCE:Lorg/eclipse/jgit/util/SystemReader;

    goto :goto_0
.end method


# virtual methods
.method public abstract getCurrentTime()J
.end method

.method public getDateTimeInstance(II)Ljava/text/DateFormat;
    .locals 1
    .parameter "dateStyle"
    .parameter "timeStyle"

    .prologue
    .line 260
    invoke-static {p1, p2}, Ljava/text/DateFormat;->getDateTimeInstance(II)Ljava/text/DateFormat;

    move-result-object v0

    return-object v0
.end method

.method public abstract getHostname()Ljava/lang/String;
.end method

.method public getLocale()Ljava/util/Locale;
    .locals 1

    .prologue
    .line 216
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    return-object v0
.end method

.method public abstract getProperty(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public getSimpleDateFormat(Ljava/lang/String;)Ljava/text/SimpleDateFormat;
    .locals 1
    .parameter "pattern"

    .prologue
    .line 229
    new-instance v0, Ljava/text/SimpleDateFormat;

    invoke-direct {v0, p1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public getSimpleDateFormat(Ljava/lang/String;Ljava/util/Locale;)Ljava/text/SimpleDateFormat;
    .locals 1
    .parameter "pattern"
    .parameter "locale"

    .prologue
    .line 244
    new-instance v0, Ljava/text/SimpleDateFormat;

    invoke-direct {v0, p1, p2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    return-object v0
.end method

.method public getTimeZone()Ljava/util/TimeZone;
    .locals 1

    .prologue
    .line 208
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v0

    return-object v0
.end method

.method public abstract getTimezone(J)I
.end method

.method public abstract getenv(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public isMacOS()Z
    .locals 2

    .prologue
    .line 280
    new-instance v1, Lorg/eclipse/jgit/util/SystemReader$3;

    invoke-direct {v1, p0}, Lorg/eclipse/jgit/util/SystemReader$3;-><init>(Lorg/eclipse/jgit/util/SystemReader;)V

    invoke-static {v1}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 286
    .local v0, osDotName:Ljava/lang/String;
    const-string v1, "Mac OS X"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "Darwin"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public isWindows()Z
    .locals 2

    .prologue
    .line 267
    new-instance v1, Lorg/eclipse/jgit/util/SystemReader$2;

    invoke-direct {v1, p0}, Lorg/eclipse/jgit/util/SystemReader$2;-><init>(Lorg/eclipse/jgit/util/SystemReader;)V

    invoke-static {v1}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 273
    .local v0, osDotName:Ljava/lang/String;
    const-string v1, "Windows"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    return v1
.end method

.method public abstract openSystemConfig(Lorg/eclipse/jgit/lib/Config;Lorg/eclipse/jgit/util/FS;)Lorg/eclipse/jgit/storage/file/FileBasedConfig;
.end method

.method public abstract openUserConfig(Lorg/eclipse/jgit/lib/Config;Lorg/eclipse/jgit/util/FS;)Lorg/eclipse/jgit/storage/file/FileBasedConfig;
.end method
