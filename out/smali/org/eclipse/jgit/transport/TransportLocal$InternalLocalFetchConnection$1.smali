.class Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalFetchConnection$1;
.super Ljava/io/PipedInputStream;
.source "TransportLocal.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalFetchConnection;-><init>(Lorg/eclipse/jgit/transport/TransportLocal;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalFetchConnection;

.field final synthetic val$this$0:Lorg/eclipse/jgit/transport/TransportLocal;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalFetchConnection;Lorg/eclipse/jgit/transport/TransportLocal;)V
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 239
    iput-object p1, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalFetchConnection$1;->this$1:Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalFetchConnection;

    iput-object p2, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalFetchConnection$1;->val$this$0:Lorg/eclipse/jgit/transport/TransportLocal;

    invoke-direct {p0}, Ljava/io/PipedInputStream;-><init>()V

    .line 245
    const/16 v0, 0xb88

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/eclipse/jgit/transport/TransportLocal$InternalLocalFetchConnection$1;->buffer:[B

    .line 246
    return-void
.end method
