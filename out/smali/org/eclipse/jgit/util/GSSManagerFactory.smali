.class public abstract Lorg/eclipse/jgit/util/GSSManagerFactory;
.super Ljava/lang/Object;
.source "GSSManagerFactory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/util/GSSManagerFactory$1;,
        Lorg/eclipse/jgit/util/GSSManagerFactory$DefaultGSSManagerFactory;,
        Lorg/eclipse/jgit/util/GSSManagerFactory$SunGSSManagerFactory;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 92
    return-void
.end method

.method public static detect()Lorg/eclipse/jgit/util/GSSManagerFactory;
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 64
    invoke-static {}, Lorg/eclipse/jgit/util/GSSManagerFactory$SunGSSManagerFactory;->isSupported()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lorg/eclipse/jgit/util/GSSManagerFactory$SunGSSManagerFactory;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/util/GSSManagerFactory$SunGSSManagerFactory;-><init>(Lorg/eclipse/jgit/util/GSSManagerFactory$1;)V

    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lorg/eclipse/jgit/util/GSSManagerFactory$DefaultGSSManagerFactory;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/util/GSSManagerFactory$DefaultGSSManagerFactory;-><init>(Lorg/eclipse/jgit/util/GSSManagerFactory$1;)V

    goto :goto_0
.end method


# virtual methods
.method public abstract newInstance(Ljava/net/URL;)Lorg/ietf/jgss/GSSManager;
.end method
