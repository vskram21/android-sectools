.class public abstract Lorg/eclipse/jgit/util/CachedAuthenticator;
.super Ljava/net/Authenticator;
.source "CachedAuthenticator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/util/CachedAuthenticator$CachedAuthentication;
    }
.end annotation


# static fields
.field private static final cached:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/util/CachedAuthenticator$CachedAuthentication;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 54
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/util/CachedAuthenticator;->cached:Ljava/util/Collection;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/net/Authenticator;-><init>()V

    .line 93
    return-void
.end method

.method public static add(Lorg/eclipse/jgit/util/CachedAuthenticator$CachedAuthentication;)V
    .locals 1
    .parameter "ca"

    .prologue
    .line 63
    sget-object v0, Lorg/eclipse/jgit/util/CachedAuthenticator;->cached:Ljava/util/Collection;

    invoke-interface {v0, p0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 64
    return-void
.end method


# virtual methods
.method protected final getPasswordAuthentication()Ljava/net/PasswordAuthentication;
    .locals 8

    .prologue
    .line 68
    invoke-virtual {p0}, Lorg/eclipse/jgit/util/CachedAuthenticator;->getRequestingHost()Ljava/lang/String;

    move-result-object v1

    .line 69
    .local v1, host:Ljava/lang/String;
    invoke-virtual {p0}, Lorg/eclipse/jgit/util/CachedAuthenticator;->getRequestingPort()I

    move-result v4

    .line 70
    .local v4, port:I
    sget-object v5, Lorg/eclipse/jgit/util/CachedAuthenticator;->cached:Ljava/util/Collection;

    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/util/CachedAuthenticator$CachedAuthentication;

    .line 71
    .local v0, ca:Lorg/eclipse/jgit/util/CachedAuthenticator$CachedAuthentication;
    iget-object v5, v0, Lorg/eclipse/jgit/util/CachedAuthenticator$CachedAuthentication;->host:Ljava/lang/String;

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    iget v5, v0, Lorg/eclipse/jgit/util/CachedAuthenticator$CachedAuthentication;->port:I

    if-ne v5, v4, :cond_0

    .line 72
    invoke-virtual {v0}, Lorg/eclipse/jgit/util/CachedAuthenticator$CachedAuthentication;->toPasswordAuthentication()Ljava/net/PasswordAuthentication;

    move-result-object v5

    .line 81
    .end local v0           #ca:Lorg/eclipse/jgit/util/CachedAuthenticator$CachedAuthentication;
    :goto_0
    return-object v5

    .line 74
    :cond_1
    invoke-virtual {p0}, Lorg/eclipse/jgit/util/CachedAuthenticator;->promptPasswordAuthentication()Ljava/net/PasswordAuthentication;

    move-result-object v3

    .line 75
    .local v3, pa:Ljava/net/PasswordAuthentication;
    if-eqz v3, :cond_2

    .line 76
    new-instance v0, Lorg/eclipse/jgit/util/CachedAuthenticator$CachedAuthentication;

    invoke-virtual {v3}, Ljava/net/PasswordAuthentication;->getUserName()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/String;

    invoke-virtual {v3}, Ljava/net/PasswordAuthentication;->getPassword()[C

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/String;-><init>([C)V

    invoke-direct {v0, v1, v4, v5, v6}, Lorg/eclipse/jgit/util/CachedAuthenticator$CachedAuthentication;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 78
    .restart local v0       #ca:Lorg/eclipse/jgit/util/CachedAuthenticator$CachedAuthentication;
    invoke-static {v0}, Lorg/eclipse/jgit/util/CachedAuthenticator;->add(Lorg/eclipse/jgit/util/CachedAuthenticator$CachedAuthentication;)V

    .line 79
    invoke-virtual {v0}, Lorg/eclipse/jgit/util/CachedAuthenticator$CachedAuthentication;->toPasswordAuthentication()Ljava/net/PasswordAuthentication;

    move-result-object v5

    goto :goto_0

    .line 81
    .end local v0           #ca:Lorg/eclipse/jgit/util/CachedAuthenticator$CachedAuthentication;
    :cond_2
    const/4 v5, 0x0

    goto :goto_0
.end method

.method protected abstract promptPasswordAuthentication()Ljava/net/PasswordAuthentication;
.end method
