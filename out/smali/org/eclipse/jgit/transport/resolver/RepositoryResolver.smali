.class public interface abstract Lorg/eclipse/jgit/transport/resolver/RepositoryResolver;
.super Ljava/lang/Object;
.source "RepositoryResolver.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<C:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field public static final NONE:Lorg/eclipse/jgit/transport/resolver/RepositoryResolver;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/transport/resolver/RepositoryResolver",
            "<*>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 58
    new-instance v0, Lorg/eclipse/jgit/transport/resolver/RepositoryResolver$1;

    invoke-direct {v0}, Lorg/eclipse/jgit/transport/resolver/RepositoryResolver$1;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/transport/resolver/RepositoryResolver;->NONE:Lorg/eclipse/jgit/transport/resolver/RepositoryResolver;

    return-void
.end method


# virtual methods
.method public abstract open(Ljava/lang/Object;Ljava/lang/String;)Lorg/eclipse/jgit/lib/Repository;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TC;",
            "Ljava/lang/String;",
            ")",
            "Lorg/eclipse/jgit/lib/Repository;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/RepositoryNotFoundException;,
            Lorg/eclipse/jgit/transport/resolver/ServiceNotAuthorizedException;,
            Lorg/eclipse/jgit/transport/resolver/ServiceNotEnabledException;,
            Lorg/eclipse/jgit/transport/ServiceMayNotContinueException;
        }
    .end annotation
.end method
