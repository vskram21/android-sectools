.class public interface abstract Lorg/eclipse/jgit/transport/PostReceiveHook;
.super Ljava/lang/Object;
.source "PostReceiveHook.java"


# static fields
.field public static final NULL:Lorg/eclipse/jgit/transport/PostReceiveHook;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 64
    new-instance v0, Lorg/eclipse/jgit/transport/PostReceiveHook$1;

    invoke-direct {v0}, Lorg/eclipse/jgit/transport/PostReceiveHook$1;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/transport/PostReceiveHook;->NULL:Lorg/eclipse/jgit/transport/PostReceiveHook;

    return-void
.end method


# virtual methods
.method public abstract onPostReceive(Lorg/eclipse/jgit/transport/ReceivePack;Ljava/util/Collection;)V
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
