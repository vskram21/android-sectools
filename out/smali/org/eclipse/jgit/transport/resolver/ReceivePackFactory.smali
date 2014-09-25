.class public interface abstract Lorg/eclipse/jgit/transport/resolver/ReceivePackFactory;
.super Ljava/lang/Object;
.source "ReceivePackFactory.java"


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
.field public static final DISABLED:Lorg/eclipse/jgit/transport/resolver/ReceivePackFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/transport/resolver/ReceivePackFactory",
            "<*>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 57
    new-instance v0, Lorg/eclipse/jgit/transport/resolver/ReceivePackFactory$1;

    invoke-direct {v0}, Lorg/eclipse/jgit/transport/resolver/ReceivePackFactory$1;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/transport/resolver/ReceivePackFactory;->DISABLED:Lorg/eclipse/jgit/transport/resolver/ReceivePackFactory;

    return-void
.end method


# virtual methods
.method public abstract create(Ljava/lang/Object;Lorg/eclipse/jgit/lib/Repository;)Lorg/eclipse/jgit/transport/ReceivePack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TC;",
            "Lorg/eclipse/jgit/lib/Repository;",
            ")",
            "Lorg/eclipse/jgit/transport/ReceivePack;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/transport/resolver/ServiceNotEnabledException;,
            Lorg/eclipse/jgit/transport/resolver/ServiceNotAuthorizedException;
        }
    .end annotation
.end method
