.class final Lorg/eclipse/jgit/transport/resolver/RepositoryResolver$1;
.super Ljava/lang/Object;
.source "RepositoryResolver.java"

# interfaces
.implements Lorg/eclipse/jgit/transport/resolver/RepositoryResolver;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/resolver/RepositoryResolver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/eclipse/jgit/transport/resolver/RepositoryResolver",
        "<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public open(Ljava/lang/Object;Ljava/lang/String;)Lorg/eclipse/jgit/lib/Repository;
    .locals 1
    .parameter "req"
    .parameter "name"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/RepositoryNotFoundException;
        }
    .end annotation

    .prologue
    .line 61
    new-instance v0, Lorg/eclipse/jgit/errors/RepositoryNotFoundException;

    invoke-direct {v0, p2}, Lorg/eclipse/jgit/errors/RepositoryNotFoundException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
