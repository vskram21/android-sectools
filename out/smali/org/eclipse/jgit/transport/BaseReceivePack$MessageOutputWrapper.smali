.class Lorg/eclipse/jgit/transport/BaseReceivePack$MessageOutputWrapper;
.super Ljava/io/OutputStream;
.source "BaseReceivePack.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/BaseReceivePack;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MessageOutputWrapper"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jgit/transport/BaseReceivePack;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/transport/BaseReceivePack;)V
    .locals 0
    .parameter

    .prologue
    .line 321
    iput-object p1, p0, Lorg/eclipse/jgit/transport/BaseReceivePack$MessageOutputWrapper;->this$0:Lorg/eclipse/jgit/transport/BaseReceivePack;

    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    return-void
.end method


# virtual methods
.method public flush()V
    .locals 1

    .prologue
    .line 351
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack$MessageOutputWrapper;->this$0:Lorg/eclipse/jgit/transport/BaseReceivePack;

    iget-object v0, v0, Lorg/eclipse/jgit/transport/BaseReceivePack;->msgOut:Ljava/io/OutputStream;

    if-eqz v0, :cond_0

    .line 353
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack$MessageOutputWrapper;->this$0:Lorg/eclipse/jgit/transport/BaseReceivePack;

    iget-object v0, v0, Lorg/eclipse/jgit/transport/BaseReceivePack;->msgOut:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 358
    :cond_0
    :goto_0
    return-void

    .line 354
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public write(I)V
    .locals 1
    .parameter "ch"

    .prologue
    .line 324
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack$MessageOutputWrapper;->this$0:Lorg/eclipse/jgit/transport/BaseReceivePack;

    iget-object v0, v0, Lorg/eclipse/jgit/transport/BaseReceivePack;->msgOut:Ljava/io/OutputStream;

    if-eqz v0, :cond_0

    .line 326
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack$MessageOutputWrapper;->this$0:Lorg/eclipse/jgit/transport/BaseReceivePack;

    iget-object v0, v0, Lorg/eclipse/jgit/transport/BaseReceivePack;->msgOut:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 331
    :cond_0
    :goto_0
    return-void

    .line 327
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public write([B)V
    .locals 2
    .parameter "b"

    .prologue
    .line 346
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/eclipse/jgit/transport/BaseReceivePack$MessageOutputWrapper;->write([BII)V

    .line 347
    return-void
.end method

.method public write([BII)V
    .locals 1
    .parameter "b"
    .parameter "off"
    .parameter "len"

    .prologue
    .line 335
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack$MessageOutputWrapper;->this$0:Lorg/eclipse/jgit/transport/BaseReceivePack;

    iget-object v0, v0, Lorg/eclipse/jgit/transport/BaseReceivePack;->msgOut:Ljava/io/OutputStream;

    if-eqz v0, :cond_0

    .line 337
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/BaseReceivePack$MessageOutputWrapper;->this$0:Lorg/eclipse/jgit/transport/BaseReceivePack;

    iget-object v0, v0, Lorg/eclipse/jgit/transport/BaseReceivePack;->msgOut:Ljava/io/OutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 342
    :cond_0
    :goto_0
    return-void

    .line 338
    :catch_0
    move-exception v0

    goto :goto_0
.end method
