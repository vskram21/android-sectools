.class final Lorg/eclipse/jgit/transport/PreReceiveHook$1;
.super Ljava/lang/Object;
.source "PreReceiveHook.java"

# interfaces
.implements Lorg/eclipse/jgit/transport/PreReceiveHook;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/PreReceiveHook;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreReceive(Lorg/eclipse/jgit/transport/ReceivePack;Ljava/util/Collection;)V
    .locals 0
    .parameter "rp"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/transport/ReceivePack;",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/transport/ReceiveCommand;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 84
    .local p2, commands:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/transport/ReceiveCommand;>;"
    return-void
.end method
