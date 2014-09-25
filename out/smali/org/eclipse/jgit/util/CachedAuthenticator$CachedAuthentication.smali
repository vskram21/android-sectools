.class public Lorg/eclipse/jgit/util/CachedAuthenticator$CachedAuthentication;
.super Ljava/lang/Object;
.source "CachedAuthenticator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/util/CachedAuthenticator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CachedAuthentication"
.end annotation


# instance fields
.field final host:Ljava/lang/String;

.field final pass:Ljava/lang/String;

.field final port:I

.field final user:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .parameter "aHost"
    .parameter "aPort"
    .parameter "aUser"
    .parameter "aPass"

    .prologue
    .line 115
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 116
    iput-object p1, p0, Lorg/eclipse/jgit/util/CachedAuthenticator$CachedAuthentication;->host:Ljava/lang/String;

    .line 117
    iput p2, p0, Lorg/eclipse/jgit/util/CachedAuthenticator$CachedAuthentication;->port:I

    .line 118
    iput-object p3, p0, Lorg/eclipse/jgit/util/CachedAuthenticator$CachedAuthentication;->user:Ljava/lang/String;

    .line 119
    iput-object p4, p0, Lorg/eclipse/jgit/util/CachedAuthenticator$CachedAuthentication;->pass:Ljava/lang/String;

    .line 120
    return-void
.end method


# virtual methods
.method toPasswordAuthentication()Ljava/net/PasswordAuthentication;
    .locals 3

    .prologue
    .line 123
    new-instance v0, Ljava/net/PasswordAuthentication;

    iget-object v1, p0, Lorg/eclipse/jgit/util/CachedAuthenticator$CachedAuthentication;->user:Ljava/lang/String;

    iget-object v2, p0, Lorg/eclipse/jgit/util/CachedAuthenticator$CachedAuthentication;->pass:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->toCharArray()[C

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/net/PasswordAuthentication;-><init>(Ljava/lang/String;[C)V

    return-object v0
.end method
