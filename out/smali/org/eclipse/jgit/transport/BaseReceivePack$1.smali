.class Lorg/eclipse/jgit/transport/BaseReceivePack$1;
.super Lorg/eclipse/jgit/util/io/LimitedInputStream;
.source "BaseReceivePack.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/transport/BaseReceivePack;->init(Ljava/io/InputStream;Ljava/io/OutputStream;Ljava/io/OutputStream;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jgit/transport/BaseReceivePack;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/transport/BaseReceivePack;Ljava/io/InputStream;J)V
    .locals 0
    .parameter
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 819
    iput-object p1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack$1;->this$0:Lorg/eclipse/jgit/transport/BaseReceivePack;

    invoke-direct {p0, p2, p3, p4}, Lorg/eclipse/jgit/util/io/LimitedInputStream;-><init>(Ljava/io/InputStream;J)V

    return-void
.end method


# virtual methods
.method protected limitExceeded()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/TooLargePackException;
        }
    .end annotation

    .prologue
    .line 822
    new-instance v0, Lorg/eclipse/jgit/errors/TooLargePackException;

    iget-wide v1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack$1;->limit:J

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/errors/TooLargePackException;-><init>(J)V

    throw v0
.end method
