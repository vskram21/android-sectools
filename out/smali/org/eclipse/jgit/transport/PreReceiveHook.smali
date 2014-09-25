.class public interface abstract Lorg/eclipse/jgit/transport/PreReceiveHook;
.super Ljava/lang/Object;
.source "PreReceiveHook.java"


# static fields
.field public static final NULL:Lorg/eclipse/jgit/transport/PreReceiveHook;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 80
    new-instance v0, Lorg/eclipse/jgit/transport/PreReceiveHook$1;

    invoke-direct {v0}, Lorg/eclipse/jgit/transport/PreReceiveHook$1;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/transport/PreReceiveHook;->NULL:Lorg/eclipse/jgit/transport/PreReceiveHook;

    return-void
.end method


# virtual methods
.method public abstract onPreReceive(Lorg/eclipse/jgit/transport/ReceivePack;Ljava/util/Collection;)V
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
.end method
