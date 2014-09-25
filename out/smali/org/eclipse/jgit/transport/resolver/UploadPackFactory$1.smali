.class final Lorg/eclipse/jgit/transport/resolver/UploadPackFactory$1;
.super Ljava/lang/Object;
.source "UploadPackFactory.java"

# interfaces
.implements Lorg/eclipse/jgit/transport/resolver/UploadPackFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/resolver/UploadPackFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/eclipse/jgit/transport/resolver/UploadPackFactory",
        "<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public create(Ljava/lang/Object;Lorg/eclipse/jgit/lib/Repository;)Lorg/eclipse/jgit/transport/UploadPack;
    .locals 1
    .parameter "req"
    .parameter "db"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/transport/resolver/ServiceNotEnabledException;
        }
    .end annotation

    .prologue
    .line 60
    new-instance v0, Lorg/eclipse/jgit/transport/resolver/ServiceNotEnabledException;

    invoke-direct {v0}, Lorg/eclipse/jgit/transport/resolver/ServiceNotEnabledException;-><init>()V

    throw v0
.end method
